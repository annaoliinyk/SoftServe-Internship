select A.vendor_name as '1st_vendor', case
    when B.vendor_name = A.vendor_name then ''
	    else B.vendor_name
		    end as '2nd_vendor',
		      A.province_id, A.city
		 from vendors A
		    cross join vendors B
		    on A.city = B.city 
		     and A.province_id = B.province_id
		 group by A.province_id, A.city
		 order by A.province_id, A.city;

