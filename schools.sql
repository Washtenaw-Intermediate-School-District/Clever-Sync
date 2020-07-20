SELECT
    schools.school_number,
    schools.name,
    schools.school_number,
    S_MI_SCH_TSDL_X.adminunit,
    schools.low_grade,
    schools.high_grade,
    schools.principal,
    schools.principalemail,
    schools.schooladdress,
    schools.schoolcity,
    schools.schoolstate,
    schools.schoolzip,
    schools.schoolphone

FROM
    schools
    JOIN S_MI_SCH_TSDL_X ON schools.dcid = S_MI_SCH_TSDL_X.schoolsdcid
    
WHERE
    schools.school_number IN (1925,1923,3000,9404,1153,1157,2988,1705,798,2062,1938)