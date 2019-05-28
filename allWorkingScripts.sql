-- Q1, Q2, Q27, deleteUser and insertNewUser are written by Timothy Ngo
-- The rest are Lucas Knoll
/*Q1*/
use group20b;

set @k = 10;
set @givenMonth = 1;
set @givenYear = 2016;

select t.retweet_count, t.textbody, u.screen_name, u.category, u.sub_category
from users u, tweets t
where MONTH(t.posted) = @givenMonth and YEAR(t.posted) = @givenYear and t.posting_user = u.screen_name 
order by t.retweet_count desc limit 10;

/*q2*/
use group20b;
set @k = 10;
set @givenMonth = 1;
set @givenYear = 2016;
set @givenHash = 'coleg';

select u.screen_name, u.category, t.textbody, t.retweet_count
from tagged h, tweets t, users u
where MONTH(t.posted) = @givenMonth and YEAR(t.posted) = @givenYear and h.hastagname = @givenHash 
and h.tid = t.tid and t.posting_user = u.screen_name
order by t.retweet_count desc limit 10;


/*q3*/
use group20b;
set @k = 10;
set @givenYear = 2016;
set SQL_SELECT_LIMIT = @k;
SELECT tagged.hastagname, count(distinct users.ofstate) as cnt, group_concat(distinct users.ofstate)
FROM users JOIN tweets ON users.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
WHERE YEAR(posted) = @givenYear
GROUP BY tagged.hastagname
ORDER BY COUNT(users.ofstate)
limit 10;

/*q6*/
use group20b;
set @k = 10;
set @hash1 = ('DemDebate');
set @hash2 =('GOPDebate');
set @listHash = 'DemDebate,GOPDebate';

select u.screen_name, u.ofstate
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
where find_in_set(tagged.hastagname, @listHash) > 0
group by tweets.posting_user 
order by u.numFollowers desc 
limit 10;


/*q10*/
use group20b;
set @k = 10;
set @givenState1 = 'Alaska';
set @givenState2 = 'Ohio';
set @givenState3 = 'Alabama';
set @givenState = ('Ohio,Alaska,Alabama');
set @givenMonth = 1;
set @givenYear = 2016;

select CONCAT(tagged.hastagname), u.ofstate
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
where YEAR(tweets.posted) = @givenYear AND MONTH(tweets.posted) = @givenMonth AND find_in_set(tagged.hastagname, @givenState) > 0
limit 10;

/*q15*/
use group20b;
set @givenMonth = 1;
set @givenYear = 2016;
set @givenSubCat = 'democrat';
select u.screen_name, u.ofstate, group_concat(urlused.url)
from users u JOIN tweets t ON u.screen_name = t.posting_user JOIN urlused ON t.tid = urlused.tid
where u.sub_category = @givenSubCat AND YEAR(t.posted) = @givenYear AND MONTH(t.posted) = @givenMonth
group by u.screen_name
limit 10;

/*Q23*/
use group20b;
set @k = 10;
set @givenMonths = ('5,2');
set @givenYear = 2016;
set @givenSubCat = 'NA';
select tagged.hastagname, COUNT(tagged.hastagname) as cnt
from users u JOIN tweets ON u.screen_name = tweets.posting_user JOIN tagged ON tweets.tid = tagged.tid
where u.sub_category = @givenSubCat AND YEAR(tweets.posted) = @givenYear AND find_in_set(MONTH(posted), @givenMonths) > 0
Group by tagged.hastagname
order by cnt desc
limit 10;



/*Q27*/
use group20b;
set @k = 10;
set @givenMonth1 = 1;
set @givenMonth2 = 2;
set @givenYear1 = 2016;


select u.screen_name
from users u, tweets t
where MONTH(t.posted) = @givenMonth1 and YEAR(t.posted) = @givenYear1 and u.screen_name = t.posting_user
or MONTH(t.posted) = @givenMonth2 and YEAR(t.posted) = @givenYear1 and u.screen_name = t.posting_user
group by t.posting_user
order by SUM(t.retweet_count) DESC limit 10;

-- index posted and sub_category, hastagname