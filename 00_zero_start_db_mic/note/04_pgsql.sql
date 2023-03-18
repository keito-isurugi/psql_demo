-- 他のテーブルからデータをコピーする
-- データ挿入先の商品コピーテーブル
CREATE TABLE ShohinCopy
(shohin_id CHAR(4) NOT NULL,
 shohin_mei VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32) NOT NULL,
 hanbai_tanka INTEGER ,
 shiire_tanka INTEGER ,
 torokubi DATE ,
     PRIMARY KEY (shohin_id));
-- 商品テーブルのデータを商品コピーテーブルへ「コピー」
INSERT INTO ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
  FROM Shohin;
-- コピー行の確認
SELECT * FROM ShohinCopy;

-- 練習問題
ALTER TABLE ShohinCopy ADD COLUMN saeki INTEGER;

INSERT INTO ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi, saeki)
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi, hanbai_tanka - shiire_tanka as saeki
  FROM Shohin;

SELECT shohin_mei, hanbai_tanka, saeki  FROM ShohinCopy ORDER BY saeki;

update ShohinCopy 
set 
hanbai_tanka = 3000, 
saeki = 3000 - shiire_tanka 
WHERE shohin_mei = 'カッターシャツ';

