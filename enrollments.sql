select
    cc.schoolid,
    cc.sectionid,
    cc.studentid

from cc

where 
    cc.schoolid in (1925,1923,3000,9404,1153,1157,2988,1705,798,2062,1938)
    and sysdate between cc.dateenrolled-20 and cc.dateleft+20