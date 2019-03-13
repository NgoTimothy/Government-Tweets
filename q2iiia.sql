use tngo;
select distinct s.sid, sname
 from suppliers s, catalog c, parts p
 where c.sid=s.sid and c.pid = p.pid and p.color='blue' and
 s.sid in 
 (select s.sid
 from suppliers s, catalog c, parts p
 where c.sid=s.sid and c.pid = p.pid and p.color='green')
