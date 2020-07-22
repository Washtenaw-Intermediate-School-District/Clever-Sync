select
    sec.schoolid,
    sec.id,
    ss.users_dcid AS "Teacher_ID",
    (
        SELECT 
            users.dcid
        FROM schoolstaff
            JOIN users ON schoolstaff.users_dcid = users.dcid
            JOIN sectionteacher ON schoolstaff.id = sectionteacher.teacherid
            JOIN sections ON sectionteacher.sectionid = sections.id
            JOIN s_mi_ssf_tsdl_x ON schoolstaff.dcid = s_mi_ssf_tsdl_x.schoolstaffdcid
            JOIN s_mi_sec_tsdl_x ON s_mi_sec_tsdl_x.sectionsdcid = sections.dcid
        WHERE sec.id = sectionteacher.sectionid AND s_mi_ssf_tsdl_x.reppic = s_mi_sec_tsdl_x.coteacher1
    ) AS "Teacher_2_ID",
    (
        SELECT 
            users.dcid
        FROM schoolstaff
            JOIN users ON schoolstaff.users_dcid = users.dcid
            JOIN sectionteacher ON schoolstaff.id = sectionteacher.teacherid
            JOIN sections ON sectionteacher.sectionid = sections.id
            JOIN s_mi_ssf_tsdl_x ON schoolstaff.dcid = s_mi_ssf_tsdl_x.schoolstaffdcid
            JOIN s_mi_sec_tsdl_x ON s_mi_sec_tsdl_x.sectionsdcid = sections.dcid
        WHERE sec.id = sectionteacher.sectionid AND s_mi_ssf_tsdl_x.reppic = s_mi_sec_tsdl_x.coteacher2
    ) AS "Teacher_3_ID",
    sec.section_number,
    sec.grade_level,
    replace(crs.course_name, ',',''),
    sec.course_number,
    sec.expression,
    crs.SCHED_COURSESUBJECTAREACODE,
    t.abbreviation,
    to_char(t.firstday, 'MM/DD/YYYY'),
    to_char(t.lastday, 'MM/DD/YYYY')
    
from sections sec
    join courses crs on sec.course_number=crs.course_number
    join terms t on sec.termid=t.id and sec.schoolid=t.schoolid
    left join schoolstaff ss on sec.teacher=ss.id
    
where 
    sysdate between t.firstday and t.lastday
    and sec.schoolid in ('1925','1923','3000','9404','1153','1157','2988','1705','798','2062','1938')
    and sec.id in (select distinct cc.sectionid from cc where sysdate between cc.dateenrolled-10 and cc.dateleft+10)