CREATE TABLE SCRIPTEXECUTION
(
    filename TEXT NOT NULL,
    hash_sha256 TEXT NOT NULL,
    date_utc TEXT NOT NULL,
    sql_type TEXT NOT NULL,
    module TEXT NOT NULL,
    PRIMARY KEY(filename, hash_sha256)
);