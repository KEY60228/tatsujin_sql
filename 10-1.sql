-- 問題
CREATE VIEW Sequence (seq) AS
    SELECT D1.digit + (D2.digit * 10) + (D3.digit * 100)
    FROM Digits D1
    CROSS JOIN Digits D2
    CROSS JOIN Digits D3;

CREATE TABLE SeqTbl2 (
    seq int
);

INSERT INTO SeqTbl2 VALUES (
    1
), (
    2
), (
    4
), (
    5
), (
    6
), (
    7
), (
    8
), (
    11
), (
    12
);

SELECT seq
FROM Sequence
WHERE seq BETWEEN 1 AND 12
EXCEPT
SELECT seq
FROM SeqTbl2;

SELECT seq
FROM Sequence
WHERE seq BETWEEN 1 AND 12
AND seq NOT IN (SELECT seq FROM SeqTbl2);

-- 回答1
SELECT seq
FROM Sequence S
WHERE seq BETWEEN 1 AND 12
AND NOT EXISTS (
    SELECT *
    FROM SeqTbl2 ST
    WHERE ST.seq = S.seq
);

-- 回答2
SELECT S.seq
FROM Sequence S
LEFT JOIN SeqTbl2 ST ON S.seq = ST.seq
WHERE S.seq BETWEEN 1 AND 12
AND ST.seq IS NULL;

-- 解答1
SELECT seq
FROM Sequence N
WHERE seq BETWEEN 1 AND 12
AND NOT EXISTS (
    SELECT *
    FROM SeqTbl2 S
    WHERE N.seq = S.seq
);

-- 解答2
SELECT N.seq
FROM Sequence N
LEFT OUTER JOIN SeqTbl2 S ON N.seq = S.seq
WHERE N.seq BETWEEN 1 AND 12
AND S.seq IS NULl;
