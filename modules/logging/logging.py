import sqlite3
from datetime import datetime

errorcodes = {'UNKNOWN': 'UNKNW0001',
              'UNDEF'  : 'UNDEF0001',
              'DMLERR' : 'DMLERR001',
              'SUCCESS': 'ERR_SUCCESS'}

class Logger(object):

    events = []

    def __init__(self, db_path = None):
        self.params = dict.fromkeys(['date_utc', 'loglog_severitylevel', 'errorcode', 'mesasage'])
        self.db_path = db_path
    def __str__(self):
        return str(self.params)

    @property
    def Debug(self):
        self.params['log_severity'] = 'DEBUG'
        return self

    @property
    def Info(self):
        self.params['log_severity'] = 'INFO'
        return self

    @property
    def Warning(self):
        self.params['log_severity'] = 'WARNING'
        return self

    @property
    def Error(self):
        self.params['log_severity'] = 'ERROR'
        return self

    def ErrorCode(self, errorcode):
        self.params['errorcode'] = errorcode
        return self

    def Message(self, message):
        self.params['message'] = message
        return self

    def UseConnection(self, conn):
        self.conn = conn
        return self

    def WriteEventWithNewConnection(self, db_path):
        self.conn = sqlite3.connect(db_path)
        self.write()
        self.conn.close()

    def WriteAllOpenEventsWithNewConnection(self, db_path):
        self.conn = sqlite3.connect(db_path)
        self.WriteAll()
        self.conn.close()

    @property
    def write(self):
        sql = ''' INSERT INTO logging (date_utc, log_severity, log_errorcode, log_message) \
                  VALUES (strftime('%Y-%m-%d %H:%M:%f','now'), ?, ?, ?) '''
        params = (self.params['log_severity'], self.params.get('errorcode', ''), self.params['message'])
        self.cursor = self.conn.cursor()
        try:
            self.cursor.execute(sql, params)
            self.conn.commit()
        except sqlite3.OperationalError as msg:
            date_utc = datetime.utcnow()
            self.events.append((date_utc, 'WARNING', errorcodes['DMLERR'], 'Cannot write to Database: ' + str(msg)))
            self.events.append((date_utc,) + params)

    def WriteAll(self):
        self.cursor = self.conn.cursor()
        if not self.events:
            sql = ''' INSERT INTO logging (date_utc, log_severity, log_errorcode, log_message) \
                      VALUES (strftime('%Y-%m-%d %H:%M:%f', 'now'), 'INFO', 'ERROR_SUCCESS', 'No not written log events') '''
            self.cursor.execute(sql)
        else:
            sql = ''' INSERT INTO logging (date_utc, log_severity, log_errorcode, log_message) \
                      VALUES (?, ?, ?, ?) '''
            for event in self.events:
                self.cursor.execute(sql, event) 
        self.conn.commit()

        
    
if __name__ == '__main__':
    # logging = Logger()
    # logging.Warning.ErrorCode(errorcodes['UNKNOWN']).Message("Ein Lichtblick").write
    
    params = ('bla', 'blo')
    date_utc = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%f")
    params = (date_utc,) + params
    print(params)