set heading off
set pagesize 0
set linesize 1000
set feedback off
set trimspool on
spool D:\export\clever\data\staff.csv
PROMPT School_id,Staff_id,Staff_email,First_name,Last_name,Title,Username
select
ss.schoolid||','||
u.dcid||','||
u.email_addr||','||
u.first_name||','||
u.last_name||','||
u.title||','||
u.loginid  
from schoolstaff ss
join users u on ss.users_dcid=u.dcid
join s_mi_ssf_tsdl_x stx on ss.dcid=stx.schoolstaffdcid
where ss.status=1
and u.psaccess=1
and ss.schoolid IN ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938')
and u.EMAIL_ADDR IS NOT NULL;
spool off;