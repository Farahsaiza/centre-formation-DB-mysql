Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> showdatabases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'showdatabases' at line 1
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centreformation    |
| farahshop          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| todolist           |
| world              |
+--------------------+
9 rows in set (2.10 sec)

mysql> use centreformation;
Database changed
mysql> show tables;
+---------------------------+
| Tables_in_centreformation |
+---------------------------+
| catalogue                 |
| etudiant                  |
| formation                 |
| inscription               |
| session                   |
| specialite                |
+---------------------------+
6 rows in set (0.19 sec)

mysql> select * from etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5646789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Master         |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | phd            |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bachelor       |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.67 sec)

mysql> insert into inscription values
    ->     -> ('AB234567',1101,'Distanciel'),
    ->     -> ('AB234567',1201,'Presentiel'),
    ->     -> ('AB234567',1302,'Presentiel'),
    ->     -> ('AB234567',1501,'Distanciel'),
    ->     -> ('G5346789',1101,'Distanciel'),
    ->     -> ('G5346789',1101,'Distanciel'),
    ->     -> ('G5346789',1201,'Presentiel'),
    ->     -> ('G5346789',1302,'Distanciel'),
    ->     -> ('G5346789',1401,'Distanciel'),
    ->     -> ('G5346789',1501,'Presentiel'),
    ->     -> ('C0987265',1101,'Distanciel'),
    ->     -> ('C0987265',1201,'Presentiel'),
    ->     -> ('C0987265',1302,'Presentiel'),
    ->     -> ('C0987265',1401,'Distanciel'),
    ->     -> ('C0987265',1501,'Distanciel'),
    ->     -> ('D2356903',1101,'Distanciel'),
    ->     -> ('D2356903',1201,'Presentiel'),
    ->     -> ('D2356903',1302,'Presentiel'),
    ->     -> ('D2356903',1401,'Distanciel'),
    ->     -> ('D2356903',1501,'Presentiel'),
    ->     -> ('Y1234987',1101,'Distanciel'),
    ->     -> ('Y1234987',1201,'Presentiel'),
    ->     -> ('Y1234987',1302,'Presentiel'),
    ->     -> ('Y1234987',1401,'Distanciel'),
    ->     -> ('Y1234987',1501,'Presentiel'),
    ->     -> ('J3578902',1101,'Distanciel'),
    ->     -> ('J3578902',1201,'Presentiel'),
    ->     -> ('J3578902',1401,'Presentiel'),
    ->     -> ('J3578902',1501,'Presentiel'),
    ->     -> ('F9827363',1101,'Distanciel'),
    ->     -> ('F9827363',1401,'Distanciel'),
    ->     -> ('F9827363',1501,'Presentiel');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> ('AB234567',1101,'Distanciel'),
    -> ('AB234567',1201,'Presentiel'),
    ->' at line 2
mysql> select * from inscription;
Empty set (0.15 sec)

mysql> insert into inscription values
    -> ('AB234567',1101,'Distanciel');
Query OK, 1 row affected (0.77 sec)

mysql> insert into inscription values
    -> ('AB234567',1201,'Presentiel');
Query OK, 1 row affected (0.13 sec)

mysql> insert into inscription values
    ->  ('AB234567',1302,'Presentiel'),
    ->  ('AB234567',1501,'Distanciel');
Query OK, 2 rows affected (0.12 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('G5346789',1101,'Distanciel'),
    ->     ->     -> ('G5346789',1101,'Distanciel'),
    ->     ->     -> ('G5346789',1201,'Presentiel'),
    ->     ->     -> ('G5346789',1302,'Distanciel'),
    ->     ->     -> ('G5346789',1401,'Distanciel'),
    ->     ->     -> ('G5346789',1501,'Presentiel');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->     -> ('G5346789',1101,'Distanciel'),
    ->     -> ('G5346789',1201,'Presen' at line 3
mysql> insert into inscription values
    -> ('G5346789',1101,'Distanciel'),
    -> ('G5346789',1201,'Presentiel'),
    -> ('G5346789',1302,'Distanciel'),
    -> ('G5346789',1401,'Distanciel'),
    -> ('G5346789',1501,'Presentiel');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`centreformation`.`inscription`, CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `etudiant` (`CIN`))
mysql> insert into inscription values
    -> ('G5346789',1101,'Distanciel');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`centreformation`.`inscription`, CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `etudiant` (`CIN`))
mysql> selcect * frometudiant;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selcect * frometudiant' at line 1
mysql> selcect * frometudiant;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selcect * frometudiant' at line 1
mysql> selcect * from  etudiant;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selcect * from  etudiant' at line 1
mysql> select * from  etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5646789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Master         |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | phd            |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bachelor       |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> update etudiant set cin=''G5346789' where cin='G5646789';
    '> ;
    '> /c
    '> \c
    '> ^C
mysql> update etudiant set (cin='G5346789')where cin='G5646789';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(cin='G5346789')where cin='G5646789'' at line 1
mysql> update etudiant set (cin='G5346789') where cin='G5646789';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(cin='G5346789') where cin='G5646789'' at line 1
mysql> update etudiant set cin='G5346789' where cin='G5646789';
Query OK, 1 row affected (0.18 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from  etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Master         |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | phd            |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bachelor       |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> insert into inscription values
    -> ('G5346789',1101,'Distanciel'),
    -> ('G5346789',1201,'Presentiel'),
    -> ('G5346789',1302,'Distanciel'),
    -> ('G5346789',1401,'Distanciel'),
    -> ('G5346789',1501,'Presentiel');
Query OK, 5 rows affected (0.14 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('C0987265',1101,'Distanciel'),
    -> ('C0987265',1201,'Presentiel'),
    -> ('C0987265',1302,'Presentiel'),
    -> ('C0987265',1401,'Distanciel'),
    -> ('C0987265',1501,'Distanciel');
Query OK, 5 rows affected (0.11 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('D2356903',1101,'Distanciel'),
    -> ('D2356903',1201,'Presentiel'),
    -> ('D2356903',1302,'Presentiel'),
    -> ('D2356903',1401,'Distanciel'),
    -> ('D2356903',1501,'Presentiel');
Query OK, 5 rows affected (0.08 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('Y1234987',1101,'Distanciel'),
    -> ('Y1234987',1201,'Presentiel'),
    -> ('Y1234987',1302,'Presentiel'),
    -> ('Y1234987',1401,'Distanciel'),
    -> ('Y1234987',1501,'Presentiel');
Query OK, 5 rows affected (0.11 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('J3578902',1101,'Distanciel'),
    -> ('J3578902',1201,'Presentiel'),
    -> ('J3578902',1401,'Presentiel'),
    -> ('J3578902',1501,'Presentiel');
Query OK, 4 rows affected (0.11 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into inscription values
    -> ('F9827363',1101,'Distanciel'),
    -> ('F9827363',1401,'Distanciel'),
    -> ('F9827363',1501,'Presentiel');
Query OK, 3 rows affected (0.06 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from inspription;
ERROR 1146 (42S02): Table 'centreformation.inspription' doesn't exist
mysql> select * from inscription;
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| AB234567 |      1101 | Distanciel |
| AB234567 |      1201 | Presentiel |
| AB234567 |      1302 | Presentiel |
| AB234567 |      1501 | Distanciel |
| G5346789 |      1101 | Distanciel |
| G5346789 |      1201 | Presentiel |
| G5346789 |      1302 | Distanciel |
| G5346789 |      1401 | Distanciel |
| G5346789 |      1501 | Presentiel |
| C0987265 |      1101 | Distanciel |
| C0987265 |      1201 | Presentiel |
| C0987265 |      1302 | Presentiel |
| C0987265 |      1401 | Distanciel |
| C0987265 |      1501 | Distanciel |
| D2356903 |      1101 | Distanciel |
| D2356903 |      1201 | Presentiel |
| D2356903 |      1302 | Presentiel |
| D2356903 |      1401 | Distanciel |
| D2356903 |      1501 | Presentiel |
| Y1234987 |      1101 | Distanciel |
| Y1234987 |      1201 | Presentiel |
| Y1234987 |      1302 | Presentiel |
| Y1234987 |      1401 | Distanciel |
| Y1234987 |      1501 | Presentiel |
| J3578902 |      1101 | Distanciel |
| J3578902 |      1201 | Presentiel |
| J3578902 |      1401 | Presentiel |
| J3578902 |      1501 | Presentiel |
| F9827363 |      1101 | Distanciel |
| F9827363 |      1401 | Distanciel |
| F9827363 |      1501 | Presentiel |
+----------+-----------+------------+
31 rows in set (0.00 sec)

mysql> select * from etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Master         |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | phd            |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bachelor       |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> update set niveauscolaire = 'Bac+5' where cin='G5346789';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set niveauscolaire = 'Bac+5' where cin='G5346789'' at line 1
mysql> update set niveauscolaire='Bac+5' where cin='G5346789';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set niveauscolaire='Bac+5' where cin='G5346789'' at line 1
mysql> update set NiveauScolaire='Bac+5' where cin='G5346789';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set NiveauScolaire='Bac+5' where cin='G5346789'' at line 1
mysql> update etudiant  set NiveauScolaire='Bac+5' where cin='G5346789';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Bac+5          |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | phd            |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bachelor       |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> update etudiant  set NiveauScolaire='Bac+4' where cin='Y1234987';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update etudiant  set NiveauScolaire='Doctorat' where cin='J3578902';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant;
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom            | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami          | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni          | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 |  Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf        | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Bac+5          |
| J3578902 | Ben Omar       | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | Doctorat       |
| Y1234987 | Ouled thami    | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bac+4          |
+----------+----------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> update etudiant  set nom='Idrissi Alami' where cin='D2356903';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant;
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom           | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 | Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Bac+5          |
| J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | Doctorat       |
| Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bac+4          |
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.03 sec)

mysql> select * from formation;
+---------------+------------------------+-------+------+
| CodeFormation | titre                  | Duree | prix |
+---------------+------------------------+-------+------+
|            11 | programming java       |    12 | 3600 |
|            12 | web devloppement       |    14 | 4200 |
|            13 | anglais technique      |    15 | 3750 |
|            14 | Communication          |    10 | 2500 |
|            15 | Base de donnees Oracle |    20 | 6000 |
|            16 | soft skills            |    12 | 3000 |
+---------------+------------------------+-------+------+
6 rows in set (0.11 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.44 sec)

mysql> select CONCAT('cin','idsession')  as NumInscription from inscription;
+----------------+
| NumInscription |
+----------------+
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
| cinidsession   |
+----------------+
31 rows in set (0.02 sec)

mysql> select * CONCAT(cin,idsession)  as NumInscription from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CONCAT(cin,idsession)  as NumInscription from inscription' at line 1
mysql> select CONCAT(cin,idsession)  as NumInscription from inscription;
+----------------+
| NumInscription |
+----------------+
| AB2345671101   |
| AB2345671201   |
| AB2345671302   |
| AB2345671501   |
| G53467891101   |
| G53467891201   |
| G53467891302   |
| G53467891401   |
| G53467891501   |
| C09872651101   |
| C09872651201   |
| C09872651302   |
| C09872651401   |
| C09872651501   |
| D23569031101   |
| D23569031201   |
| D23569031302   |
| D23569031401   |
| D23569031501   |
| Y12349871101   |
| Y12349871201   |
| Y12349871302   |
| Y12349871401   |
| Y12349871501   |
| J35789021101   |
| J35789021201   |
| J35789021401   |
| J35789021501   |
| F98273631101   |
| F98273631401   |
| F98273631501   |
+----------------+
31 rows in set (0.00 sec)

mysql> select cin idsession CONCAT(cin,idsession)  as NumInscription from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CONCAT(cin,idsession)  as NumInscription from inscription' at line 1
mysql> select cin , idsession  , CONCAT(cin,idsession)  as NumInscription from inscription;
+----------+-----------+----------------+
| cin      | idsession | NumInscription |
+----------+-----------+----------------+
| AB234567 |      1101 | AB2345671101   |
| AB234567 |      1201 | AB2345671201   |
| AB234567 |      1302 | AB2345671302   |
| AB234567 |      1501 | AB2345671501   |
| G5346789 |      1101 | G53467891101   |
| G5346789 |      1201 | G53467891201   |
| G5346789 |      1302 | G53467891302   |
| G5346789 |      1401 | G53467891401   |
| G5346789 |      1501 | G53467891501   |
| C0987265 |      1101 | C09872651101   |
| C0987265 |      1201 | C09872651201   |
| C0987265 |      1302 | C09872651302   |
| C0987265 |      1401 | C09872651401   |
| C0987265 |      1501 | C09872651501   |
| D2356903 |      1101 | D23569031101   |
| D2356903 |      1201 | D23569031201   |
| D2356903 |      1302 | D23569031302   |
| D2356903 |      1401 | D23569031401   |
| D2356903 |      1501 | D23569031501   |
| Y1234987 |      1101 | Y12349871101   |
| Y1234987 |      1201 | Y12349871201   |
| Y1234987 |      1302 | Y12349871302   |
| Y1234987 |      1401 | Y12349871401   |
| Y1234987 |      1501 | Y12349871501   |
| J3578902 |      1101 | J35789021101   |
| J3578902 |      1201 | J35789021201   |
| J3578902 |      1401 | J35789021401   |
| J3578902 |      1501 | J35789021501   |
| F9827363 |      1101 | F98273631101   |
| F9827363 |      1401 | F98273631401   |
| F9827363 |      1501 | F98273631501   |
+----------+-----------+----------------+
31 rows in set (0.00 sec)

mysql> select * from etudiant ;
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
| CIN      | Nom           | Prenom       | DateNaissance | Adresse                                | ville      | NiveauScolaire |
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
| AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                         | Tanger     | bac            |
| C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                    | Tanger     | Niveau bac     |
| D2356903 | Idrissi Alami | Mohammed     | 1996-05-05    |  Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum   | Rabat      | Bac+2          |
| G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                  | Casablanca | Bac+5          |
| J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami               | Kenitre    | Doctorat       |
| Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6       | Tanger     | Bac+4          |
+----------+---------------+--------------+---------------+----------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> update etudiant set DateNaissance='1996-01-02', Adresse='Lotissement najah,rue n 12 immeuble 3' where cin='D2356903';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant ;
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| CIN      | Nom           | Prenom       | DateNaissance | Adresse                               | ville      | NiveauScolaire |
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |
| G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> select * from inscription where cin='G5346789';
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| G5346789 |      1101 | Distanciel |
| G5346789 |      1201 | Presentiel |
| G5346789 |      1302 | Distanciel |
| G5346789 |      1401 | Distanciel |
| G5346789 |      1501 | Presentiel |
+----------+-----------+------------+
5 rows in set (0.02 sec)

mysql> update inscription set TypeCours='Distanciel' where cin='G5346789';
Query OK, 2 rows affected (0.07 sec)
Rows matched: 5  Changed: 2  Warnings: 0

mysql> select * from inscription where cin='G5346789';
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| G5346789 |      1101 | Distanciel |
| G5346789 |      1201 | Distanciel |
| G5346789 |      1302 | Distanciel |
| G5346789 |      1401 | Distanciel |
| G5346789 |      1501 | Distanciel |
+----------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select  * from etudiant where ville='tanger';
+----------+-------------+--------+---------------+----------------------------------+--------+----------------+
| CIN      | Nom         | Prenom | DateNaissance | Adresse                          | ville  | NiveauScolaire |
+----------+-------------+--------+---------------+----------------------------------+--------+----------------+
| AB234567 | Alami       | Ahmed  | 1986-01-01    | Rue du port,13                   | Tanger | bac            |
| C0987265 | Souni       | Sanaa  | 1998-04-30    | Place du peuple n 2              | Tanger | Niveau bac     |
| Y1234987 | Ouled thami | Ali    | 1979-04-12    | La ville haute, rue chouhada n 6 | Tanger | Bac+4          |
+----------+-------------+--------+---------------+----------------------------------+--------+----------------+
3 rows in set (0.00 sec)

mysql> desc formation;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| CodeFormation | int         | NO   | PRI | NULL    |       |
| titre         | varchar(45) | YES  |     | NULL    |       |
| Duree         | int         | YES  |     | NULL    |       |
| prix          | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> select * from formation where prix > 3000;
+---------------+------------------------+-------+------+
| CodeFormation | titre                  | Duree | prix |
+---------------+------------------------+-------+------+
|            11 | programming java       |    12 | 3600 |
|            12 | web devloppement       |    14 | 4200 |
|            13 | anglais technique      |    15 | 3750 |
|            15 | Base de donnees Oracle |    20 | 6000 |
+---------------+------------------------+-------+------+
4 rows in set (0.00 sec)

mysql> select  * from formation;
+---------------+------------------------+-------+------+
| CodeFormation | titre                  | Duree | prix |
+---------------+------------------------+-------+------+
|            11 | programming java       |    12 | 3600 |
|            12 | web devloppement       |    14 | 4200 |
|            13 | anglais technique      |    15 | 3750 |
|            14 | Communication          |    10 | 2500 |
|            15 | Base de donnees Oracle |    20 | 6000 |
|            16 | soft skills            |    12 | 3000 |
+---------------+------------------------+-------+------+
6 rows in set (0.00 sec)

mysql> select CodeFormation,titre,Duree, prix/30 as prixjour from formation;
+---------------+------------------------+-------+----------+
| CodeFormation | titre                  | Duree | prixjour |
+---------------+------------------------+-------+----------+
|            11 | programming java       |    12 | 120.0000 |
|            12 | web devloppement       |    14 | 140.0000 |
|            13 | anglais technique      |    15 | 125.0000 |
|            14 | Communication          |    10 |  83.3333 |
|            15 | Base de donnees Oracle |    20 | 200.0000 |
|            16 | soft skills            |    12 | 100.0000 |
+---------------+------------------------+-------+----------+
6 rows in set (0.05 sec)

mysql> desc session;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| CodeSession | int         | NO   | PRI | NULL    |       |
| NomSess     | varchar(45) | YES  |     | NULL    |       |
| DateDebut   | date        | YES  |     | NULL    |       |
| DateFin     | date        | YES  |     | NULL    |       |
| CodeForm    | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.04 sec)

mysql> select * from session where datedebut < now() and codeform=11;
+-------------+-------------+------------+------------+----------+
| CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+-------------+-------------+------------+------------+----------+
|        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
|        1102 | session1102 | 2022-02-03 | 2022-03-15 |       11 |
|        1104 | session1104 | 2022-10-15 | 2022-10-27 |       11 |
+-------------+-------------+------------+------------+----------+
3 rows in set (0.13 sec)

mysql> select * from session where datedebut > now() and codeform=11;
Empty set (0.00 sec)

mysql> Update TableName set date = DateAdd(yy,+2,Date);
ERROR 1146 (42S02): Table 'centreformation.tablename' doesn't exist
mysql> select * from session;
+-------------+-------------+------------+------------+----------+
| CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+-------------+-------------+------------+------------+----------+
|        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
|        1102 | session1102 | 2022-02-03 | 2022-03-15 |       11 |
|        1104 | session1104 | 2022-10-15 | 2022-10-27 |       11 |
|        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
|        1202 | session1202 | 2022-04-05 | 2022-04-19 |       12 |
|        1203 | session1203 | 2022-11-16 | 2022-11-30 |       12 |
|        1204 | session1204 | 2022-12-17 | 2022-12-31 |       12 |
|        1301 | session1301 | 2022-01-06 | 2022-01-21 |       13 |
|        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
|        1303 | session1303 | 2022-06-08 | 2022-06-23 |       13 |
|        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
|        1402 | session1402 | 2022-08-08 | 2022-08-18 |       14 |
|        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
|        1502 | session1502 | 2022-09-12 | 2022-10-02 |       15 |
|        1601 | session1601 | 2022-09-13 | 2022-09-25 |       16 |
|        1602 | session1602 | 2022-10-14 | 2022-10-26 |       16 |
+-------------+-------------+------------+------------+----------+
16 rows in set (0.00 sec)

mysql> Update session set datedebut = DateAdd(yy,+2,Date) and datefin = DateAdd(yy,+2,Date);
ERROR 1305 (42000): FUNCTION centreformation.DateAdd does not exist
mysql> Update session set datedebut = DateAdd(yy,+2,Datedebut) and datefin = DateAdd(yy,+2,Datefin);
ERROR 1305 (42000): FUNCTION centreformation.DateAdd does not exist
mysql> desc formation;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| CodeFormation | int         | NO   | PRI | NULL    |       |
| titre         | varchar(45) | YES  |     | NULL    |       |
| Duree         | int         | YES  |     | NULL    |       |
| prix          | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> select * from session join formation  where session.codeform = formation.codeformation;
+-------------+-------------+------------+------------+----------+---------------+------------------------+-------+------+
| CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm | CodeFormation | titre                  | Duree | prix |
+-------------+-------------+------------+------------+----------+---------------+------------------------+-------+------+
|        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |            11 | programming java       |    12 | 3600 |
|        1102 | session1102 | 2022-02-03 | 2022-03-15 |       11 |            11 | programming java       |    12 | 3600 |
|        1104 | session1104 | 2022-10-15 | 2022-10-27 |       11 |            11 | programming java       |    12 | 3600 |
|        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |            12 | web devloppement       |    14 | 4200 |
|        1202 | session1202 | 2022-04-05 | 2022-04-19 |       12 |            12 | web devloppement       |    14 | 4200 |
|        1203 | session1203 | 2022-11-16 | 2022-11-30 |       12 |            12 | web devloppement       |    14 | 4200 |
|        1204 | session1204 | 2022-12-17 | 2022-12-31 |       12 |            12 | web devloppement       |    14 | 4200 |
|        1301 | session1301 | 2022-01-06 | 2022-01-21 |       13 |            13 | anglais technique      |    15 | 3750 |
|        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |            13 | anglais technique      |    15 | 3750 |
|        1303 | session1303 | 2022-06-08 | 2022-06-23 |       13 |            13 | anglais technique      |    15 | 3750 |
|        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |            14 | Communication          |    10 | 2500 |
|        1402 | session1402 | 2022-08-08 | 2022-08-18 |       14 |            14 | Communication          |    10 | 2500 |
|        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |            15 | Base de donnees Oracle |    20 | 6000 |
|        1502 | session1502 | 2022-09-12 | 2022-10-02 |       15 |            15 | Base de donnees Oracle |    20 | 6000 |
|        1601 | session1601 | 2022-09-13 | 2022-09-25 |       16 |            16 | soft skills            |    12 | 3000 |
|        1602 | session1602 | 2022-10-14 | 2022-10-26 |       16 |            16 | soft skills            |    12 | 3000 |
+-------------+-------------+------------+------------+----------+---------------+------------------------+-------+------+
16 rows in set (0.03 sec)

mysql> select CodeFormation,titre,Duree,CodeSession,NomSess,DateDebut,DateFin from session join formation  where session.codeform = formation.codeformation;
+---------------+------------------------+-------+-------------+-------------+------------+------------+
| CodeFormation | titre                  | Duree | CodeSession | NomSess     | DateDebut  | DateFin    |
+---------------+------------------------+-------+-------------+-------------+------------+------------+
|            11 | programming java       |    12 |        1101 | session1101 | 2022-01-02 | 2022-01-14 |
|            11 | programming java       |    12 |        1102 | session1102 | 2022-02-03 | 2022-03-15 |
|            11 | programming java       |    12 |        1104 | session1104 | 2022-10-15 | 2022-10-27 |
|            12 | web devloppement       |    14 |        1201 | session1201 | 2022-03-04 | 2022-03-18 |
|            12 | web devloppement       |    14 |        1202 | session1202 | 2022-04-05 | 2022-04-19 |
|            12 | web devloppement       |    14 |        1203 | session1203 | 2022-11-16 | 2022-11-30 |
|            12 | web devloppement       |    14 |        1204 | session1204 | 2022-12-17 | 2022-12-31 |
|            13 | anglais technique      |    15 |        1301 | session1301 | 2022-01-06 | 2022-01-21 |
|            13 | anglais technique      |    15 |        1302 | session1302 | 2022-05-07 | 2022-05-22 |
|            13 | anglais technique      |    15 |        1303 | session1303 | 2022-06-08 | 2022-06-23 |
|            14 | Communication          |    10 |        1401 | session1401 | 2022-09-01 | 2022-09-11 |
|            14 | Communication          |    10 |        1402 | session1402 | 2022-08-08 | 2022-08-18 |
|            15 | Base de donnees Oracle |    20 |        1501 | session1501 | 2022-11-11 | 2022-12-01 |
|            15 | Base de donnees Oracle |    20 |        1502 | session1502 | 2022-09-12 | 2022-10-02 |
|            16 | soft skills            |    12 |        1601 | session1601 | 2022-09-13 | 2022-09-25 |
|            16 | soft skills            |    12 |        1602 | session1602 | 2022-10-14 | 2022-10-26 |
+---------------+------------------------+-------+-------------+-------------+------------+------------+
16 rows in set (0.00 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> select * from inscription where IdSession=1302 order by cin asc;
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| AB234567 |      1302 | Presentiel |
| C0987265 |      1302 | Presentiel |
| D2356903 |      1302 | Presentiel |
| G5346789 |      1302 | Distanciel |
| Y1234987 |      1302 | Presentiel |
+----------+-----------+------------+
5 rows in set (0.03 sec)

mysql> desc specialite;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| CodeSpec | int         | NO   | PRI | NULL    |       |
| NomSpec  | varchar(45) | YES  |     | NULL    |       |
| DescSpec | varchar(45) | YES  |     | NULL    |       |
| Active   | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.07 sec)

mysql> select * from specialite where active=1;
+----------+---------------+---------------------------------+--------+
| CodeSpec | NomSpec       | DescSpec                        | Active |
+----------+---------------+---------------------------------+--------+
|      101 | GL            | Genie logiciel et developpement |      1 |
|      102 | Data          | Data engineering                |      1 |
|      103 | Langue        | Anglais, Français               |      1 |
|      104 | Communication | Communication                   |      1 |
+----------+---------------+---------------------------------+--------+
4 rows in set (0.84 sec)

mysql> select * from specialite;
+----------+---------------+---------------------------------+--------+
| CodeSpec | NomSpec       | DescSpec                        | Active |
+----------+---------------+---------------------------------+--------+
|      101 | GL            | Genie logiciel et developpement |      1 |
|      102 | Data          | Data engineering                |      1 |
|      103 | Langue        | Anglais, Français               |      1 |
|      104 | Communication | Communication                   |      1 |
|      105 | Securite      | Reseaux et securite             |      0 |
+----------+---------------+---------------------------------+--------+
5 rows in set (0.00 sec)

mysql> select count(cin) from etudiant;
+------------+
| count(cin) |
+------------+
|          7 |
+------------+
1 row in set (0.41 sec)

mysql> desc etudiant;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| CIN            | varchar(45) | NO   | PRI | NULL    |       |
| Nom            | varchar(45) | YES  |     | NULL    |       |
| Prenom         | varchar(45) | YES  |     | NULL    |       |
| DateNaissance  | date        | YES  |     | NULL    |       |
| Adresse        | varchar(45) | YES  |     | NULL    |       |
| ville          | varchar(45) | YES  |     | NULL    |       |
| NiveauScolaire | varchar(45) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.04 sec)

mysql> select nom ,prenom , age= now()-datenaissance as age from etudiant;
ERROR 1054 (42S22): Unknown column 'age' in 'field list'
mysql> select nom ,prenom , now()-datenaissance as age from etudiant;
+---------------+--------------+----------------+
| nom           | prenom       | age            |
+---------------+--------------+----------------+
| Alami         | Ahmed        | 20240487140341 |
| Souni         | Sanaa        | 20240487020012 |
| Idrissi Alami | Mohammed     | 20240487040340 |
| Boudiaf       | Fatima zohra | 20240487030332 |
| Toumi         | Aicha        | 20240487000130 |
| Ben Omar      | Abd Allah    | 20240487099838 |
| Ouled thami   | Ali          | 20240487210030 |
+---------------+--------------+----------------+
7 rows in set (0.02 sec)

mysql> select nom ,prenom , TIMESTAMPDIFF(year,now,datenaissance) as age from etudiant;
ERROR 1054 (42S22): Unknown column 'now' in 'field list'
mysql> select nom ,prenom , TIMESTAMPDIFF(year,now(),datenaissance) as age from etudiant;
+---------------+--------------+------+
| nom           | prenom       | age  |
+---------------+--------------+------+
| Alami         | Ahmed        |  -38 |
| Souni         | Sanaa        |  -26 |
| Idrissi Alami | Mohammed     |  -28 |
| Boudiaf       | Fatima zohra |  -27 |
| Toumi         | Aicha        |  -24 |
| Ben Omar      | Abd Allah    |  -33 |
| Ouled thami   | Ali          |  -45 |
+---------------+--------------+------+
7 rows in set (0.01 sec)

mysql> select nom ,prenom , TIMESTAMPDIFF(year,datenaissance,now()) as age from etudiant;
+---------------+--------------+------+
| nom           | prenom       | age  |
+---------------+--------------+------+
| Alami         | Ahmed        |   38 |
| Souni         | Sanaa        |   26 |
| Idrissi Alami | Mohammed     |   28 |
| Boudiaf       | Fatima zohra |   27 |
| Toumi         | Aicha        |   24 |
| Ben Omar      | Abd Allah    |   33 |
| Ouled thami   | Ali          |   45 |
+---------------+--------------+------+
7 rows in set (0.00 sec)

mysql> select * from etudiant  ;
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| CIN      | Nom           | Prenom       | DateNaissance | Adresse                               | ville      | NiveauScolaire |
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |
| G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
7 rows in set (0.00 sec)

mysql> desc formation;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| CodeFormation | int         | NO   | PRI | NULL    |       |
| titre         | varchar(45) | YES  |     | NULL    |       |
| Duree         | int         | YES  |     | NULL    |       |
| prix          | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select min(prix) as moinChere and max(prix) as plusChere from formation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'and max(prix) as plusChere from formation' at line 1
mysql> select min(prix) as moinChere  from formation;
+-----------+
| moinChere |
+-----------+
|      2500 |
+-----------+
1 row in set (0.05 sec)

mysql> select max(prix) as moinChere  from formation;
+-----------+
| moinChere |
+-----------+
|      6000 |
+-----------+
1 row in set (0.00 sec)

mysql> select min(prix) as moinChere && max(prix) as plusChere from formation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '&& max(prix) as plusChere from formation' at line 1
mysql> select sum(prix) from formation;
+-----------+
| sum(prix) |
+-----------+
|     23050 |
+-----------+
1 row in set (0.03 sec)

mysql> select avg(prix) from formation;
+-----------+
| avg(prix) |
+-----------+
| 3841.6667 |
+-----------+
1 row in set (0.03 sec)

mysql> select prix from formation;
+------+
| prix |
+------+
| 3600 |
| 4200 |
| 3750 |
| 2500 |
| 6000 |
| 3000 |
+------+
6 rows in set (0.00 sec)

mysql> select * from session;
+-------------+-------------+------------+------------+----------+
| CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+-------------+-------------+------------+------------+----------+
|        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
|        1102 | session1102 | 2022-02-03 | 2022-03-15 |       11 |
|        1104 | session1104 | 2022-10-15 | 2022-10-27 |       11 |
|        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
|        1202 | session1202 | 2022-04-05 | 2022-04-19 |       12 |
|        1203 | session1203 | 2022-11-16 | 2022-11-30 |       12 |
|        1204 | session1204 | 2022-12-17 | 2022-12-31 |       12 |
|        1301 | session1301 | 2022-01-06 | 2022-01-21 |       13 |
|        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
|        1303 | session1303 | 2022-06-08 | 2022-06-23 |       13 |
|        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
|        1402 | session1402 | 2022-08-08 | 2022-08-18 |       14 |
|        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
|        1502 | session1502 | 2022-09-12 | 2022-10-02 |       15 |
|        1601 | session1601 | 2022-09-13 | 2022-09-25 |       16 |
|        1602 | session1602 | 2022-10-14 | 2022-10-26 |       16 |
+-------------+-------------+------------+------------+----------+
16 rows in set (0.05 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select idsesseion , count(*) as nbretudiant from inscription groupe  by idsession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by idsession' at line 1
mysql> select idsession , count(*)  from inscription groupe  by idsession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by idsession' at line 1
mysql> select idsession , count(*)  from inscription group  by idsession;
+-----------+----------+
| idsession | count(*) |
+-----------+----------+
|      1101 |        7 |
|      1201 |        6 |
|      1302 |        5 |
|      1401 |        6 |
|      1501 |        7 |
+-----------+----------+
5 rows in set (0.32 sec)

mysql> select * inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'inscription' at line 1
mysql> select * from inscription;
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| AB234567 |      1101 | Distanciel |
| AB234567 |      1201 | Presentiel |
| AB234567 |      1302 | Presentiel |
| AB234567 |      1501 | Distanciel |
| G5346789 |      1101 | Distanciel |
| G5346789 |      1201 | Distanciel |
| G5346789 |      1302 | Distanciel |
| G5346789 |      1401 | Distanciel |
| G5346789 |      1501 | Distanciel |
| C0987265 |      1101 | Distanciel |
| C0987265 |      1201 | Presentiel |
| C0987265 |      1302 | Presentiel |
| C0987265 |      1401 | Distanciel |
| C0987265 |      1501 | Distanciel |
| D2356903 |      1101 | Distanciel |
| D2356903 |      1201 | Presentiel |
| D2356903 |      1302 | Presentiel |
| D2356903 |      1401 | Distanciel |
| D2356903 |      1501 | Presentiel |
| Y1234987 |      1101 | Distanciel |
| Y1234987 |      1201 | Presentiel |
| Y1234987 |      1302 | Presentiel |
| Y1234987 |      1401 | Distanciel |
| Y1234987 |      1501 | Presentiel |
| J3578902 |      1101 | Distanciel |
| J3578902 |      1201 | Presentiel |
| J3578902 |      1401 | Presentiel |
| J3578902 |      1501 | Presentiel |
| F9827363 |      1101 | Distanciel |
| F9827363 |      1401 | Distanciel |
| F9827363 |      1501 | Presentiel |
+----------+-----------+------------+
31 rows in set (0.03 sec)

mysql> select idsession , count(*) as nbretudiant from inscription groupe  by idsession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by idsession' at line 1
mysql> select idsession , count(*) as nbretudiant from inscription group by idsession;
+-----------+-------------+
| idsession | nbretudiant |
+-----------+-------------+
|      1101 |           7 |
|      1201 |           6 |
|      1302 |           5 |
|      1401 |           6 |
|      1501 |           7 |
+-----------+-------------+
5 rows in set (0.01 sec)

mysql> select cin where count(*)>3 by cin from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by cin from inscription' at line 1
mysql> select cin where count(cin)>3 by cin from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'by cin from inscription' at line 1
mysql> select cin where count(cin)>3 group by cin from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription' at line 1
mysql> select cin where count('F9827363') group by cin from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription' at line 1
mysql> select cin ,count('F9827363')from inscription;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'centreformation.inscription.CIN'; this is incompatible with sql_mode=only_full_group_by
mysql> select cin ,count('F9827363')from inscription group by cin;
+----------+-------------------+
| cin      | count('F9827363') |
+----------+-------------------+
| AB234567 |                 4 |
| C0987265 |                 5 |
| D2356903 |                 5 |
| F9827363 |                 3 |
| G5346789 |                 5 |
| J3578902 |                 4 |
| Y1234987 |                 5 |
+----------+-------------------+
7 rows in set (0.02 sec)

mysql> select cin ,count()from inscription group by cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')from inscription group by cin' at line 1
mysql> select cin ,count(*)from inscription group by cin;
+----------+----------+
| cin      | count(*) |
+----------+----------+
| AB234567 |        4 |
| C0987265 |        5 |
| D2356903 |        5 |
| F9827363 |        3 |
| G5346789 |        5 |
| J3578902 |        4 |
| Y1234987 |        5 |
+----------+----------+
7 rows in set (0.03 sec)

mysql> select cin ,count(*)>3 from inscription group by cin;
+----------+------------+
| cin      | count(*)>3 |
+----------+------------+
| AB234567 |          1 |
| C0987265 |          1 |
| D2356903 |          1 |
| F9827363 |          0 |
| G5346789 |          1 |
| J3578902 |          1 |
| Y1234987 |          1 |
+----------+------------+
7 rows in set (0.03 sec)

mysql> select cin ,count()>3 from inscription group by cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')>3 from inscription group by cin' at line 1
mysql> select cin ,count(cin)>3 from inscription group by cin;
+----------+--------------+
| cin      | count(cin)>3 |
+----------+--------------+
| AB234567 |            1 |
| C0987265 |            1 |
| D2356903 |            1 |
| F9827363 |            0 |
| G5346789 |            1 |
| J3578902 |            1 |
| Y1234987 |            1 |
+----------+--------------+
7 rows in set (0.03 sec)

mysql> select cin from  inscription where count(*)>3;
ERROR 1111 (HY000): Invalid use of group function
mysql> select cin from  inscription where count(*)>3 group by  cin;
ERROR 1111 (HY000): Invalid use of group function
mysql> select cin ,count(*)from inscription group by cin;
+----------+----------+
| cin      | count(*) |
+----------+----------+
| AB234567 |        4 |
| C0987265 |        5 |
| D2356903 |        5 |
| F9827363 |        3 |
| G5346789 |        5 |
| J3578902 |        4 |
| Y1234987 |        5 |
+----------+----------+
7 rows in set (0.01 sec)

mysql> select cin ,count(*)from inscription group by cin where count(*)>3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where count(*)>3' at line 1
mysql> select cin ,count(*)from inscription group by cin as  nbre where nbre>3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as  nbre where nbre>3' at line 1
mysql> select cin ,count(*)from inscription group by cin as  nbre ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as  nbre' at line 1
mysql> select cin ,count(*) as nbre from inscription group by cin;
+----------+------+
| cin      | nbre |
+----------+------+
| AB234567 |    4 |
| C0987265 |    5 |
| D2356903 |    5 |
| F9827363 |    3 |
| G5346789 |    5 |
| J3578902 |    4 |
| Y1234987 |    5 |
+----------+------+
7 rows in set (0.00 sec)

mysql> select cin ,count(*) as nbre from inscription group by cin where nbre>3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where nbre>3' at line 1
mysql> desc session
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| CodeSession | int         | NO   | PRI | NULL    |       |
| NomSess     | varchar(45) | YES  |     | NULL    |       |
| DateDebut   | date        | YES  |     | NULL    |       |
| DateFin     | date        | YES  |     | NULL    |       |
| CodeForm    | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.18 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql> select cin,nom,prenom,ville,adresse ,count(*) as nbre from inscription group by cin join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select cin,nom,prenom,ville,adresse ,count(*) as nbre group by cin from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> descetudiant;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'descetudiant' at line 1
mysql> desc etudiant;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| CIN            | varchar(45) | NO   | PRI | NULL    |       |
| Nom            | varchar(45) | YES  |     | NULL    |       |
| Prenom         | varchar(45) | YES  |     | NULL    |       |
| DateNaissance  | date        | YES  |     | NULL    |       |
| Adresse        | varchar(45) | YES  |     | NULL    |       |
| ville          | varchar(45) | YES  |     | NULL    |       |
| NiveauScolaire | varchar(45) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.05 sec)

mysql> select cin,nom,prenom,ville,adresse ,count(*) group by cin from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select cin,nom,prenom,ville,adresse  from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1052 (23000): Column 'cin' in field list is ambiguous
mysql> select * from inscription join etudiant where inscription.cin=etudiant.cin;
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| CIN      | IdSession | TypeCours  | CIN      | Nom           | Prenom       | DateNaissance | Adresse                               | ville      | NiveauScolaire |
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
| AB234567 |      1101 | Distanciel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| AB234567 |      1201 | Presentiel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| AB234567 |      1302 | Presentiel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| AB234567 |      1501 | Distanciel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |
| C0987265 |      1101 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| C0987265 |      1201 | Presentiel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| C0987265 |      1302 | Presentiel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| C0987265 |      1401 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| C0987265 |      1501 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |
| D2356903 |      1101 | Distanciel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| D2356903 |      1201 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| D2356903 |      1302 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| D2356903 |      1401 | Distanciel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| D2356903 |      1501 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |
| F9827363 |      1101 | Distanciel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |
| F9827363 |      1401 | Distanciel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |
| F9827363 |      1501 | Presentiel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |
| G5346789 |      1101 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| G5346789 |      1201 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| G5346789 |      1302 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| G5346789 |      1401 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| G5346789 |      1501 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |
| J3578902 |      1101 | Distanciel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| J3578902 |      1201 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| J3578902 |      1401 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| J3578902 |      1501 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |
| Y1234987 |      1101 | Distanciel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
| Y1234987 |      1201 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
| Y1234987 |      1302 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
| Y1234987 |      1401 | Distanciel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
| Y1234987 |      1501 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+
31 rows in set (0.04 sec)

mysql> select cin,idsession,typecours,nom,prenom,ville from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1052 (23000): Column 'cin' in field list is ambiguous
mysql> select CIN,idsession,typecours,nom,prenom,ville from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1052 (23000): Column 'CIN' in field list is ambiguous
mysql> select CIN.etudiant,idsession,typecours,nom,prenom,ville from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1054 (42S22): Unknown column 'CIN.etudiant' in 'field list'
mysql> select CIN,idsession,typecours,nom,prenom,ville from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1052 (23000): Column 'CIN' in field list is ambiguous
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville from inscription join etudiant where inscription.cin=etudiant.cin;
+----------+-----------+------------+---------------+--------------+------------+
| CIN      | idsession | typecours  | nom           | prenom       | ville      |
+----------+-----------+------------+---------------+--------------+------------+
| AB234567 |      1101 | Distanciel | Alami         | Ahmed        | Tanger     |
| AB234567 |      1201 | Presentiel | Alami         | Ahmed        | Tanger     |
| AB234567 |      1302 | Presentiel | Alami         | Ahmed        | Tanger     |
| AB234567 |      1501 | Distanciel | Alami         | Ahmed        | Tanger     |
| C0987265 |      1101 | Distanciel | Souni         | Sanaa        | Tanger     |
| C0987265 |      1201 | Presentiel | Souni         | Sanaa        | Tanger     |
| C0987265 |      1302 | Presentiel | Souni         | Sanaa        | Tanger     |
| C0987265 |      1401 | Distanciel | Souni         | Sanaa        | Tanger     |
| C0987265 |      1501 | Distanciel | Souni         | Sanaa        | Tanger     |
| D2356903 |      1101 | Distanciel | Idrissi Alami | Mohammed     | Rabat      |
| D2356903 |      1201 | Presentiel | Idrissi Alami | Mohammed     | Rabat      |
| D2356903 |      1302 | Presentiel | Idrissi Alami | Mohammed     | Rabat      |
| D2356903 |      1401 | Distanciel | Idrissi Alami | Mohammed     | Rabat      |
| D2356903 |      1501 | Presentiel | Idrissi Alami | Mohammed     | Rabat      |
| F9827363 |      1101 | Distanciel | Boudiaf       | Fatima zohra | Rabat      |
| F9827363 |      1401 | Distanciel | Boudiaf       | Fatima zohra | Rabat      |
| F9827363 |      1501 | Presentiel | Boudiaf       | Fatima zohra | Rabat      |
| G5346789 |      1101 | Distanciel | Toumi         | Aicha        | Casablanca |
| G5346789 |      1201 | Distanciel | Toumi         | Aicha        | Casablanca |
| G5346789 |      1302 | Distanciel | Toumi         | Aicha        | Casablanca |
| G5346789 |      1401 | Distanciel | Toumi         | Aicha        | Casablanca |
| G5346789 |      1501 | Distanciel | Toumi         | Aicha        | Casablanca |
| J3578902 |      1101 | Distanciel | Ben Omar      | Abd Allah    | Kenitre    |
| J3578902 |      1201 | Presentiel | Ben Omar      | Abd Allah    | Kenitre    |
| J3578902 |      1401 | Presentiel | Ben Omar      | Abd Allah    | Kenitre    |
| J3578902 |      1501 | Presentiel | Ben Omar      | Abd Allah    | Kenitre    |
| Y1234987 |      1101 | Distanciel | Ouled thami   | Ali          | Tanger     |
| Y1234987 |      1201 | Presentiel | Ouled thami   | Ali          | Tanger     |
| Y1234987 |      1302 | Presentiel | Ouled thami   | Ali          | Tanger     |
| Y1234987 |      1401 | Distanciel | Ouled thami   | Ali          | Tanger     |
| Y1234987 |      1501 | Presentiel | Ouled thami   | Ali          | Tanger     |
+----------+-----------+------------+---------------+--------------+------------+
31 rows in set (0.00 sec)

mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) group  by etudiant.cin from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) group  by etudiant, from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) group  by etudiant from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'centreformation.etudiant.CIN'; this is incompatible with sql_mode=only_full_group_by
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) group by cin(*) from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,count(*) group by cin from inscription join etudiant where inscription.cin=etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant where inscription.cin=etudiant.cin' at line 1
mysql> select etudiant.CIN,idsession,typecours,nom,prenom,ville,
    -> count(*) group by cin
    -> from inscription join etudiant
    -> where inscription.cin = etudiant.cin;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription join etudiant
where inscription.cin = etudiant.cin' at line 3
mysql> select idsession, typecours,  count(*) group by typecours from inscription;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription' at line 1
mysql> select idsession ,count(*) as nbre from inscription group by typecours;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'centreformation.inscription.IdSession' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select idsession ,count(*) as nbre from inscription group by cin;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'centreformation.inscription.IdSession' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select cin ,count(cin)>3 from inscription group by cin;
+----------+--------------+
| cin      | count(cin)>3 |
+----------+--------------+
| AB234567 |            1 |
| C0987265 |            1 |
| D2356903 |            1 |
| F9827363 |            0 |
| G5346789 |            1 |
| J3578902 |            1 |
| Y1234987 |            1 |
+----------+--------------+
7 rows in set (0.00 sec)

mysql> select cin ,count(*)from inscription group by cin;
+----------+----------+
| cin      | count(*) |
+----------+----------+
| AB234567 |        4 |
| C0987265 |        5 |
| D2356903 |        5 |
| F9827363 |        3 |
| G5346789 |        5 |
| J3578902 |        4 |
| Y1234987 |        5 |
+----------+----------+
7 rows in set (0.00 sec)

mysql> select typecours ,count(*)from inscription group by typecours;
+------------+----------+
| typecours  | count(*) |
+------------+----------+
| Distanciel |       17 |
| Presentiel |       14 |
+------------+----------+
2 rows in set (0.06 sec)

mysql> select idsession ,count(*)from inscription group by cin;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'centreformation.inscription.IdSession' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select idsession,typecours, count(*)from inscription group by typecours;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'centreformation.inscription.IdSession' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select * from inscription;
+----------+-----------+------------+
| CIN      | IdSession | TypeCours  |
+----------+-----------+------------+
| AB234567 |      1101 | Distanciel |
| AB234567 |      1201 | Presentiel |
| AB234567 |      1302 | Presentiel |
| AB234567 |      1501 | Distanciel |
| G5346789 |      1101 | Distanciel |
| G5346789 |      1201 | Distanciel |
| G5346789 |      1302 | Distanciel |
| G5346789 |      1401 | Distanciel |
| G5346789 |      1501 | Distanciel |
| C0987265 |      1101 | Distanciel |
| C0987265 |      1201 | Presentiel |
| C0987265 |      1302 | Presentiel |
| C0987265 |      1401 | Distanciel |
| C0987265 |      1501 | Distanciel |
| D2356903 |      1101 | Distanciel |
| D2356903 |      1201 | Presentiel |
| D2356903 |      1302 | Presentiel |
| D2356903 |      1401 | Distanciel |
| D2356903 |      1501 | Presentiel |
| Y1234987 |      1101 | Distanciel |
| Y1234987 |      1201 | Presentiel |
| Y1234987 |      1302 | Presentiel |
| Y1234987 |      1401 | Distanciel |
| Y1234987 |      1501 | Presentiel |
| J3578902 |      1101 | Distanciel |
| J3578902 |      1201 | Presentiel |
| J3578902 |      1401 | Presentiel |
| J3578902 |      1501 | Presentiel |
| F9827363 |      1101 | Distanciel |
| F9827363 |      1401 | Distanciel |
| F9827363 |      1501 | Presentiel |
+----------+-----------+------------+
31 rows in set (0.00 sec)

mysql> select  * from formation;
+---------------+------------------------+-------+------+
| CodeFormation | titre                  | Duree | prix |
+---------------+------------------------+-------+------+
|            11 | programming java       |    12 | 3600 |
|            12 | web devloppement       |    14 | 4200 |
|            13 | anglais technique      |    15 | 3750 |
|            14 | Communication          |    10 | 2500 |
|            15 | Base de donnees Oracle |    20 | 6000 |
|            16 | soft skills            |    12 | 3000 |
+---------------+------------------------+-------+------+
6 rows in set (0.07 sec)

mysql> select  *from session;
+-------------+-------------+------------+------------+----------+
| CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+-------------+-------------+------------+------------+----------+
|        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
|        1102 | session1102 | 2022-02-03 | 2022-03-15 |       11 |
|        1104 | session1104 | 2022-10-15 | 2022-10-27 |       11 |
|        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
|        1202 | session1202 | 2022-04-05 | 2022-04-19 |       12 |
|        1203 | session1203 | 2022-11-16 | 2022-11-30 |       12 |
|        1204 | session1204 | 2022-12-17 | 2022-12-31 |       12 |
|        1301 | session1301 | 2022-01-06 | 2022-01-21 |       13 |
|        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
|        1303 | session1303 | 2022-06-08 | 2022-06-23 |       13 |
|        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
|        1402 | session1402 | 2022-08-08 | 2022-08-18 |       14 |
|        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
|        1502 | session1502 | 2022-09-12 | 2022-10-02 |       15 |
|        1601 | session1601 | 2022-09-13 | 2022-09-25 |       16 |
|        1602 | session1602 | 2022-10-14 | 2022-10-26 |       16 |
+-------------+-------------+------------+------------+----------+
16 rows in set (0.06 sec)

mysql> desc formation;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| CodeFormation | int         | NO   | PRI | NULL    |       |
| titre         | varchar(45) | YES  |     | NULL    |       |
| Duree         | int         | YES  |     | NULL    |       |
| prix          | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.19 sec)

mysql> select titre,  nomsess , datedebut, datefin from formation join session where formation.codeformation=session.codeform  && datedebut >'2022-03-15';
+------------------------+-------------+------------+------------+
| titre                  | nomsess     | datedebut  | datefin    |
+------------------------+-------------+------------+------------+
| programming java       | session1104 | 2022-10-15 | 2022-10-27 |
| web devloppement       | session1202 | 2022-04-05 | 2022-04-19 |
| web devloppement       | session1203 | 2022-11-16 | 2022-11-30 |
| web devloppement       | session1204 | 2022-12-17 | 2022-12-31 |
| anglais technique      | session1302 | 2022-05-07 | 2022-05-22 |
| anglais technique      | session1303 | 2022-06-08 | 2022-06-23 |
| Communication          | session1401 | 2022-09-01 | 2022-09-11 |
| Communication          | session1402 | 2022-08-08 | 2022-08-18 |
| Base de donnees Oracle | session1501 | 2022-11-11 | 2022-12-01 |
| Base de donnees Oracle | session1502 | 2022-09-12 | 2022-10-02 |
| soft skills            | session1601 | 2022-09-13 | 2022-09-25 |
| soft skills            | session1602 | 2022-10-14 | 2022-10-26 |
+------------------------+-------------+------------+------------+
12 rows in set, 1 warning (0.09 sec)

mysql> select titre,  nomsess , datedebut, datefin from formation join session where formation.codeformation=session.codeform  && datedebut >'2022-03-15' order by(datedebut) asc;
+------------------------+-------------+------------+------------+
| titre                  | nomsess     | datedebut  | datefin    |
+------------------------+-------------+------------+------------+
| web devloppement       | session1202 | 2022-04-05 | 2022-04-19 |
| anglais technique      | session1302 | 2022-05-07 | 2022-05-22 |
| anglais technique      | session1303 | 2022-06-08 | 2022-06-23 |
| Communication          | session1402 | 2022-08-08 | 2022-08-18 |
| Communication          | session1401 | 2022-09-01 | 2022-09-11 |
| Base de donnees Oracle | session1502 | 2022-09-12 | 2022-10-02 |
| soft skills            | session1601 | 2022-09-13 | 2022-09-25 |
| soft skills            | session1602 | 2022-10-14 | 2022-10-26 |
| programming java       | session1104 | 2022-10-15 | 2022-10-27 |
| Base de donnees Oracle | session1501 | 2022-11-11 | 2022-12-01 |
| web devloppement       | session1203 | 2022-11-16 | 2022-11-30 |
| web devloppement       | session1204 | 2022-12-17 | 2022-12-31 |
+------------------------+-------------+------------+------------+
12 rows in set, 1 warning (0.03 sec)

mysql> desc formation;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| CodeFormation | int         | NO   | PRI | NULL    |       |
| titre         | varchar(45) | YES  |     | NULL    |       |
| Duree         | int         | YES  |     | NULL    |       |
| prix          | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.06 sec)

mysql> desc inscription;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| CIN       | varchar(45) | YES  | MUL | NULL    |       |
| IdSession | int         | YES  | MUL | NULL    |       |
| TypeCours | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.16 sec)

mysql> select cin,titre,  nomsess , datedebut, datefin from formation join session where formation.codeformation=session.codeform;
ERROR 1054 (42S22): Unknown column 'cin' in 'field list'
mysql> select cin,titre,  nomsess , datedebut, datefin from formation join session where formation.codeformation=session.codeform;
ERROR 1054 (42S22): Unknown column 'cin' in 'field list'
mysql> select * from inscription join session where inscription.idsession=session.codesession;
+----------+-----------+------------+-------------+-------------+------------+------------+----------+
| CIN      | IdSession | TypeCours  | CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+----------+-----------+------------+-------------+-------------+------------+------------+----------+
| AB234567 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| G5346789 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| C0987265 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| D2356903 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| Y1234987 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| J3578902 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| F9827363 |      1101 | Distanciel |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| AB234567 |      1201 | Presentiel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| G5346789 |      1201 | Distanciel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| C0987265 |      1201 | Presentiel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| D2356903 |      1201 | Presentiel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| Y1234987 |      1201 | Presentiel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| J3578902 |      1201 | Presentiel |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| AB234567 |      1302 | Presentiel |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| G5346789 |      1302 | Distanciel |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| C0987265 |      1302 | Presentiel |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| D2356903 |      1302 | Presentiel |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| Y1234987 |      1302 | Presentiel |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| G5346789 |      1401 | Distanciel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| C0987265 |      1401 | Distanciel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| D2356903 |      1401 | Distanciel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| Y1234987 |      1401 | Distanciel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| J3578902 |      1401 | Presentiel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| F9827363 |      1401 | Distanciel |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| AB234567 |      1501 | Distanciel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| G5346789 |      1501 | Distanciel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| C0987265 |      1501 | Distanciel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| D2356903 |      1501 | Presentiel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| Y1234987 |      1501 | Presentiel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| J3578902 |      1501 | Presentiel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| F9827363 |      1501 | Presentiel |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
+----------+-----------+------------+-------------+-------------+------------+------------+----------+
31 rows in set (0.04 sec)

mysql> select * from inscription
    -> inner join etudiant where inscription.cin=etudiant.cin
    -> ineer  join session where inscription.idsession=session.codesession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ineer  join session where inscription.idsession=session.codesession' at line 3
mysql> select * from inscription
    -> inner join etudiant on inscription.cin=etudiant.cin
    -> ineer  join session on inscription.idsession=session.codesession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ineer  join session on inscription.idsession=session.codesession' at line 3
mysql> select * from inscription
    -> inner join etudiant on inscription.cin=etudiant.cin
    -> ineer join session on inscription.idsession=session.codesession;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ineer join session on inscription.idsession=session.codesession' at line 3
mysql> select * from inscription
    -> inner join etudiant on inscription.cin=etudiant.cin
    -> inner join session on inscription.idsession=session.codesession;
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+-------------+-------------+------------+------------+----------+
| CIN      | IdSession | TypeCours  | CIN      | Nom           | Prenom       | DateNaissance | Adresse                               | ville      | NiveauScolaire | CodeSession | NomSess     | DateDebut  | DateFin    | CodeForm |
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+-------------+-------------+------------+------------+----------+
| AB234567 |      1101 | Distanciel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| AB234567 |      1201 | Presentiel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| AB234567 |      1302 | Presentiel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| AB234567 |      1501 | Distanciel | AB234567 | Alami         | Ahmed        | 1986-01-01    | Rue du port,13                        | Tanger     | bac            |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| C0987265 |      1101 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| C0987265 |      1201 | Presentiel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| C0987265 |      1302 | Presentiel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| C0987265 |      1401 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| C0987265 |      1501 | Distanciel | C0987265 | Souni         | Sanaa        | 1998-04-30    | Place du peuple n 2                   | Tanger     | Niveau bac     |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| D2356903 |      1101 | Distanciel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| D2356903 |      1201 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| D2356903 |      1302 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| D2356903 |      1401 | Distanciel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| D2356903 |      1501 | Presentiel | D2356903 | Idrissi Alami | Mohammed     | 1996-01-02    | Lotissement najah,rue n 12 immeuble 3 | Rabat      | Bac+4          |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| F9827363 |      1101 | Distanciel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| F9827363 |      1401 | Distanciel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| F9827363 |      1501 | Presentiel | F9827363 | Boudiaf       | Fatima zohra | 1997-01-10    | Immeuble iftikhar,  n 13 ettakaddoum  | Rabat      | Bac+2          |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| G5346789 |      1101 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| G5346789 |      1201 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| G5346789 |      1302 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| G5346789 |      1401 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| G5346789 |      1501 | Distanciel | G5346789 | Toumi         | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                 | Casablanca | Bac+5          |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| J3578902 |      1101 | Distanciel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| J3578902 |      1201 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| J3578902 |      1401 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| J3578902 |      1501 | Presentiel | J3578902 | Ben Omar      | Abd Allah    | 1990-06-04    | Villa Amina n12 bir rami              | Kenitre    | Doctorat       |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
| Y1234987 |      1101 | Distanciel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |        1101 | session1101 | 2022-01-02 | 2022-01-14 |       11 |
| Y1234987 |      1201 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |        1201 | session1201 | 2022-03-04 | 2022-03-18 |       12 |
| Y1234987 |      1302 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |        1302 | session1302 | 2022-05-07 | 2022-05-22 |       13 |
| Y1234987 |      1401 | Distanciel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |        1401 | session1401 | 2022-09-01 | 2022-09-11 |       14 |
| Y1234987 |      1501 | Presentiel | Y1234987 | Ouled thami   | Ali          | 1979-04-12    | La ville haute, rue chouhada n 6      | Tanger     | Bac+4          |        1501 | session1501 | 2022-11-11 | 2022-12-01 |       15 |
+----------+-----------+------------+----------+---------------+--------------+---------------+---------------------------------------+------------+----------------+-------------+-------------+------------+------------+----------+
31 rows in set (0.07 sec)

mysql> select inscription.cin , nom , prenom, codesession, nomsession,codeform from inscription
    -> inner join etudiant on inscription.cin=etudiant.cin
    -> inner join session on inscription.idsession=session.codesession;
ERROR 1054 (42S22): Unknown column 'nomsession' in 'field list'
mysql> select inscription.cin , nom , prenom, codesession, nomsess,codeform from inscription
    -> inner join etudiant on inscription.cin=etudiant.cin
    -> inner join session on inscription.idsession=session.codesession;
+----------+---------------+--------------+-------------+-------------+----------+
| cin      | nom           | prenom       | codesession | nomsess     | codeform |
+----------+---------------+--------------+-------------+-------------+----------+
| AB234567 | Alami         | Ahmed        |        1101 | session1101 |       11 |
| AB234567 | Alami         | Ahmed        |        1201 | session1201 |       12 |
| AB234567 | Alami         | Ahmed        |        1302 | session1302 |       13 |
| AB234567 | Alami         | Ahmed        |        1501 | session1501 |       15 |
| C0987265 | Souni         | Sanaa        |        1101 | session1101 |       11 |
| C0987265 | Souni         | Sanaa        |        1201 | session1201 |       12 |
| C0987265 | Souni         | Sanaa        |        1302 | session1302 |       13 |
| C0987265 | Souni         | Sanaa        |        1401 | session1401 |       14 |
| C0987265 | Souni         | Sanaa        |        1501 | session1501 |       15 |
| D2356903 | Idrissi Alami | Mohammed     |        1101 | session1101 |       11 |
| D2356903 | Idrissi Alami | Mohammed     |        1201 | session1201 |       12 |
| D2356903 | Idrissi Alami | Mohammed     |        1302 | session1302 |       13 |
| D2356903 | Idrissi Alami | Mohammed     |        1401 | session1401 |       14 |
| D2356903 | Idrissi Alami | Mohammed     |        1501 | session1501 |       15 |
| F9827363 | Boudiaf       | Fatima zohra |        1101 | session1101 |       11 |
| F9827363 | Boudiaf       | Fatima zohra |        1401 | session1401 |       14 |
| F9827363 | Boudiaf       | Fatima zohra |        1501 | session1501 |       15 |
| G5346789 | Toumi         | Aicha        |        1101 | session1101 |       11 |
| G5346789 | Toumi         | Aicha        |        1201 | session1201 |       12 |
| G5346789 | Toumi         | Aicha        |        1302 | session1302 |       13 |
| G5346789 | Toumi         | Aicha        |        1401 | session1401 |       14 |
| G5346789 | Toumi         | Aicha        |        1501 | session1501 |       15 |
| J3578902 | Ben Omar      | Abd Allah    |        1101 | session1101 |       11 |
| J3578902 | Ben Omar      | Abd Allah    |        1201 | session1201 |       12 |
| J3578902 | Ben Omar      | Abd Allah    |        1401 | session1401 |       14 |
| J3578902 | Ben Omar      | Abd Allah    |        1501 | session1501 |       15 |
| Y1234987 | Ouled thami   | Ali          |        1101 | session1101 |       11 |
| Y1234987 | Ouled thami   | Ali          |        1201 | session1201 |       12 |
| Y1234987 | Ouled thami   | Ali          |        1302 | session1302 |       13 |
| Y1234987 | Ouled thami   | Ali          |        1401 | session1401 |       14 |
| Y1234987 | Ouled thami   | Ali          |        1501 | session1501 |       15 |
+----------+---------------+--------------+-------------+-------------+----------+
31 rows in set (0.00 sec)
