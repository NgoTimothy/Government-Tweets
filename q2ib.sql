use tngo;

DROP INDEX sname on suppliers;
CREATE INDEX sname
on suppliers (sname);

select s.sid, s.sname
from suppliers s
where s.sname = 'Amazon';