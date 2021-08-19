-- 問題
CREATE TABLE TblSex (
    sex_cd char(1),
    sex varchar(5), 
    PRIMARY KEY(sex_cd)
);

CREATE TABLE TblAge (
    age_class char(1), 
    age_range varchar(30), 
    PRIMARY KEY(age_class)
);

CREATE TABLE TblPop (
    pref_name  varchar(30), 
    age_class  char(1), 
    sex_cd     char(1), 
    population integer, 
    PRIMARY KEY(pref_name, age_class,sex_cd)
);

INSERT INTO TblSex VALUES (
    'm', '男'
), (
    'f', '女'
);

INSERT INTO TblAge VALUES (
    '1', '21〜30歳'
), (
    '2', '31〜40歳'
), (
    '3', '41〜50歳'
);

INSERT INTO TblPop VALUES (
    '秋田', '1', 'm', 400
), (
    '秋田', '3', 'm', 1000
), (
    '秋田', '1', 'f', 800
), (
    '秋田', '3', 'f', 1000
), (
    '青森', '1', 'm', 700
), (
    '青森', '1', 'f', 500
), (
    '青森', '3', 'f', 800
), (
    '東京', '1', 'm', 900
), (
    '東京', '1', 'f', 1500
), (
    '東京', '3', 'f', 1200
), (
    '千葉', '1', 'm', 900
), (
    '千葉', '1', 'f', 1000
), (
    '千葉', '3', 'f', 900
);

SELECT MASTER.age_class AS age_class, MASTER.sex_cd AS sex_cd, DATA.pop_tohoku AS pop_tohoku, DATA.pop_kanto AS pop_kanto
FROM (
    SELECT age_class, sex_cd
    FROM TblAge
    CROSS JOIN TblSex
) MASTER
LEFT OUTER JOIN (
    SELECT age_class, sex_cd, SUM(
        CASE WHEN pref_name IN ('青森', '秋田') THEN population ELSE NULL END
    ) AS pop_tohoku, SUM(
        CASE WHEN pref_name IN ('東京', '千葉') THEN population ELSE NULL END
    ) AS pop_kanto
    FROM TblPop
    GROUP BY age_class, sex_cd
) DATA
ON MASTER.age_class = DATA.age_class
AND MASTER.sex_cd = DATA.sex_cd;

-- 回答
SELECT
    MAX(age_range) AS age_range,
    MAX(sex) AS sex,
    SUM(
        CASE WHEN pref_name IN ('青森', '秋田') THEN population ELSE NULL END
    ) as pop_tohoku,
    SUM(
        CASE WHEN pref_name IN ('東京', '千葉') THEN population ELSE NULL END
    ) as pop_kanto
FROM TblPop
LEFT JOIN TblAge ON TblPop.age_class = TblAge.age_class
LEFT JOIN TblSex ON TblPop.sex_cd = TblSex.sex_cd
GROUP BY TblPop.age_class, TblPop.sex_cd;

-- 解答
SELECT MASTER.age_class AS age_class, MASTER.sex_cd AS sex_cd, SUM(
    CASE WHEN pref_name IN ('青森', '秋田') THEN population ELSE NULL END
) AS pop_tohoku, SUM(
    CASE WHEN pref_name IN ('東京', '千葉') THEN population ELSE NULL END
)
FROM (
    SELECT age_class, sex_cd
    FROM TblAge CROSS JOIN TblSex
) MASTER
LEFT OUTER JOIN TblPop DATA
ON MASTER.age_class = DATA.age_class
AND MASTER.sex_cd = DATA.sex_cd
GROUP BY MASTER.age_class, MASTER.sex_cd;
