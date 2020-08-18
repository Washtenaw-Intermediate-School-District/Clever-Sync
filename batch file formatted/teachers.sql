set heading off
set pagesize 0
set linesize 1000
set feedback off
set trimspool on
spool D:\export\Clever\Data\teachers.csv
PROMPT School_id,Teacher_id,Teacher_number,State_teacher_id,Teacher_email,First_name,Middle_name,Last_name,Title,Username
select
ss.schoolid||','||
u.dcid||','||
u.teachernumber||','||
stx.reppic||','||
u.email_addr||','||
u.first_name||','||
u.middle_name||','||
u.last_name||','||
u.title||','||
u.loginid
from schoolstaff ss
join users u on ss.users_dcid=u.dcid
join s_mi_ssf_tsdl_x stx on ss.dcid=stx.schoolstaffdcid
where ss.status=1
and u.ptaccess=1
and ss.id in (select sec.teacher from sections sec where sec.termid in (select t.id from terms t where sysdate between t.firstday-40 and t.lastday+20) and sec.schoolid IN ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938'));
spool off;