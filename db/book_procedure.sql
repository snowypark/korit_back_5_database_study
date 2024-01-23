set @book_name = '자바의 정석';
set @author = '남궁성';
set @publisher = '도우출판';
set @new_author_id = 0;
set @new_publisher_id = 0;

insert into author_tb
values (0, @author);

insert into publisher_tb
values (0, @publisher);

select 
	max(author_id) into @new_author_id
from 
	author_tb;

select
	max(publisher_id) into @new_publisher_id
from
    publisher_tb;


insert into book_tb
values (0, @book_name, @new_author_id, @new_publisher_id);

select
	*
from
	book_tb
order by
	book_id desc;
    
#------------    
    
set @book_name = '혼자 공부하는 SQL';
set @author = '우재남';
set @publisher = '한빛미디어';


call p_insert_book("자바의 정석2","남궁성","한빛");