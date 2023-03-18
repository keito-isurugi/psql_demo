-- DDL：テーブル作成
CREATE TABLE Chars
(chr CHAR(3) NOT NULL,
     PRIMARY KEY (chr));

--MySQL
-- DML：データ登録
START TRANSACTION;
INSERT INTO Chars VALUES ('1');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');
COMMIT;

select shohin_mei, shiire_tanka from shohin where shiire_tanka <> 2800 or shiire_tanka is null