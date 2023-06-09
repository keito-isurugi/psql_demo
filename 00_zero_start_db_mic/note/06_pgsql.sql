-- ABS
SELECT m, ABS(m) AS abs_col
FROM SampleMath;

-- MOD
SELECT n, p, MOD(n, p) AS mod_col
FROM SampleMath;

-- ROUND
SELECT m, n, ROUND(m, n) AS round_col
FROM SampleMath;

-- 連結
SELECT str1, str2, str1 || 'hoge' AS str_concat
FROM SampleStr;

-- LENGTH
SELECT str1, LENGTH(str1) AS len_str
FROM SampleStr;

-- LOWER, UPPER
SELECT str1, LOWER(str1) AS lower_str
FROM SampleStr
WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

-- REPLACE
SELECT str1, str2, str3, REPLACE(str1, str2, str3) AS rep_str
FROM SampleStr;

-- SUBSTRING
SELECT str1, SUBSTRING(str1 FROM 3 FOR 2) AS sub_str
FROM SampleStr;

-- CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;

-- EXTRACT
SELECT CURRENT_TIMESTAMP,
       EXTRACT(YEAR   FROM CURRENT_TIMESTAMP) AS year,
       EXTRACT(MONTH  FROM CURRENT_TIMESTAMP) AS month,
       EXTRACT(DAY    FROM CURRENT_TIMESTAMP) AS day,
       EXTRACT(HOUR   FROM CURRENT_TIMESTAMP) AS hour,
       EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS minute,
       EXTRACT(SECOND FROM CURRENT_TIMESTAMP) AS second;

-- LIKE
SELECT *
  FROM SampleLike
 WHERE strcol LIKE '%ddd%';

SELECT *
  FROM SampleLike
 WHERE strcol LIKE 'ab___';

-- BETWEEN
SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka BETWEEN 100 AND 1000;

-- IN
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IN (320, 500, 5000);

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (320, 500, 5000);

SELECT shohin_mei, hanbai_tanka
  FROM Shohin
 WHERE shohin_id IN (SELECT shohin_id 
                       FROM TenpoShohin
                      WHERE tenpo_id = '000C');

SELECT shohin_mei, hanbai_tanka
  FROM Shohin
 WHERE shohin_id NOT IN (SELECT shohin_id 
                       FROM TenpoShohin
                      WHERE tenpo_id = '000A');

-- EXSITS
SELECT shohin_mei, hanbai_tanka
  FROM Shohin S
 WHERE EXISTS (SELECT *
                 FROM TenpoShohin TS
                WHERE TS.tenpo_id = '000C'
                  AND TS.shohin_id = S.shohin_id);

-- CASE
-- 検索CASE式
SELECT shohin_mei,
	CASE WHEN shohin_bunrui = '衣服'         THEN 'A：' || shohin_bunrui
			 WHEN shohin_bunrui = '事務用品'     THEN 'B：' || shohin_bunrui
			 WHEN shohin_bunrui = 'キッチン用品' THEN 'C：' || shohin_bunrui
			 ELSE NULL
	END AS abc_shohin_bunrui
FROM Shohin;
-- 単純CASE式
SELECT 
	SUM(CASE WHEN shohin_bunrui = '衣類'         THEN hanbai_tanka ELSE 0 END) AS sum_tanka_ihuku,
	SUM(CASE WHEN shohin_bunrui = 'キッチン用品' THEN hanbai_tanka ELSE 0 END) AS sum_tanka_kitchen,
	SUM(CASE WHEN shohin_bunrui = '事務用品'     THEN hanbai_tanka ELSE 0 END) AS sum_tanka_jimu
FROM Shohin;

-- 練習問題
SELECT 
	SUM(CASE WHEN hanbai_tanka <= 1000 THEN 1 ELSE 0 END) AS "低価格",
	SUM(CASE WHEN hanbai_tanka BETWEEN 1001 AND 3000 THEN 1 ELSE 0 END) AS "中価格",
	SUM(CASE WHEN hanbai_tanka >= 3001 THEN 1 ELSE 0 END) AS "高価格"
FROM Shohin;