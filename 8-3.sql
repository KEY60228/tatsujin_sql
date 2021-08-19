-- 問題
CREATE TABLE Class_A (
    id int,
    name varchar(15)
);

CREATE TABLE Class_B (
    id int,
    name varchar(15)
);

INSERT INTO Class_A VALUES (
    1, '田中'
), (
    2, '鈴木'
), (
    3, '伊集院'
);

INSERT INTO Class_B VALUES (
    1, '田中'
), (
    2, '鈴木'
), (
    4, '西園寺'
);

-- 解答
MERGE INTO Class_A A USING (SELECT * FROM Class_B) B ON (A.id = B.id)
    WHEN MATCHED THEN UPDATE SET A.name = B.name
    WHEN NOT MATCHED THEN INSERT (id, name) VALUES (B.id, B.name);
