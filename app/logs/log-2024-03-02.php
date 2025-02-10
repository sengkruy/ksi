<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

DEBUG - 2024-03-02 13:29:46 --> UTF-8 Support Enabled
DEBUG - 2024-03-02 13:29:46 --> Global POST, GET and COOKIE data sanitized
ERROR - 2024-03-02 13:29:46 --> Severity: Warning --> foreach() argument must be of type array|object, bool given /var/www/html/ksi_test/themes/default/admin/views/reports/products.php 255
DEBUG - 2024-03-02 13:29:46 --> Total execution time: 0.1312
DEBUG - 2024-03-02 13:30:52 --> UTF-8 Support Enabled
DEBUG - 2024-03-02 13:30:52 --> Global POST, GET and COOKIE data sanitized
ERROR - 2024-03-02 13:30:52 --> Query error: Unknown column 'p.ate' in 'field list' - Invalid query: SELECT sma_products.code, sma_products.name, CONCAT(COALESCE( PCosts.purchasedQty, 0 ), '__', COALESCE( PCosts.totalPurchase, 0 )) as purchased, CONCAT(COALESCE( PSales.soldQty, 0 ), '__', COALESCE( PSales.totalSale, 0 )) as sold, (COALESCE( PSales.totalSale, 0 ) - COALESCE( PCosts.totalPurchase, 0 )) as Profit, CONCAT(COALESCE( PCosts.balacneQty, 0 ), '__', COALESCE( PCosts.balacneValue, 0 )) as balance, sma_products.id as id
FROM `sma_products`
LEFT JOIN ( SELECT si.product_id, s.date as date, s.created_by as created_by, SUM(si.quantity) soldQty, SUM(si.quantity * si.sale_unit_price) totalSale from sma_costing si JOIN sma_sales s on s.id = si.sale_id  GROUP BY si.product_id ) PSales ON `sma_products`.`id` = `PSales`.`product_id`
LEFT JOIN ( SELECT product_id, p.ate as date, p.created_by as created_by, SUM(CASE WHEN pi.purchase_id IS NOT NULL THEN quantity ELSE 0 END) as purchasedQty, SUM(quantity_balance) as balacneQty, SUM( unit_cost * quantity_balance ) balacneValue, SUM( (CASE WHEN pi.purchase_id IS NOT NULL THEN (pi.subtotal) ELSE 0 END) ) totalPurchase from sma_purchase_items pi LEFT JOIN sma_purchases p on p.id = pi.purchase_id WHERE pi.status = 'received'  GROUP BY pi.product_id ) PCosts ON `sma_products`.`id` = `PCosts`.`product_id`
WHERE `sma_products`.`type` != 'combo'
GROUP BY `sma_products`.`code`
ORDER BY `sold` DESC, `purchased` DESC
 LIMIT 100
ERROR - 2024-03-02 13:30:52 --> Query error: Unknown column 'p.ate' in 'field list' - Invalid query: SELECT *
FROM `sma_products`
LEFT JOIN ( SELECT si.product_id, s.date as date, s.created_by as created_by, SUM(si.quantity) soldQty, SUM(si.quantity * si.sale_unit_price) totalSale from sma_costing si JOIN sma_sales s on s.id = si.sale_id  GROUP BY si.product_id ) PSales ON `sma_products`.`id` = `PSales`.`product_id`
LEFT JOIN ( SELECT product_id, p.ate as date, p.created_by as created_by, SUM(CASE WHEN pi.purchase_id IS NOT NULL THEN quantity ELSE 0 END) as purchasedQty, SUM(quantity_balance) as balacneQty, SUM( unit_cost * quantity_balance ) balacneValue, SUM( (CASE WHEN pi.purchase_id IS NOT NULL THEN (pi.subtotal) ELSE 0 END) ) totalPurchase from sma_purchase_items pi LEFT JOIN sma_purchases p on p.id = pi.purchase_id WHERE pi.status = 'received'  GROUP BY pi.product_id ) PCosts ON `sma_products`.`id` = `PCosts`.`product_id`
WHERE `sma_products`.`type` != 'combo'
GROUP BY `sma_products`.`code`
ERROR - 2024-03-02 13:30:52 --> Severity: error --> Exception: Call to a member function num_rows() on bool /var/www/html/ksi_test/app/libraries/Datatables.php 524
DEBUG - 2024-03-02 13:30:57 --> UTF-8 Support Enabled
DEBUG - 2024-03-02 13:30:57 --> Global POST, GET and COOKIE data sanitized
ERROR - 2024-03-02 13:30:57 --> hello
DEBUG - 2024-03-02 13:30:59 --> Total execution time: 2.0783
