-- 問題
CREATE TABLE Accounts (
    prc_date timestamp with time zone,
    prc_amt int
);

INSERT INTO Accounts VALUES (
    '2018-10-26', 12000
), (
    '2018-10-28', 2500
), (
    '2018-10-31', -15000
), (
    '2018-11-03', 34000
), (
    '2018-11-04', -5000
), (
    '2018-11-06', 7200
), (
    '2018-11-11', 11000
);

SELECT prc_date, prc_amt, AVG(prc_amt) OVER(ORDER BY prc_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM Accounts;

-- 回答1
SELECT prc_date, prc_amt, AVG(
    SELECT prc_amt
    FROM Accounts A2
    WHERE A1.prc_date = A2.prc_date
    AND A1.prc_date >= A2.prc_date
    LIMIT 3
)
FROM Accounts A1;

-- 回答2
SELECT prc_date, prc_amt, (
    SELECT A2.prc_amt
    FROM Accounts A2
    WHERE A1.prc_date = A2.prc_date
    AND A1.prc_date >= A2.prc_date
    LIMIT 3
) / (
    SELECT COUNT(A2.prc_date)
    FROM Accounts A2
    WHERE A1.prc_date = A2.prc_date
    AND A1.prc_date >= A2.prc_date
    LIMIT 3
) AS avg
FROM Accounts A1;

-- 解答
SELECT prc_date, A1.prc_amt, (
    SELECT AVG(prc_amt)
    FROM Accounts A2
    WHERE A1.prc_date >= A2.prc_date
    AND (
        SELECT COUNT(*)
        FROM Accounts A3
        WHERE A3.prc_date
        BETWEEN A2.prc_date AND A1.prc_date
    ) <= 3
) AS mvg_sum
FROM Accounts A1
ORDER BY prc_date;
