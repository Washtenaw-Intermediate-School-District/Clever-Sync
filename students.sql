select
    s.schoolid,
    s.dcid,
    s.student_number,
    s.state_studentnumber,
    s.last_name,
    s.middle_name,
    s.first_name,
    s.grade_level,
    s.gender,
    s.classof,
    to_char(s.dob, 'MM/DD/YYYY'),
    case s.ethnicity
        when 'C' then 'W'
        when 'O' then 'M'
        else s.ethnicity
    end,
    case to_char(sgx.ethnichispanic)
        when '1' then 'Y'
        else 'N'
    end,
    case sgx.leplanghome
        when 'eng' then 'English'
        when 'alb' then 'Albanian'
        when 'amh' then 'Amharic'
        when 'ara' then 'Arabic'
        when 'ben' then 'Bengali'
        when 'bos' then 'Bosnian'
        when 'bur' then 'Burmese'
        when 'chi' then 'Chinese'
        when 'dut' then 'Dutch'
        when 'per' then 'Farsi'
        when 'fre' then 'French'
        when 'ger' then 'German'
        when 'heb' then 'Hebrew'
        when 'hin' then 'Hindi'
        when 'hmn' then 'Hmong'
        when 'ilo' then 'Ilocano'
        when 'jpn' then 'Japanese'
        when 'jav' then 'Javanese'
        when 'kar' then 'Karen'
        when 'khm' then 'Khmer'
        when 'kor' then 'Korean'
        when 'lao' then 'Laotian'
        when 'lav' then 'Latvian'
        when 'may' then 'Malay'
        when 'nep' then 'Nepali'
        when 'orm' then 'Oromo'
        when 'pol' then 'Polish'
        when 'por' then 'Portuguese'
        when 'rum' then 'Romanian'
        when 'rus' then 'Russian'
        when 'smo' then 'Samoan'
        when 'srp' then 'Serbian'
        when 'som' then 'Somali'
        when 'spa' then 'Spanish'
        when 'swa' then 'Swahili'
        when 'tgl' then 'Tagalog'
        when 'tam' then 'Tamil'
        when 'tel' then 'Telugu'
        when 'tha' then 'Thai'
        when 'tir' then 'Tigrinya'
        when 'tur' then 'Turkish'
        when 'ukr' then 'Ukrainian'
        when 'urd' then 'Urdu'
        when 'vie' then 'Vietnamese'
        else null
    end,
    case to_char(sgx.flaglep)
        when '1' then 'Y'
        else 'N'
    end,
    case s.lunchstatus
        when 'FDC' then 'F'
        when 'RDC' then 'R'
        when 'F' then 'F'
        when 'R' then 'R'
        else 'N'
    end,
    case to_char(sgx.flagspeced)
        when '1' then 'Y'
        else 'N'
    end,
    replace(s.street,',',''),
    s.city,
    s.state,
    s.zip,
    ps_customfields.getcf('students',s.id,'YCS_Email'),
    codeset.code,
    CASE
        WHEN to_char(s.guardianemail) IS NULL THEN pssis_person_email.emailaddress
        ELSE to_char(s.guardianemail)
    END,
    null,
    s.student_number,
    ps_customfields.getcf('students',s.id,'YCS_NetworkPwd')
    
from students s
    join s_mi_stu_gc_x sgx on s.dcid=sgx.studentsdcid
    JOIN studentcontactassoc ON s.dcid = studentcontactassoc.studentdcid
    JOIN studentcontactdetail ON studentcontactassoc.studentcontactassocid = studentcontactdetail.studentcontactassocid
    JOIN codeset ON studentcontactdetail.relationshiptypecodesetid = codeset.codesetid
	JOIN person ON studentcontactassoc.personid = person.id
	LEFT OUTER JOIN pssis_person_email ON person.dcid = pssis_person_email.persondcid
    
    
where 
    s.id in (select cc.studentid from cc where sysdate between cc.dateenrolled-200 and cc.dateleft+200) 
    and s.schoolid IN (1925,1923,3000,9404,1153,1157,2988,1705,798,2062,1938)
    and s.student_number = 312479
    and	studentcontactdetail.liveswithflg = 1
