-- 問題
CREATE TABLE Items (
    item varchar(30)
);

CREATE TABLE ShopItems (
    shop varchar(30),
    item varchar(30)
);

INSERT INTO Items VALUES (
    'ビール'
), (
    '紙オムツ'
), (
    '自転車'
);

INSERT INTO ShopItems VALUES (
    '仙台',  'ビール'
), (
    '仙台',  '紙オムツ'
), (
    '仙台',  '自転車'
), (
    '仙台',  'カーテン'
), (
    '東京',  'ビール'
), (
    '東京',  '紙オムツ'
), (
    '東京',  '自転車'
), (
    '大阪',  'テレビ'
), (
    '大阪',  '紙オムツ'
), (
    '大阪',  '自転車'
);

-- 回答
SELECT shop, COUNT(*) AS my_item_cnt, (SELECT COUNT(*) FROM Items) - COUNT(*) AS diff_cnt
FROM ShopItems
INNER JOIN Items
ON ShopItems.item = Items.item
GROUP BY shop;

-- 解答
SELECT SI.shop, COUNT(SI.item) AS my_item_cnt, (SELECT COUNT(item) FROM Items) - COUNT(SI.item) AS diff_cnt
FROM ShopItems SI
INNER JOIN Items I
ON SI.item = I.item
GROUP BY SI.shop;
