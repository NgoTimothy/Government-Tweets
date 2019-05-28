-- @author Timothy Ngo
use group20b;

drop procedure if exists q3;
CREATE PROCEDURE q3(in maxResults integer(3), in givenYear integer(4))
SELECT tagged.hastagname, count(distinct users.ofstate) as cnt, group_concat(distinct users.ofstate)
FROM users JOIN tweets ON users.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
WHERE YEAR(posted) = givenYear
GROUP BY tagged.hastagname
ORDER BY COUNT(users.ofstate) DESC limit maxResults;