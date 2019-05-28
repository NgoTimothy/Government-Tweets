use group20b;
DROP procedure if exists getUserInfo;
CREATE PROCEDURE getUserInfo(IN uName VARCHAR(50), IN psw VARCHAR(255)) 
select dRole 
from databaseUsers
where dUname = uName and dPsw = sha(psw);