-- sum
SELECT 
	sum(hanbai_tanka) as sum_hanbai_tanka,
	sum(shiire_tanka) as sum_shiire_tanka,
	sum(hanbai_tanka - shiire_tanka) as "合計利益"
FROM Shohin;

-- GROUP BY
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui;

-- HAVING
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING COUNT(*) = 4;

SELECT 
	sum(hanbai_tanka) as sum_hanbai_tanka,
	sum(shiire_tanka) as sum_shiire_tanka,
	sum(hanbai_tanka - shiire_tanka) as "合計利益"
FROM Shohin
GROUP BY shohin_bunrui
HAVING sum(hanbai_tanka - shiire_tanka) < 200;

-- ORDER BY
SELECT 
	sum(hanbai_tanka) as sum_hanbai_tanka,
	sum(shiire_tanka) as sum_shiire_tanka,
	sum(hanbai_tanka - shiire_tanka) as "合計利益"
FROM Shohin
GROUP BY shohin_bunrui
ORDER BY "合計利益" DESC;

-- 練習問題
SELECT 
shohin_bunrui, 
sum(hanbai_tanka) as sum_hanbai_tanka,
sum(shiire_tanka) as sum_shiire_tanka
FROM Shohin
WHERE shohin_bunrui = '衣服' or shohin_bunrui = '事務用品'
GROUP BY shohin_bunrui
HAVING sum(hanbai_tanka) > sum(shiire_tanka) * 1.5
ORDER BY sum_hanbai_tanka DESC;
