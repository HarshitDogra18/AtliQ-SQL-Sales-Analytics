CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `sales_post_invoice_deduction_pct`.`date` AS `date`,
        `sales_post_invoice_deduction_pct`.`Fiscal_year` AS `Fiscal_year`,
        `sales_post_invoice_deduction_pct`.`customer` AS `customer`,
        `sales_post_invoice_deduction_pct`.`customer_code` AS `customer_code`,
        `sales_post_invoice_deduction_pct`.`market` AS `market`,
        `sales_post_invoice_deduction_pct`.`product_code` AS `product_code`,
        `sales_post_invoice_deduction_pct`.`product` AS `product`,
        `sales_post_invoice_deduction_pct`.`variant` AS `variant`,
        `sales_post_invoice_deduction_pct`.`sold_quantity` AS `sold_quantity`,
        `sales_post_invoice_deduction_pct`.`Total_gross_price` AS `Total_gross_price`,
        `sales_post_invoice_deduction_pct`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `sales_post_invoice_deduction_pct`.`Net_invoice_sales` AS `Net_invoice_sales`,
        `sales_post_invoice_deduction_pct`.`post_invoice_deductions_pct` AS `post_invoice_deductions_pct`,
        ROUND(((1 - `sales_post_invoice_deduction_pct`.`post_invoice_deductions_pct`) * `sales_post_invoice_deduction_pct`.`Net_invoice_sales`),
                2) AS `Net_sales`
    FROM
        `sales_post_invoice_deduction_pct`