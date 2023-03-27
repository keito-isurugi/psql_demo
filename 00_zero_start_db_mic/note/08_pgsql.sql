-- RANK
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
  RANK () OVER (
      PARTITION BY shohin_bunrui
      OR DER BY hanbai_tanka
    ) AS ranking
FROM Shohin;

SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
  RANK () OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
       RANK () OVER (ORDER BY hanbai_tanka) AS ranking,
       DENSE_RANK () OVER (ORDER BY hanbai_tanka) AS dense_ranking,
       ROW_NUMBER () OVER (ORDER BY hanbai_tanka) AS row_num
  FROM Shohin;


-- 集約関数をウィンドウ関数として使う
SELECT shohin_id, shohin_mei, hanbai_tanka,
       SUM (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
  FROM Shohin;


-- 移動平均
SELECT shohin_id, shohin_mei, hanbai_tanka,
      AVG (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_avg
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
       AVG (hanbai_tanka) OVER (ORDER BY shohin_id
                                 ROWS BETWEEN 1 PRECEDING AND 
                                              1 FOLLOWING) AS moving_avg
  FROM Shohin;

-- 2つのORDER BY
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
       RANK () OVER (ORDER BY hanbai_tanka) AS ranking
  FROM Shohin
 ORDER BY ranking;


-- GROUPING演算子
SELECT '合計' AS shohin_bunrui, SUM(hanbai_tanka)
  FROM Shohin
UNION ALL
SELECT shohin_bunrui, SUM(hanbai_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui;

-- ROLLUP
SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
  FROM Shohin
 GROUP BY ROLLUP(shohin_bunrui);

SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
  FROM Shohin
 GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- GROUPING
SELECT GROUPING(shohin_bunrui) AS shohin_bunrui,
      GROUPING(torokubi) AS torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
          THEN '商品分類　合計'
          ELSE shohin_bunrui END AS shohin_bunrui,
      CASE WHEN GROUPING(torokubi) = 1
          THEN '登録日　小計'
          ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
      SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- CUBE
SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
          THEN '商品分類　合計'
          ELSE shohin_bunrui END AS shohin_bunrui,
      CASE WHEN GROUPING(torokubi) = 1
          THEN '登録日　小計'
          ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
      SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY CUBE(shohin_bunrui, torokubi);

-- SETS 
SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
            THEN '商品分類　合計'
            ELSE shohin_bunrui END AS shohin_bunrui,
       CASE WHEN GROUPING(torokubi) = 1
            THEN '登録日　小計'
            ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
       SUM(hanbai_tanka) AS sum_tanka
  FROM Shohin
 GROUP BY GROUPING SETS (shohin_bunrui, torokubi);

 -- 練習問題
 SELECT 
  shohin_mei, 
  torokubi, 
  hanbai_tanka,
  SUM(hanbai_tanka) OVER (ORDER BY torokubi) AS current_sum_tanka
 FROM Shohin;

 SELECT 
  shohin_mei, 
  torokubi, 
  hanbai_tanka,
  SUM(hanbai_tanka) OVER (ORDER BY COALESCE(torokubi, CAST('0001-01-01' AS DATE))) AS current_sum_tanka
 FROM Shohin;

 