SELECT
to_date(sales.OrderDate, 'mm/dd/yyyy') as OrderDate, sales.OrderQuantity,
product.ProductPrice,product.productname,product.ProductCost,
subcategory.SubcategoryName,
category.CategoryName,
(product.ProductPrice * sales.OrderQuantity) AS INCOME,
(product.ProductCost * sales.OrderQuantity) AS COST,
(product.ProductPrice * sales.OrderQuantity)  - (product.ProductCost * sales.OrderQuantity) AS Profit
FROM sales
LEFT JOIN product on sales.ProductKey=product.ProductKey
LEFT JOIN subcategory on  subcategory.ProductSubcategoryKey = product.ProductSubcategoryKey
JOIN category on  category.ProductcategoryKey  =   subcategory.ProductcategoryKey
WHERE to_date(sales.OrderDate, 'mm/dd/yyyy') >= to_date('01/01/2017','mm/dd/yyyy')
ORDER BY (product.ProductPrice * sales.OrderQuantity)  - (product.ProductCost * sales.OrderQuantity) DESC