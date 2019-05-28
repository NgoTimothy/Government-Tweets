use group20b;
-- @author Timothy Ngo
drop procedure if exists deleteUser;
delimiter //
CREATE PROCEDURE deleteUser(in uName VARCHAR(50))
BEGIN
IF NOT EXISTS (select 1 from users where screen_name = uName) THEN
	ROLLBACK;
ELSE 
	DELETE FROM mentioned where tid in (select tid from tweets where posting_user = uName);
	DELETE FROM tagged where tid in (select tid from tweets where posting_user = uName);
	DELETE FROM tweets where posting_user = uName;
	DELETE FROM users where screen_name = uName;
END IF;
END//

delimiter ;
