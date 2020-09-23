select
    sec.schoolid,
    sec.id,
    ss.users_dcid AS "Teacher_ID",
    sec.section_number,
    sec.grade_level,
    replace(crs.course_name, ',',''),
    sec.course_number,
    '"' || sec.expression ||'"',
    crs.SCHED_COURSESUBJECTAREACODE,
    t.abbreviation,
    to_char(t.firstday, 'MM/DD/YYYY'),
    to_char(t.lastday, 'MM/DD/YYYY'),
    sec.termid
    
from sections sec
    join courses crs on sec.course_number=crs.course_number
    join terms t on sec.termid=t.id and sec.schoolid=t.schoolid
    left join schoolstaff ss on sec.teacher=ss.id
    
where 
    sysdate between t.firstday and t.lastday
    and sec.schoolid in ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938')
	and sec.id in (select distinct cc.sectionid from cc where sysdate between cc.dateenrolled-40 and cc.dateleft+10)
	--and sec.termid >= 3000