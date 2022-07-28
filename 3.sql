SELECT DISTINCT 
  pr.province_name, 
  pa.city
 FROM patients pa
  JOIN provinces pr
   ON pa.province_id = pr.province_id
 ORDER BY pr.province_name;

