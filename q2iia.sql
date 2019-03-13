use tngo;

select distinct s.sid, sname
from suppliers s, catalog c, parts p
where (p.color="blue") and p.pid=c.pid and s.sid=c.sid
union
select distinct s.sid, sname
from suppliers s, catalog c, parts p
where (p.color="green") and p.pid=c.pid and s.sid=c.sid