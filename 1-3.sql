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

SELECT key FROM Greatests ORDER BY key;

-- 回答
SELECT key FROM Greatests ORDER BY CASE key WHEN 'A' THEN 2 ELSE CASE key WHEN 'B' THEN 1 ELSE CASE key WHEN 'C' THEN 4 ELSE CASE key WHEN 'D' THEN 3 END END END END;

-- 解答
SELECT key FROM Greatests
ORDER BY CASE key
    WHEN 'B' THEN 1
    WHEN 'A' THEN 2
    WHEN 'C' THEN 3
    WHEN 'D' THEN 4
    ELSE NULL END;
