-- Show all vendors which are in Alberta and Manitoba
-- for vendors
SELECT
  A.vendor_id, 
  C.province_name 
 FROM vendors A
  JOIN provinces C
   ON A.province_id = C.province_id
 WHERE C.province_name
  IN ('Manitoba', 'Alberta')
ORDER BY C.province_name  


-- for patients (out of task, has patients from those provinces)
SELECT 
  A.first_name, 
  A.last_name, 
  B.province_name 
 FROM patients A
  JOIN provinces B
   ON A.province_id = B.province_id
 WHERE B.province_name
  IN ('Manitoba', 'Alberta')
ORDER BY B.province_name             

