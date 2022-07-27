--1
SELECT * FROM patients
where province_id is "ON";



-- 2
select Pr.province_name, count(Pa.patient_id) as 'Total count of patients'
from patients Pa
 join provinces Pr 
 on Pa.province_id = Pr.province_id
group by Pa.province_id;


-- 3
select distinct Pr.province_name, Pa.city
from patients Pa
 join provinces Pr
 on Pa.province_id = Pr.province_id
order by Pr.province_name;


-- 4
select A.vendor_name as 'First vendor name',
  case
	   when B.vendor_name = A.vendor_name
		    then ''
			   else B.vendor_name
				  end as 'Second vendor name',
				  A.province_id, A.city
				from vendors A
				 cross join vendors B
				 on A.city = B.city and A.province_id = B.province_id
				group by A.province_id, A.city
				order by A.province_id, A.city;

-- 5
-- for patients
select Pr.province_name, Pa.city, count(Pa.city)
from patients Pa
 join provinces Pr on Pa.province_id = Pr.province_id
group by Pa.city
having count(Pa.city) is 1;

-- for vendors
select Pr.province_name, V.city, count(V.city)
from vendors V
 join provinces Pr on V.province_id = Pr.province_id
group by V.city
having count(V.city) is 1;

-- with count of unique cities for vendors
select P.province_name, 
  ( select count(*) from
	     (select province_id, count(city) from vendors group by city having count(city) is 1)
	                     group by province_id
			  ) as 'Number on unique cities in province'
			from vendors V 
			  join provinces P
			    on P.province_id = V.province_id
			group by P.province_id;

-- 6
-- for vendors
 select A.vendor_id, C.province_name 
  from vendors A
   join provinces C on A.province_id = C.province_id
  where C.province_name = 'Manitoba'
union all
 select A.vendor_id, C.province_name
  from vendors A 
   join provinces C on A.province_id = C.province_id
  where C.province_name = 'Alberta'
order by C.province_name  

-- for patients (out of task, has patients from those provinces)
 select A.first_name, A.last_name, B.province_name 
  from patients A
   join provinces B on A.province_id = B.province_id
  where B.province_name = 'Manitoba'
union all
 select A.first_name, A.last_name, B.province_name
  from patients A 
   join provinces B on A.province_id = B.province_id
  where B.province_name = 'Alberta'
order by B.province_name             

