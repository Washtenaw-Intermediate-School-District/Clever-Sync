select
    ss.schoolid,
    u.dcid,
    u.teachernumber,
    stx.reppic,
    u.email_addr,
    u.first_name,
    u.middle_name,
    u.last_name,
    u.title,
    u.loginid
    --,null as password Is this necessary if we are using Google for SSO?
    
from schoolstaff ss
    join users u on ss.users_dcid=u.dcid
    join s_mi_ssf_tsdl_x stx on ss.dcid=stx.schoolstaffdcid -- this excludes any teacher who does not have a PIC number filled out

where ss.status=1
    and u.ptaccess=1
    and ss.schoolid IN ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938')
    and ss.id in (select distinct sec.teacher from sections sec where sec.termid in (select t.id from terms t where sysdate between t.firstday-20 and t.lastday+20) and sec.schoolid IN ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938'))

order by u.LAST_NAME