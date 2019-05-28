-- @author Timothy Ngo
use group20b;
DROP procedure if exists insertNewUser;
CREATE PROCEDURE insertNewUser(IN uName VARCHAR(50), IN rName TEXT, IN subCat TEXT,  IN cat TEXT,  IN uState TEXT,  IN numFollow INT(11), IN uFollowing INT(11))
INSERT INTO users(screen_name, name, sub_category, category, ofstate, numFollowers, numFollowing) VALUES (uName, rName, subCat, cat, uState, numFollow, uFollowing);