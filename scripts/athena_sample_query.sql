SELECT
tbl_sales.OrderDate, tbl_sales.OrderQuantity,
tbl_products.ProductPrice,tbl_products.ProductKey,tbl_products.ProductCost,
tbl_product_subcategories.SubcategoryName,
tbl_product_categoriesCategoryName,
(tbl_products.ProductPrice * tbl_sales.OrderQuantity) AS INCOME,
(tbl_products.ProductCost * tbl_sales.OrderQuantity) AS COST,
(tbl_products.ProductPrice * tbl_sales.OrderQuantity)  - (tbl_products.ProductCost * tbl_sales.OrderQuantity) AS Profit
FROM tbl_sales
LEFT JOIN tbl_products on tbl_sales.ProductKey=tbl_products.ProductKey
LEFT JOIN tbl_product_subcategories on  tbl_product_subcategories.ProductSubcategoryKey = tbl_products.ProductSubcategoryKey
JOIN tbl_product_categories on  tbl_product_categoriesProductcategoryKey  =   tbl_product_subcategories.ProductcategoryKey
ORDER BY (tbl_products.ProductPrice * tbl_sales.OrderQuantity)  - (tbl_products.ProductCost * tbl_sales.OrderQuantity) DESC