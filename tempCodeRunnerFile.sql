select ranges."range" "Classsize",
count(section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021' 
                                    and course_t.ccourseid = section_t.ccourseid 
                                    and course_t.cdepartmentid = 'SBE') as "SBE",
count(section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021' 
                                    and course_t.ccourseid = section_t.ccourseid 
                                    and course_t.cdepartmentid = 'SELS') as "SELS",
count(section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021' 
                                    and course_t.ccourseid = section_t.ccourseid 
                                    and (course_t.cdepartmentid like 'SETS' 
                                    or course_t.cdepartmentid like 'PhySci'
                                    or course_t.cdepartmentid like'CSE'
                                    or course_t.cdepartmentid like 'EEE')) as "SETS",
count(section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021' 
                                    and course_t.ccourseid = section_t.ccourseid 
                                    and course_t.cdepartmentid = 'SLASS') as "SLASS",
count(section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021' 
                                    and course_t.ccourseid = section_t.ccourseid 
                                    and course_t.cdepartmentid = 'SPPH') as "SPPH",
count(distinct section_t.usectionid) filter (where section_t.csemesterid = 'Spring2021') as "sections"
                        from course_t,
                        (
                            select 1 minRange, 10 maxRange, '1-10' "range"
                            union all
                            select 11, 20, '11-20'
                            union all
                            select 21, 30, '21-30'
                            union
                            select 31, 40, '31-40'
                            union all
                            select 41, 50, '41-50'
                            union all
                            select 51, 60, '51-60'
                        ) as ranges
                        left join section_t
                            on section_t.nstudentenrolled between ranges.minRange and ranges.maxRange  
                        group by ranges.range
                        order by ranges.range