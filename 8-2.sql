-- 問題
CREATE TABLE Personnel (
    employee varchar(32), 
    child_1 varchar(32), 
    child_2 varchar(32), 
    child_3 varchar(32), 
    PRIMARY KEY(employee)
);

INSERT INTO Personnel VALUES (
    '赤井', '一郎', '二郎', '三郎'
), (
    '工藤', '春子', '夏子', NULL
), (
    '鈴木', '夏子', NULL, NULL
), (
    '吉田', NULL, NULL, NULL
);

-- 回答
WITH Children AS (
    SELECT child_1 AS child FROM Personnel
    UNION
    SELECT child_2 AS child FROM Personnel
    UNION
    SELECT child_3 AS child FROM Personnel
)
SELECT EMP.employee, COUNT(Children.child) AS child_cnt
FROM Personnel EMP
LEFT OUTER JOIN Children ON Children.child IN (EMP.child_1, EMP.child_2, EMP.child_3)
GROUP BY EMP.employee
ORDER BY child_cnt DESC;

-- 解答
CREATE VIEW Children(child) AS 
    SELECT child_1 FROM Personnel
    UNION
    SELECT child_2 FROM Personnel
    UNION
    SELECT child_3 FROM Personnel;

SELECT EMP.employee, COUNT(Children.child) AS child_cnt
FROM Personnel EMP
LEFT OUTER JOIN Children ON Children.child IN (EMP.child_1, EMP.child_2, EMP.child_3)
GROUP BY EMP.employee;
