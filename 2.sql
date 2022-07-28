SELECT Pr.province_name, count(Pa.patient_id) AS 'total_count'
 FROM patients Pa
 JOIN provinces Pr 
  ON Pa.province_id = Pr.province_id
 GROUP BY Pa.province_id;
