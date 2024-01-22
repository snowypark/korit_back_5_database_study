insert into author_tb
select
	0,
	author
from
	temp_book_tb
group by
	author
order by
	author;

insert into publisher_tb
select
	0,
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;

insert into book_tb
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb tbt
    left outer join author_tb at on(at.author_name = tbt.author)
    left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	tbt.book_name,
    at.author_id,
    pt.publisher_id;

insert into book_register_tb
select
	0,
	tbt.book_code,
    bt2.book_id,
    temp_book_tb,
    tbt.loans_count
from
	temp_book_tb tbt
    left outer join (select
						bt.book_id,
						bt.book_name,
						at.author_name,
						pt.publisher_name
					from
						book_tb bt
                        left outer join author_tb at on(at.author_id = bt.author_id)
                        left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)) bt2 
		on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher);
        
        
#개수출력    
select 
		*,
	(select 
		count(*)
	from
		publisher_tb) as total_count
from
	publisher_tb;
    
#서브쿼리는 column에 사용하면 속도 하락. join 이용 
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count
					from publisher_tb) pt2 on(1=1);
    
select
	*
from
	book_tb
where
	publisher_id in (select publisher_id
					 from publisher_tb
					where publisher_name like '아%');

select *
from
	book_tb bt
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';
    
    
    
select @@profiling;

show profiles;

set profiling = 1;