CREATE USER cursoplsql IDENTIFIED BY cursoplsql
                        DEFAULT tablespace users;
                        
GRANT connect, resource TO cursoplsql;