insert into user_mst_tb values (0, 'abc', '1234');

select *
from
	user_mst_tb;
    
delete
from
	user_mst_tb
where
	username = 'abc';