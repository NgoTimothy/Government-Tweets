use group20b;
drop procedure if exists q23;
CREATE PROCEDURE q23(in maxResults integer(3), in givenYear integer(4), in givenMonths text, in givenSubCat text)
select tagged.hastagname, COUNT(tagged.hastagname) as cnt
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
where u.sub_category = givenSubCat AND YEAR(tweets.posted) = givenYear AND find_in_set(MONTH(posted), givenMonths) > 0
Group by tagged.hastagname
order by cnt desc limit maxResults;