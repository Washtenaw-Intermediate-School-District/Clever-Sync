set heading off
set pagesize 0
set linesize 1000
set feedback off
set trimspool on
spool D:\export\Clever\Data\schools.csv
PROMPT School_id,School_name,School_number,State_id,Low_grade,High_grade,Principal,Principal_email,School_address,School_city,School_state,School_zip,School_phone
select
sch.school_number||','||
sch.name||','||
sch.school_number||','||
sgx.adminunit||','||
case to_char(sch.low_grade)
when '-2' then 'Preschool'
else to_char(sch.low_grade)
end||','||
sch.high_grade||','||
sch.principal||','||
sch.principalemail||','||
sch.schooladdress||','||
sch.schoolcity||','||
sch.schoolstate||','||
sch.schoolzip||','||
sch.schoolphone
from schools sch
join s_mi_sch_tsdl_x sgx on sch.dcid=sgx.schoolsdcid
WHERE
    sch.school_number IN (1925,1923,3000,9404,1153,1157,2988,1705,798,2062,1938);
spool off;