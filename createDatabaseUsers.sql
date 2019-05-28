use group20b;

CREATE TABLE IF NOT EXISTS databaseUsers (
	dUname varchar(50),
    dPsw varchar(255),
    dRole varchar(10),
    primary KEY (dUname)
);

INSERT INTO databaseUsers(dUname, dPsw, dRole) VALUES ('Laknoll1010', sha('Frileywindows82'), 'read');
INSERT INTO databaseUsers(dUname, dPsw, dRole) VALUES ('Stange90', sha('Mango25'), 'admin');