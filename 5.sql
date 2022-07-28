-- for patients
select Pr.province_name, Pa.city, count(Pa.city)
 from patients Pa
 join provinces Pr 
  on Pa.province_id = Pr.province_id
 group by Pa.city
 having count(Pa.city) is 1;

-- for vendors
select Pr.province_name, V.city, count(V.city)
 from vendors V
 join provinces Pr
  on V.province_id = Pr.province_id
 group by V.city
 having count(V.city) is 1;

-- with count of unique cities for vendors
select P.province_name, 
  (select count(*)
	    from
	     (select province_id, count(city)
		       from vendors
		      group by city
		      having count(city) is 1)
	   group by province_id) as 'n_unique_cities'
 from vendors V 
  join provinces P
   on P.province_id = V.province_id
 group by P.province_id;
