SELECT * FROM db_study.author_tb;

#// 도서명 / 저자명 / 출판사

    
select 
	book_name
from book_tb;    
    
    
select
	0,
	bt.book_name,
	at.author_name,
	pt.publisher_name
from
	book_tb bt
		left outer join author_tb at on(at.author_id = bt.author_id)
		left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
group by
	bt.book_name,
    at.author_id,
    pt.publisher_id;
    