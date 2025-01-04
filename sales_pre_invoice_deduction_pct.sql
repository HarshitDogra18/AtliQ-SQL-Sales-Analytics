CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_pre_invoice_deduction_pct` AS
    SELECT 
        `s`.`date` AS `date`,
        `s`.`Fiscal_year` AS `Fiscal_year`,
        `p`.`product_code` AS `product_code`,
        `c`.`customer` AS `customer`,
        `c`.`customer_code` AS `customer_code`,
        `c`.`market` AS `market`,
        `p`.`product` AS `product`,
        `p`.`variant` AS `variant`,
        `s`.`sold_quantity` AS `sold_quantity`,
        `g`.`gross_price` AS `gross_price`,
        ROUND((`s`.`sold_quantity` * `g`.`gross_price`),
                2) AS `Total_gross_price`,
        `i`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`
    FROM
        ((((`fact_sales_monthly` `s`
        JOIN `dim_customer` `c` ON ((`s`.`customer_code` = `c`.`customer_code`)))
        JOIN `dim_product` `p` ON ((`s`.`product_code` = `p`.`product_code`)))
        JOIN `fact_gross_price` `g` ON (((`s`.`product_code` = `g`.`product_code`)
            AND (`g`.`fiscal_year` = `s`.`Fiscal_year`))))
        JOIN `fact_pre_invoice_deductions` `i` ON (((`s`.`customer_code` = `i`.`customer_code`)
            AND (`s`.`Fiscal_year` = `i`.`fiscal_year`))))