-- 問題
CREATE TABLE Digits (
    digit int
);

CREATE TABLE Numbers (
    num int
);

INSERT INTO Digits VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

INSERT INTO Numbers
SELECT D1.digit + (D2.digit * 10) AS seq
FROM Digits D1 CROSS JOIN Digits D2
ORDER BY seq;

-- 回答
SELECT num
FROM Numbers N1
WHERE NOT EXISTS (
    SELECT *
    FROM Numbers N2
    WHERE N1.num = N2.num
    AND N1.num <> N2.num * N1.num
)

-- 解答
SELECT num AS prime
FROM Numbers Dividend
WHERE num > 1
AND NOT EXISTS (
    SELECT *
    FROM Numbers Divisor
    WHERE Divisor.num <= Dividend.num / 2
    AND Divisor.num <> 1
    AND MOD(Dividend.num, Divisor.num) = 0
)
ORDER BY prime;
