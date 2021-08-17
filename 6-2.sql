-- 問題
CREATE TABLE Students (
    student_id int,
    dpt varchar(15),
    sbmt_date timestamp with time zone
);

INSERT INTO Students VALUES (
    100, '理学部', '2018-10-10'
), (
    101, '理学部', '2018-09-22'
), (
    102, '文学部', NULL
), (
    103, '文学部', '2018-09-10'
), (
    200, '文学部', '2018-09-22'
), (
    201, '工学部', NULL
), (
    202, '経済学部', '2018-09-25'
);

-- 回答1
SELECT dpt
FROM Students S1
WHERE NOT EXISTS (
    SELECT *
    FROM Students S2
    WHERE S1.dpt = S2.dpt
    AND sbmt_date IS NULL
    OR sbmt_date < date('2018-09-01')
    OR sbmt_date >= date('2018-10-01')
)
GROUP BY dpt;

-- 回答2
SELECT dpt
FROM Students
GROUP BY dpt
HAVING COUNT(*) = COUNT(CASE WHEN sbmt_date IS NOT NULL AND sbmt_date >= '2018-09-01' AND sbmt_date < '2018-10-01' THEN 1 ELSE NULL END);

-- 解答
SELECT dpt
FROM Students
GROUP BY dpt
HAVING COUNT(*) = SUM(CASE WHEN sbmt_date BETWEEN '2018-09-01' AND '2018-09-30' THEN 1 ELSE 0 END);

