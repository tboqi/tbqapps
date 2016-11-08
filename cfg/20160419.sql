select from_unixtime(first_mianshen_time),c.name,o.user_name,u.u_mobile,o.loan_money,o.order_status from fh_order o,fh_order_customer_info c,fh_user u
where o.son_order_id=c.order_sn and u.u_id=o.u_id
and first_mianshen_time>=unix_timestamp('2016-4-11') and first_mianshen_time<unix_timestamp('2016-4-16')