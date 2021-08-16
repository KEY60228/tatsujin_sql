-- 問題
CREATE TABLE Projects (
    project_id varchar(15),
    step_nbr int,
    status varchar(255)
);

INSERT INTO Projects VALUES (
    'AA100', 0, '完了'
), (
    'AA100', 1, '待機'
), (
    'AA100', 2, '待機'
), (
    'B200', 0, '待機'
), (
    'B200', 1, '待機'
), (
    'CS300', 0, '完了'
), (
    'CS300', 1, '完了'
), (
    'CS300', 2, '待機'
), (
    'CS300', 3, '待機'
), (
    'DY400', 0, '完了'
), (
    'DY400', 1, '完了'
), (
    'DY400', 2, '完了'
)

-- 以下と同じ結果をALL使って
SELECT project_id
FROM Projects
GROUP BY project_id
HAVING COUNT(*) = SUM(
    CASE WHEN step_nbr <= 1 AND status = '完了' THEN 1
    WHEN step_nbr > 1 AND status = '待機' THEN 1
    ELSE 0 END
);

SELECT DISTINCT project_id
FROM Projects P1
WHERE NOT EXISTS (
    SELECT status
    FROM Projects P2
    WHERE P1.project_id = P2.project_id
    AND status <> CASE WHEN step_nbr <= 1 THEN '完了' ELSE '待機' END
);

-- 回答
SELECT DISTINCT project_id
FROM Projects
WHERE '完了' = ALL (
    SELECT CASE step_nbr WHEN 0 THEN status WHEN 1 THEN status ELSE NULL END AS status
    FROM Projects
    GROUP BY project_id
);

-- 解答
SELECT DISTINCT project_id
FROM Projects P1
WHERE '○' = ALL (
    SELECT CASE WHEN step_nbr <= 1 AND status = '完了' THEN '○'
    WHEN step_nbr > 1 AND status = '待機' THEN '○'
    ELSE '×' END
    FROM Projects P2
    WHERE P1.project_id = P2.project_id
);
