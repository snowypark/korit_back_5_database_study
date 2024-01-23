CREATE DEFINER=`aws`@`%` PROCEDURE `p_insert_book`(
	in v_book_name varchar(100),
	in v_author_name varchar(100),
    in v_publisher_name varchar(100),
    out v_new_book_id int
)
BEGIN
	declare _new_author_id int;
    declare _new_publisher_id int;

	insert into author_tb
	values (0, v_author_name);
    
    select 
	max(author_id) into _new_author_id
	from 
	author_tb;

	insert into publisher_tb
	values (0, v_publisher_name);
    
	select 
	max(publisher_id) into _new_publisher_id
	from 
	publisher_tb;
	
    insert into book_tb
    values (0, v_book_name, _new_author_id, _new_publisher_id);

	select
		max(book_id) into v_new_book_id
	from
		book_tb;


END