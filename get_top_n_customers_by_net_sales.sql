CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_customers_by_net_sales`(
fiscalyear INT,
in_market VARCHAR(20),
in_limit INT
)
BEGIN
SELECT 
customer,
ROUND(SUM(Net_sales)/1000000,2) AS Net_sales_mln
 FROM gdb0041.net_sales
 WHERE fiscal_year = fiscalyear AND market=in_market
 group by customer
 ORDER BY Net_sales_mln DESC
 LIMIT in_limit;

END