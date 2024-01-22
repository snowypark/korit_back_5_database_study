set @count = 0;

call p_sum(10, 20, @result, @count);

select
	@count;
    
    
    
SHOW GLOBAL VARIABLES; 
-- 모든 시스템 변수를 확인한다.

show procedure status;