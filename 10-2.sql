-- 問題
CREATE TABLE Seats (
    seat int,
    status varchar(15)
);

INSERT INTO Seats VALUES (
    1, '占'
), (
    2, '占'
), (
    3, '空'
), (
    4, '空'
), (
    5, '空'
), (
    6, '占'
), (
    7, '空'
), (
    8, '空'
), (
    9, '空'
), (
    10, '空'
), (
    11, '空'
), (
    12, '占'
), (
    13, '占'
), (
    14, '空'
), (
    15, '空'
);

CREATE TABLE Seats2 (
    seat int,
    line_id char,
    status varchar(15)
);

INSERT INTO Seats2 VALUES (
    1, 'A', '占'
), (
    2, 'A', '占'
), (
    3, 'A', '空'
), (
    4, 'A', '空'
), (
    5, 'A', '空'
), (
    6, 'B', '占'
), (
    7, 'B', '占'
), (
    8, 'B', '空'
), (
    9, 'B', '空'
), (
    10, 'B', '空'
), (
    11, 'C', '空'
), (
    12, 'C', '空'
), (
    13, 'C', '空'
), (
    14, 'C', '占'
), (
    15, 'C', '空'
);

-- 回答
SELECT seat, '〜', seat + (3 - 1)
FROM (
    SELECT seat
)
HAVING

-- 解答1
SELECT S1.seat AS start_seat, ' 〜 ', S2.seat AS end_seat
FROM Seats S1, Seats S2, Seats S3
WHERE S2.seat = S1.seat + (3 - 1)
AND S3.seat BETWEEN s1.seat AND S2.seat
GROUP BY S1.seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.status = '空' THEN 1 ELSE 0 END);

-- 解答2
SELECT S1.seat AS start_seat, ' 〜 ', S2.seat AS end_seat
FROM Seats2 S1, Seats2 S2, Seats2 S3
WHERE S2.seat = S1.seat + (3 - 1)
AND S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY S1.seat, S2.seat
HAVING COUNT(*) = SUM(
    CASE WHEN S3.status = '空' AND S3.row_id = S1.row_id THEN 1 ELSE 0 END
);
