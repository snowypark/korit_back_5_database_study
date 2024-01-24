SELECT * FROM db_study.author_tb;
    
select 
	*    
from book_tb;  
#-------------------------------    
select
	bt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name
from
	book_tb bt
    left outer join author_tb at on(at.author_id = bt.author_id)
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	bt.book_name like '%?%';

#-------------------------------
    
select
    bt.book_id,
	bt.book_name,
    at.author_id,
	at.author_name,
    pt.publisher_id,
	pt.publisher_name
from
	book_register_tb brt
		left outer join book_tb bt on(bt.book_id = brt.book_id)
		left outer join author_tb at on(at.author_id = bt.author_id)
		left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
order by
	bt.book_id;
##----------------------    
    
SELECT 
	bt.book_id, bt.book_name, 
    at.author_id, 
    at.author_name, 
    pt.publisher_id, 
    pt.publisher_name
FROM 
	book_register_tb brt 
    LEFT JOIN book_tb bt ON brt.book_id = bt.book_id 
	LEFT JOIN author_tb at ON bt.author_id = at.author_id 
	LEFT JOIN publisher_tb pt ON bt.publisher_id = pt.publisher_id
WHERE 
	bt.book_name LIKE ? 
ORDER BY 
	bt.book_id;