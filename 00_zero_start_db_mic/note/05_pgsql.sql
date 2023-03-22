-- ビューの作成
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui;

 -- ビューからビューを作る(なるべく使わない方がよい)
CREATE VIEW ShohinSumJim (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, cnt_shohin
  FROM ShohinSum
 WHERE shohin_bunrui = '事務用品';

-- ビューを使う
SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum;

-- ビューの削除
DROP VIEW ShohinSum;
/* PostgreSQLで多段ビューの作成元となっているビューを削除する場合 */
DROP VIEW ShohinSum CASCADE;

-- サブクエリ
SELECT shohin_bunrui, cnt_shohin
  FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
          FROM Shohin
         GROUP BY shohin_bunrui) AS ShohinSum;

-- スカラサブクエリ
SELECT shohin_id, shohin_mei, hanbai_tanka
  FROM Shohin
 WHERE hanbai_tanka < (SELECT AVG(hanbai_tanka)
                         FROM Shohin);

SELECT 
shohin_id, 
shohin_mei, 
hanbai_tanka,
(SELECT AVG(hanbai_tanka) FROM Shohin) as "平均販売単価"
FROM Shohin;

-- 相関サブクエリ
SELECT shohin_bunrui, shohin_mei, hanbai_tanka
  FROM Shohin AS S1
 WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
                         FROM Shohin AS S2
                        WHERE S1.shohin_bunrui = S2.shohin_bunrui
                        GROUP BY shohin_bunrui);

-- 練習問題
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
SELECT shohin_mei, hanbai_tanka, torokubi
FROM Shohin
WHERE hanbai_tanka >= 1000 AND torokubi = '2009-09-20';

select * from ViewRenshu5_1;

SELECT 
shohin_id, 
shohin_mei, 
shohin_bunrui,
hanbai_tanka,
(SELECT AVG(hanbai_tanka) FROM Shohin) as hanbai_tanka_all
FROM shohin;

CREATE VIEW AVGTankaByBunrui (
	shohin_id, 
	shohin_mei, 
	shohin_bunrui,
	hanbai_tanka,
	avg_hanbai_tanka
	)
AS
SELECT
	shohin_id, 
	shohin_mei, 
	shohin_bunrui,
	hanbai_tanka,
	(
		SELECT AVG(hanbai_tanka) 
		FROM Shohin as S2 
		WHERE S1.shohin_bunrui = S2.shohin_bunrui
		GROUP BY shohin_bunrui
	) as avg_hanbai_tanka
FROM Shohin as S1;

select * from AVGTankaByBunrui;