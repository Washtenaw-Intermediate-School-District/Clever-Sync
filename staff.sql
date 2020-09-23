select
    ss.schoolid,
    u.dcid,
    u.email_addr,
    u.first_name,
    u.last_name,
    NULL,
    u.title,
    u.loginid
    
from schoolstaff ss
    join users u on ss.users_dcid=u.dcid
    join s_mi_ssf_tsdl_x stx on ss.dcid=stx.schoolstaffdcid -- this excludes any teacher who does not have a PIC number filled out

where ss.status=1
    and u.psaccess=1
    and ss.schoolid IN ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938')
    and u.EMAIL_ADDR IS NOT NULL

order by u.LAST_NAME