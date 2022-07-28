-- for vendors
select A.vendor_id, C.province_name 
  from vendors A
   join provinces C
    on A.province_id = C.province_id
 where C.province_name = 'Manitoba'
  
  union all
  
select A.vendor_id, C.province_name
  from vendors A 
   join provinces C
    on A.province_id = C.province_id
 where C.province_name = 'Alberta'

order by C.province_name  


-- for patients (out of task, has patients from those provinces)
select A.first_name, A.last_name, B.province_name 
  from patients A
   join provinces B
    on A.province_id = B.province_id
 where B.province_name = 'Manitoba'
  
  union all
  
select A.first_name, A.last_name, B.province_name
  from patients A 
   join provinces B
    on A.province_id = B.province_id
 where B.province_name = 'Alberta'

order by B.province_name     

