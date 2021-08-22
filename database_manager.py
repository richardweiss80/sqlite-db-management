import sqlite3
import argparse
import os.path
import hashlib
import modules.logging as log
from os import listdir
from pathlib import Path

path_of_script = os.path.dirname(__file__)
db_scripts = os.path.join(path_of_script, "dbscripts")

def sort_by_identifier(x):
    return x[:11]

def getSHA256FromFile(file):
    BLOCKSIZE = 65536
    hash_sha256 = hashlib.sha256()

    with open(file, 'rb') as file_tobehashed:
        buf = file_tobehashed.read(BLOCKSIZE)
        while len(buf) > 0:
            hash_sha256.update(buf)
            buf = file_tobehashed.read(BLOCKSIZE)
    return hash_sha256.hexdigest()

def initDatabaseConnection():
    return sqlite3.connect(database)

def closeDatabaseConnection(conn):
    conn.close()

def UpdateDataBase():
    modules = ['base']
    if arguments.module:
        modules.append(arguments.module)
    for module in modules:
        file_list = os.listdir(os.path.join(db_scripts, module))
        for filename in sorted(file_list, key = sort_by_identifier):
            modifyDatabaseDefinition(filename, module)
    event_logger.WriteAllOpenEventsWithNewConnection(database)

    
def modifyDatabaseDefinition(filename, module):
    conn = initDatabaseConnection()
    if filename.startswith("ddl"):
        if not arguments.force and isScriptDeployed(conn, filename):
            return
        type = "dll"
    elif filename.startswith("dml"):
        type = "dml"
    else:
        return
    with open(os.path.join(db_scripts, module, filename),'r') as scriptfile:
        sql_script = scriptfile.read()
    cursor = conn.cursor()
    cursor.executescript(sql_script)
    conn.commit
    addScriptDeploymentStatus(conn, filename, type, module)
    conn.commit
    event_logger.Info.ErrorCode(log.errorcodes['SUCCESS']).Message('Deployed ' + type + "Script: " + filename).UseConnection(conn).write
    closeDatabaseConnection(conn)

def addScriptDeploymentStatus(conn, filename, scripttype, module):
    sha256_hash = getSHA256FromFile(os.path.join(db_scripts, module, filename))
    sql = ''' INSERT INTO scriptexecution (filename, hash_sha256, date_utc, sql_type, module) \
              VALUES (?, ?, datetime('now'), ?, ?) '''
    params = (filename, sha256_hash, scripttype, module)
    cursor = conn.cursor()
    cursor.execute(sql, params)
    conn.commit()          
    
def isScriptDeployed(conn, filename):
    sha256_hash = getSHA256FromFile(db_scripts + filename)
    sql = ''' SELECT count(filename) FROM scriptexecution WHERE filename=? AND hash_sha256=? '''
    params = (filename, sha256_hash)
    cursor = conn.execute(sql, params)
    if cursor.fetchone()[0]==1:
        return True
    else:
        return False

def CheckDataBaseIntegrity():
    conn = initDatabaseConnection()

    sql = ''' SELECT filename,hash_sha256,module FROM scriptexecution '''
    cursor = conn.execute(sql)
    deployed_scripts = cursor.fetchall()

    db_integrity_result = True

    closeDatabaseConnection(conn)
    for sqlscript in deployed_scripts:
        hash_filesystem = getSHA256FromFile(os.path.join(db_scripts, sqlscript[2], sqlscript[0]))
        file_integrity_result = hash_filesystem == sqlscript[1]
        print("{:<50} {}   {}".format(sqlscript[0], hash_filesystem, str(file_integrity_result)))
   
    print("Database-Integrity: %s" % (db_integrity_result))

def initDatabase():
    if os.path.isfile(database) and not arguments.force:
        print("An databasefile seems to be exist. No init possible. Enforce init and file will be deleted. YOU SHOULD BACKUP THE FILE BEFORE DELETING THE FILE")
        return
    elif os.path.isfile(database) and arguments.force:
        os.remove(database)
    UpdateDataBase()


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--init", help="Legt eine neue Datenbank an", action="store_true")
    parser.add_argument("-f", "--force", help="Enfording new initialisation of database", action="store_true")
    parser.add_argument("--update", help="Update Database", action="store_true")
    parser.add_argument("--check", help="Checks Hashvalues of deployed scripts", action="store_true")
    parser.add_argument("-db", "--database", help="absolute path and name of the database, if module argument is used, dbdefault:=modulename", default="default")
    parser.add_argument("-mod", "--module", help="creation of tool specific database")
    arguments = parser.parse_args()
    
    database = arguments.database

    if arguments.database == 'default':
        if arguments.module:
            database = arguments.module
        database = os.path.join(os.path.dirname(__file__),"output", '.'.join([database, "db"]))
    
    event_logger = log.Logger(database)

    if arguments.init:
        initDatabase()
    elif arguments.update:
        UpdateDataBase()
    elif arguments.check:
        CheckDataBaseIntegrity()
    