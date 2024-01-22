CREATE DEFINER=`aws`@`%` TRIGGER `user_mst_tb_BEFORE_DELETE` BEFORE DELETE ON `user_mst_tb` FOR EACH ROW BEGIN
	delete
    from
		user_dtl_tb
	where
		user_dtl_id = old.user_mst_id;
END