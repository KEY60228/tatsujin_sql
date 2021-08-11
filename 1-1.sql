-- 問題
CREATE TABLE Greatests (
    key varchar,
    x integer,
    y integer,
    z integer
);
INSERT INTO Greatests VALUES (
    'A', 1, 2, 3
), (
    'B', 5, 5, 2
), (
    'C', 4, 7, 1
), (
    'D', 3, 3, 8
);

-- 回答1
SELECT key, CASE WHEN x > y THEN x ELSE y END AS greatest FROM Greatests;

-- 回答2
SELECT key, CASE WHEN x > y AND x > z THEN x ELSE CASE WHEN y > z THEN y ELSE z END END AS greatest FROM Greatests;

-- 解答1
SELECT key, CASE WHEN x < y THEN y ELSE x END AS greatest FROM Greatests;

-- 解答2-1
SELECT key, CASE WHEN CASE WHEN x < y THEN y ELSE x END < z THEN z ELSE CASE WHEN x < y THEN y ELSE x END END AS greatest FROM Greatests;

-- 解答2-2
SELECT key, MAX(col) AS greatest
FROM (
    SELECT key, x AS col FROM Greatests 
    UNION ALL
    SELECT key, y AS col FROM Greatests
    UNION ALL
    SELECT key, z AS col FROM Greatests
) tmp
GROUP BY key;

-- 解答2-3 (RDBMS依存)
SELECT key, GREATEST(GREATEST(x, y), z) AS greatest FROM Greatests;