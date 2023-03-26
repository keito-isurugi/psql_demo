-- UNION
SELECT shohin_id, shohin_mei
  FROM Shohin
UNION
SELECT shohin_id, shohin_mei
  FROM Shohin2
ORDER BY shohin_id;

SELECT shohin_id, shohin_mei
  FROM Shohin
UNION ALL
SELECT shohin_id, shohin_mei
  FROM Shohin2
ORDER BY shohin_id;

-- INTERSECT
SELECT shohin_id, shohin_mei
  FROM Shohin
INTERSECT
SELECT shohin_id, shohin_mei
  FROM Shohin2
ORDER BY shohin_id;

-- EXCEPT
SELECT shohin_id, shohin_mei
  FROM Shohin
EXCEPT
SELECT shohin_id, shohin_mei
  FROM Shohin2
ORDER BY shohin_id;

-- 内部結合
SELECT T.tenpo_id, T.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS T
INNER JOIN Shohin as S
ON T.shohin_id = S.shohin_id
WHERE T.tenpo_id = '000A';

-- 外部結合
SELECT T.tenpo_id, T.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS T
RIGHT OUTER JOIN Shohin as S
ON T.shohin_id = S.shohin_id;

SELECT T.tenpo_id, T.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS T
LEFT OUTER JOIN Shohin as S
ON T.shohin_id = S.shohin_id;

SELECT T.tenpo_id, T.tenpo_mei, T.shohin_id, S.shohin_mei, S.hanbai_tanka, Z.zaiko_suryo
FROM TenpoShohin AS T
INNER JOIN Shohin as S
ON T.shohin_id = S.shohin_id
INNER JOIN ZaikoShohin as Z
ON T.shohin_id = Z.shohin_id
WHERE Z.souko_id = 'S001';

-- その他結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka, ZS.zaiko_suryo
  FROM TenpoShohin AS TS 
	INNER JOIN Shohin AS S
    ON TS.shohin_id = S.shohin_id
          INNER JOIN ZaikoShohin AS ZS
             ON TS.shohin_id = ZS.shohin_id
 WHERE ZS.souko_id = 'S001'
ORDER BY tenpo_id;

SELECT T.tenpo_id, T.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS T
CROSS JOIN Shohin as S;

-- 練習問題
SELECT 
COALESCE(T.tenpo_id, '不明') as tenpo_id, 
COALESCE(T.tenpo_mei, '不明') as tenpo_mei, 
S.shohin_id, 
S.shohin_mei, 
S.hanbai_tanka
FROM TenpoShohin AS T
RIGHT OUTER JOIN Shohin as S
ON T.shohin_id = S.shohin_id;