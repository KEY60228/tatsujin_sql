-- 問題
CREATE TABLE Products (
    name varchar(255),
    price integer
);

INSERT INTO Products VALUES (
    'りんご', 100
), (
    'みかん', 50
), (
    'バナナ', 80
);

-- 回答
SELECT P1.name, P2.name FROM Products P1
INNER JOIN Products P2 ON P1.name >= P2.name;

-- 解答
SELECT P1.name AS name_1, P2.name AS name_2 FROM Products P1
INNER JOIN Products P2 ON P1.name >= P2.name
