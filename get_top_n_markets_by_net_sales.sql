CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_markets_by_net_sales`(
fiscalyear INT, no_in INT)
BEGIN
SELECT 
market,
ROUND(SUM(Net_sales)/1000000,2) AS Net_sales_mln
 FROM gdb0041.net_sales
 WHERE fiscal_year = fiscalyear
 group by market
 ORDER BY Net_sales_mln DESC
 LIMIT no_in;

END