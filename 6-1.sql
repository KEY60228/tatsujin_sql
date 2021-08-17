-- 問題
CREATE TABLE SeqTbl (
    seq int,
    name varchar(15)
);

INSERT INTO SeqTbl VALUES (
    1, 'ディック'
), (
    2, 'アン'
), (
    3, 'ライル'
), (
    5, 'カー'
), (
    6, 'マリー'
), (
    8, 'ベン'
);

-- 回答
SELECT CASE WHEN COUNT(*) = MAX(seq) THEN '歯抜けなし' ELSE '歯抜けあり' END AS gap FROM SeqTbl;

-- 解答
SELECT CASE WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり' ELSE '歯抜けなし' END AS gap FROM SeqTbl;
