-- @author Timothy Ngo
use group20b;

drop procedure if exists q2;
CREATE PROCEDURE q2(in maxResults integer(3), in givenMonth integer(2), in givenYear integer(4), in givenHash text)
select u.screen_name, u.category, t.textbody, t.retweet_count
from tagged h, tweets t, users u
where MONTH(t.posted) = givenMonth and YEAR(t.posted) = givenYear and h.hastagname = givenHash 
and h.tid = t.tid and t.posting_user = u.screen_name
order by t.retweet_count desc limit maxResults;