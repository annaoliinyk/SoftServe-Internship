SELECT DISTINCT Pr.province_name, Pa.city
 FROM patients Pa
 JOIN provinces Pr
  ON Pa.province_id = Pr.province_id
 ORDER BY Pr.province_name;

