-- Show all vendors which are in Alberta and Manitoba
-- for vendors
SELECT
  a.vendor_id, 
  c.province_name 
 FROM vendors a
  JOIN provinces c
   ON a.province_id = c.province_id
 WHERE c.province_name
  IN ('Manitoba', 'Alberta')
ORDER BY c.province_name  


-- for patients (out of task, has patients from those provinces)
SELECT 
  a.first_name, 
  a.last_name, 
  b.province_name 
 FROM patients a
  JOIN provinces b
   ON a.province_id = b.province_id
 WHERE b.province_name
  IN ('Manitoba', 'Alberta')
ORDER BY b.province_name             

