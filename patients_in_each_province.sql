-- Show total count of all patients in each province
SELECT 
  pr.province_name,
  COUNT(pa.patient_id) AS 'total_count'
 FROM patients pa
  JOIN provinces pr 
   ON pa.province_id = pr.province_id
 GROUP BY pa.province_id;

