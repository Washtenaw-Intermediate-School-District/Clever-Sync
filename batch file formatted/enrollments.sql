set heading off
set pagesize 0
set linesize 1000
set feedback off
set trimspool on
spool D:\export\Clever\data\enrollments.csv
PROMPT School_id,Section_id,Student_id

select
cc.schoolid||','||
cc.sectionid||','||
students.dcid
from cc
join students on cc.studentid = students.id
where 
    cc.schoolid in (1925,1923,3000,9404,1153,1157,2988,1705,798,2062,1938)
    and sysdate between cc.dateenrolled-40 and cc.dateleft+20;
spool off;