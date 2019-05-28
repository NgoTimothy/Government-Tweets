-- @author Timothy Ngo
use group20;

drop procedure if exists q27;
CREATE PROCEDURE q27(in maxResults integer(3), in givenMonth1 integer(2), in givenMonth2 integer(2), in givenYear integer(4))
select u.screen_name
from users u, tweets t
where MONTH(t.posted) = givenMonth1 and YEAR(t.posted) = givenYear and u.screen_name = t.posting_user
or MONTH(t.posted) = givenMonth2 and YEAR(t.posted) = givenYear and u.screen_name = t.posting_user
group by t.posting_user
order by SUM(t.retweet_count) DESC limit maxResults;