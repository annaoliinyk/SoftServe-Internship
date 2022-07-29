-- Show all vendors in the same city and province
SELECT 
  v.vendor_name, 
  p.province_name,
  v.city
 FROM vendors v
  JOIN provinces p
   ON v.province_id = p.province_id
 ORDER BY v.province_id, v.city

