-- Show all unique cities in one province
-- for patients
SELECT
  pr.province_name, 
  pa.city, 
  COUNT(pa.city)
 FROM patients pa
 JOIN provinces pr 
  ON pa.province_id = pr.province_id
 GROUP BY pa.city
 HAVING count(pa.city) IS 1;

-- for vendors
SELECT
  pr.province_name, 
  v.city, 
  COUNT(v.city)
 FROM vendors v
 JOIN provinces pr
  ON v.province_id = pr.province_id
 GROUP BY v.city
 HAVING COUNT(v.city) IS 1;

-- with count of unique cities for vendors
SELECT
  p.province_name, 
  (SELECT
	      COUNT(*)
	     FROM
	       (SELECT
		          province_id,
			          COUNT(city)
				         FROM vendors
					        GROUP BY city
						        HAVING COUNT(city) IS 1)
						    GROUP BY province_id) AS 'number_unique_cities'
					  FROM vendors v
					   JOIN provinces p
					    ON p.province_id = v.province_id
					  GROUP BY p.province_id;
