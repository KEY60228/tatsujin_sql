-- 問題
-- 2-1に同じ

-- 以下のクエリがどのような挙動になるか
SELECT server, sample_date, SUM(load_val) OVER (PARTITION BY server) AS sum_load FROM ServerLoadSample;
