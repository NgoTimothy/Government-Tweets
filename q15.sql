-- @author Lucas Knoll
use group20;
drop procedure if exists q15;
CREATE PROCEDURE q15(in givenSubCat text, in givenYear integer(4), in givenMonth integer(2))
select u.screen_name, u.ofstate, CONCAT(urlused.url)
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN urlused ON tweets.tid = urlused.tid
where u.sub_category = givenSubCat AND YEAR(tweets.posted) = givenYear AND MONTH(tweets.posted) = givenMonth
group by u.screen_name;