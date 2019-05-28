-- @author Timothy Ngo
use group20b;

drop procedure if exists q1;
CREATE PROCEDURE q1(in maxResults integer(3), in givenMonth integer(2), in givenYear integer(4))
select t.retweet_count, t.textbody, u.screen_name, u.category, u.sub_category
from users u, tweets t where MONTH(t.posted) = givenMonth and YEAR(t.posted) = givenYear
order by t.retweet_count desc limit maxResults;