-- 問題
-- 3-2に同じ

-- 回答
WITH selected AS (
    SELECT *, RANK() OVER (ORDER BY price DESC) AS rank
)
DELETE FROM Products P1
WHERE P1.name = P2.name AND P1.price = P2.price AND 
-- ... give up

-- 解答
CREATE TABLE Products_NoRedundant AS
    SELECT ROW_NUMBER() OVER(PARTITION BY name, price ORDER BY name) AS row_num, name, price
    FROM Products;
DELETE FROM Products_NoRedundant WHERE row_num > 1;

-- 以下はRDBMS依存
DELETE FROM (
    SELECT ROW_NUMBER() OVER(PARTITION BY name, price ORDER BY name) AS row_num
    FROM Products
) WHERE row_num > 1;
