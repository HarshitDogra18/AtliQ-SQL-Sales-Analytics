CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_post_invoice_deduction_pct` AS
    SELECT 
        `pre`.`date` AS `date`,
        `pre`.`Fiscal_year` AS `Fiscal_year`,
        `pre`.`customer` AS `customer`,
        `pre`.`customer_code` AS `customer_code`,
        `pre`.`market` AS `market`,
        `pre`.`product_code` AS `product_code`,
        `pre`.`product` AS `product`,
        `pre`.`variant` AS `variant`,
        `pre`.`sold_quantity` AS `sold_quantity`,
        `pre`.`Total_gross_price` AS `Total_gross_price`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        ROUND(((1 - `pre`.`pre_invoice_discount_pct`) * `pre`.`Total_gross_price`),
                2) AS `Net_invoice_sales`,
        (`pos`.`discounts_pct` + `pos`.`other_deductions_pct`) AS `post_invoice_deductions_pct`
    FROM
        (`sales_pre_invoice_deduction_pct` `pre`
        JOIN `fact_post_invoice_deductions` `pos` ON (((`pre`.`date` = `pos`.`date`)
            AND (`pre`.`customer_code` = `pos`.`customer_code`)
            AND (`pre`.`product_code` = `pos`.`product_code`))))