-- 問題
CREATE TABLE Skills (
    skill varchar(15)
);

CREATE TABLE EmpSkills (
    emp varchar(15),
    skill varchar(15)
);

INSERT INTO Skills VALUES (
    'Oracle'
), (
    'UNIX'
), (
    'Java'
);

INSERT INTO EmpSkills VALUES (
    '相田', 'Oracle'
), (
    '相田', 'UNIX'
), (
    '相田', 'Java'
), (
    '相田', 'C#'
), (
    '神崎', 'Oracle'
), (
    '神崎', 'UNIX'
), (
    '神崎', 'Java'
), (
    '平井', 'UNIX'
), (
    '平井', 'Oracle'
), (
    '平井', 'PHP'
), (
    '平井', 'Perl'
), (
    '平井', 'C++'
), (
    '若田部', 'Perl'
), (
    '渡来', 'Oracle'
);

-- 回答
SELECT emp
FROM EmpSkills ES
INNER JOIN Skills S ON ES.skill = S.skill
GROUP BY emp
HAVING COUNT(*) = 3;

-- 解答1
SELECT DISTINCT tmp
FROM EmpSkills ES1
WHERE NOT EXISTS (
    SELECT skill
    FROM Skills
    EXCEPT
    SELECT skill
    FROM EmpSkills ES2
    WHERE ES1.emp = ES2.emp
)
AND NOT EXISTS (
    SELECT skill
    FROM EmpSkills ES3
    WHERE ES1.emp = ES3.emp
    EXCEPT
    SELECT skill
    FROM Skills
);

-- 解答2
SELECT emp
FROM EmpSkills ES
WHERE NOT EXISTS (
    SELECT skill
    FROM Skills
    EXCEPT
    SELECT skill
    FROM EmpSkills ES2
    WHERE ES1.emp = ES2.emp
)
GROUP BY emp
HAVING COUNT(*) = (SELECT COUNT(*) FROM Skills);

