CREATE DEFINER=`aws`@`%` PROCEDURE `p_sum`(
	in v_num1 INT,
    in v_num2 INT,
    out v_result INT,
    inout v_count INT
)
BEGIN
	declare _count int; #지역변수선언
    
    #sql 명령어 set
	set v_count = v_count + 1;
    set _count = 1;
    
	select
		v_num1 + v_num2 into v_result;

END