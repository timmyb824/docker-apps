CREATE USER 'exporter'@'%' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON *.* TO 'exporter'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'password123';
-- GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'localhost';
-- GRANT SELECT ON performance_schema.* TO 'exporter'@'localhost';
