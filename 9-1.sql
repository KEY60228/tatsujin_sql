-- 問題
CREATE TABLE tbl_A (
    key char,
    col_1 int,
    col_2 int,
    col_3 int
);

CREATE TABLE tbl_B (
    key char,
    col_1 int,
    col_2 int,
    col_3 int
);

INSERT INTO tbl_A VALUES (
    'A', 2, 3, 4
), (
    'B', 0, 7, 9
), (
    'C', 5, 1, 6
);

INSERT INTO tbl_B VALUES (
    'A', 2, 3, 4
), (
    'B', 0, 7, 9
), (
    'C', 5, 1, 6
);

-- 回答
SELECT CASE WHEN (SELECT COUNT(*) FROM tbl_A) = COUNT(*) THEN 'true' ELSE 'false' END AS result
FROM (
    SELECT *
    FROM tbl_A
    UNION
    SELECT *
    FROM tbl_B
) TMP;

-- 解答
SELECT CASE WHEN COUNT(*) = (SELECT COUNT(*) FROM tbl_A) AND COUNT(*) = (SELECT COUNT(*) FROM tbl_B) THEN '等しい' ELSE '異なる' END as result
FROM (
    SELECT *
    FROM tbl_A
    UNION
    SELECT *
    FROM tbl_B
) TMP;
