use group20b;

drop procedure if exists q10;
CREATE PROCEDURE q10(in maxResults integer(3), in listState text, givenMonth integer(2), givenYear integer(4))
select CONCAT(tagged.hastagname), u.ofstate
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
where YEAR(tweets.posted) = givenYear AND MONTH(tweets.posted) = givenMonth AND find_in_set(tagged.hastagname, listState) > 0
limit maxResults;