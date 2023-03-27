select case pref_name
	when '徳島' then '四国'
	when '香川' then '四国'
	when '愛媛' then '四国'
	when '高知' then '四国'
	when '福岡' then '九州'
	when '佐賀' then '九州'
	when '長崎' then '九州'
	else 'その他' end as district,
	sum(population)
from poptbl
group by case pref_name
	when '徳島' then '四国'
	when '香川' then '四国'
	when '愛媛' then '四国'
	when '高知' then '四国'
	when '福岡' then '九州'
	when '佐賀' then '九州'
	when '長崎' then '九州'
	else 'その他' end
order by district desc;

select case pref_name
	when '徳島' then '四国'
	when '香川' then '四国'
	when '愛媛' then '四国'
	when '高知' then '四国'
	when '福岡' then '九州'
	when '佐賀' then '九州'
	when '長崎' then '九州'
	else 'その他' end as district,
	sum(population)
from poptbl
group by district
order by district desc;


select case 
	when population < 100 then '01'
	when population >= 100 and population < 200 then '02'
	when population >= 200 and population < 300 then '03'
	when population >= 300 then '04'
	else null end as popclass,
	count(*) as cnt
from poptbl
group by case 
  when population < 100 then '01'
	when population >= 100 and population < 200 then '02'
	when population >= 200 and population < 300 then '03'
	when population >= 300 then '04'
	else null end
	order by popclass;

select case 
	when population < 100 then '01'
	when population >= 100 and population < 200 then '02'
	when population >= 200 and population < 300 then '03'
	when population >= 300 then '04'
	else null end as popclass,
	count(*) as cnt
from poptbl
group by popclass
order by popclass;


select 
	pref_name,
	sum(case when sex = '1' then population else 0 end) as cnt_m,
	sum(case when sex = '2' then population else 0 end) as cnt_w
from PopTbl2
group by pref_name;


update SomeTable 
set p_key = case when p_key = 'a' then 'b'
								 when p_key = 'b' then 'a'
								 else p_key end
WHERE p_key in ('a', 'b');


SELECT course_name,
       CASE WHEN course_id IN
                    (SELECT course_id FROM OpenCourses
                      WHERE month = 201806) THEN '○'
            ELSE '×' END AS "6 月",
       CASE WHEN course_id IN
                    (SELECT course_id FROM OpenCourses
                      WHERE month = 201807) THEN '○'
            ELSE '×' END AS "7 月",
       CASE WHEN course_id IN
                    (SELECT course_id FROM OpenCourses
                      WHERE month = 201808) THEN '○'
            ELSE '×' END AS "8 月"
  FROM CourseMaster;