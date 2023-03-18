-- ログイン
psql -U postgres -d shop

-- データベース作成
CREATE DATABASE shop;

-- テーブル作成
REATE TABLE Shohin
(shohin_id     CHAR(4) NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32) NOT NULL,
 hanbai_tanka  INTEGER ,
 shiire_tanka  INTEGER ,
 torokubi      DATE ,
     PRIMARY KEY (shohin_id));

-- カラム追加
ALTER TABLE Shohin ADD COLUMN shohin_mei_kana VARCHAR(100);

-- レコード追加
INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

-- 重複を除く
SELECT DISTINCT shohin_bunrui
  FROM Shohin;

-- 算術演算子
SELECT shohin_mei, hanbai_tanka,
       hanbai_tanka * 10 AS "販売単価10倍"
  FROM Shohin;

-- 比較演算子
SELECT shohin_mei, shohin_bunrui
  FROM Shohin
 WHERE hanbai_tanka > 500;

SELECT shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka as "粗利"
FROM Shohin
WHERE hanbai_tanka - shiire_tanka >= 500;

-- is null
select shohin_mei, shiire_tanka from shohin where shiire_tanka <> 2800 or shiire_tanka is null

-- NOT
SELECT shohin_mei, shohin_bunrui, hanbai_tanka
  FROM Shohin
 WHERE NOT hanbai_tanka >= 1000;

 -- AND, OR
 SELECT shohin_mei, shohin_bunrui, torokubi
  FROM Shohin
 WHERE shohin_bunrui = '事務用品'
   AND ( torokubi = '2009-09-11'
      OR torokubi = '2009-09-20');

-- 練習問題
select shohin_mei, torokubi from shohin where torokubi >= '2009-04-28';

SELECT shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka as "粗利"
FROM Shohin
WHERE hanbai_tanka >= shiire_tanka + 500;

SELECT shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka as "粗利"
FROM Shohin
WHERE hanbai_tanka - 500 >= shiire_tanka;

SELECT shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, hanbai_tanka * 0.9 - shiire_tanka as "粗利"
FROM Shohin
WHERE (shohin_bunrui = '事務用品' or shohin_bunrui = 'キッチン用品' )
and hanbai_tanka * 0.9 - shiire_tanka > 100;