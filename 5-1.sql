-- 問題
CREATE TABLE ArrayTbl (
    key varchar(15),
    col1 int,
    col2 int,
    col3 int,
    col4 int,
    col5 int,
    col6 int,
    col7 int,
    col8 int,
    col9 int,
    col10 int
);

INSERT INTO ArrayTbl VALUES (
    'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
), (
    'B', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
), (
    'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
), (
    'D', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
), (
    'E', NULL, 3, 1, 9, NULL, NULL, 9, NULL, NULL, NULL
);

CREATE TABLE ArrayTbl2 (
    key varchar(15),
    i int,
    val int
);

INSERT INTO ArrayTbl2 VALUES (
    'A', 1, NULL
), (
    'A', 2, NULL
), (
    'A', 3, NULL
), (
    'A', 4, NULL
), (
    'A', 5, NULL
), (
    'A', 6, NULL
), (
    'A', 7, NULL
), (
    'A', 8, NULL
), (
    'A', 9, NULL
), (
    'A', 10, NULL
), (
    'B', 1, 3
), (
    'B', 2, NULL
), (
    'B', 3, NULL
), (
    'B', 4, NULL
), (
    'B', 5, NULL
), (
    'B', 6, NULL
), (
    'B', 7, NULL
), (
    'B', 8, NULL
), (
    'B', 9, NULL
), (
    'B', 10, NULL
), (
    'C', 1, 1
), (
    'C', 2, 1
), (
    'C', 3, 1
), (
    'C', 4, 1
), (
    'C', 5, 1
), (
    'C', 6, 1
), (
    'C', 7, 1
), (
    'C', 8, 1
), (
    'C', 9, 1
), (
    'C', 10, 1
);

-- 回答
SELECT DISTINCT key
FROM ArrayTbl2 ar1
WHERE EXISTS (
    SELECT *
    FROM ArrayTbl2 ar2
    WHERE ar1.key = ar2.key
    AND val = 1
);

-- 解答
SELECT DISTINCT key
FROM ArrayTbl2 A1
WHERE NOT EXISTS (
    SELECT *
    FROM ArrayTbl2 A2
    WHERE A1.key = A2.key
    AND (A2.val <> 1 OR A2.val IS NULL)
);
