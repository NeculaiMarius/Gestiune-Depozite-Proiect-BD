CREATE TABLE furnizori(
    id_furnizor NUMBER(4) CONSTRAINT pk_furnizori PRIMARY KEY,
    denumire_furnizor VARCHAR2(40),
    adresa_email VARCHAR2(10)
);

ALTER TABLE furnizori
MODIFY adresa_email VARCHAR2(40);

ALTER TABLE furnizori
MODIFY id_furnizor NUMBER(3);

CREATE TABLE locatii_pr(
    id_locatie NUMBER(3) CONSTRAINT pk_locatii_pr PRIMARY KEY,
    adresa VARCHAR2(40),
    cod_postal VARCHAR2(12),
    oras varchar2(30),
    judet varchar2(30)
);

ALTER TABLE locatii_pr 
MODIFY cod_postal VARCHAR2(6);

CREATE TABLE depozite(
    id_depozit number(4) CONSTRAINT pk_depozite PRIMARY KEY,
    id_furnizor NUMBER(3),
    id_locatie NUMBER(3),
    denumire_depozit VARCHAR2(50),
    nume_responsabil VARCHAR2(20),
    prenume_responsabil VARCHAR2(20),
    CONSTRAINT fk_depozite_f FOREIGN KEY(id_furnizor) REFERENCES furnizori(id_furnizor),
    CONSTRAINT fk_depozite_l FOREIGN KEY(id_locatie) REFERENCES locatii_pr(id_locatie)
);

ALTER TABLE depozite
MODIFY denumire_depozit VARCHAR2(50) NOT NULL;

CREATE TABLE produse_pr(
    id_produs NUMBER(6) CONSTRAINT pk_produse_pr PRIMARY KEY,
    denumire_produs VARCHAR2(50),
    categorie_produs VARCHAR2(40),
    descriere_produs VARCHAR2(1000)
);

ALTER TABLE produse_pr
DROP COLUMN descriere_produs;

CREATE TABLE stocuri(
    id_stoc NUMBER(5) CONSTRAINT pk_stocuri PRIMARY KEY,
    id_depozit NUMBER(4),
    id_produs NUMBER(6),
    pret NUMBER(8,2),
    cantitate NUMBER(8),
    data_intrare_stoc DATE,
    CONSTRAINT fk_stocuri_d FOREIGN KEY(id_depozit) REFERENCES depozite(id_depozit),
    CONSTRAINT fk_stocuri_p FOREIGN KEY(id_produs) REFERENCES produse_pr(id_produs));


--POPULARE TABELE

--Tabela ‘Furnizori’:
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (100, 'ProFurnizor', 'contact@profurnizor.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (101, 'Global Suppliers', 'info@globalsuppliers.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (102, 'Sunrise Traders', 'sales@sunrisetraders.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (103, 'Alpha Merchandise', 'support@alphamerchandise.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (104, 'Market Connect', 'info@marketconnect.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (105, 'Trade Masters', 'customerservice@trademasters.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (106, 'Tech Solutions Co.', 'contact@techsolutionsco.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (107, 'Aqua Products Inc.', 'hello@aquaproductsinc.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (108, 'Furniture World', 'sales@furnitureworld.com');
INSERT INTO furnizori (id_furnizor, denumire_furnizor, adresa_email) VALUES (109, 'Supply Hub', 'orders@supplyhub.com');





--Tabela ‘Locatii_pr’:
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (1, 'Strada Victoriei, Nr. 10', '100100', 'Bucuresti', 'Bucuresti');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (2, 'Bulevardul Republicii, Nr. 25', '200200', 'Cluj-Napoca', 'Cluj');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (3, 'Strada Unirii, Nr. 15', '300300', 'Iasi', 'Iasi');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (4, 'Bulevardul Timisoara, Nr. 30', '400400', 'Timisoara', 'Timis');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (5, 'Aleea Parcului, Nr. 5', '500500', 'Brasov', 'Brasov');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (6, 'Strada Libertatii, Nr. 12', '600600', 'Constanta', 'Constanta');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (7, 'Bulevardul Revolutiei, Nr. 7', '700700', 'Oradea', 'Bihor');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (8, 'Strada Independentei, Nr. 22', '800800', 'Sibiu', 'Sibiu');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (9, 'Aleea Crangului, Nr. 9', '900900', 'Ploiesti', 'Prahova');
INSERT INTO locatii_pr (id_locatie, adresa, cod_postal, oras, judet) VALUES (10, 'Bulevardul Nicolae Balcescu, Nr. 18', '101010', 'Craiova', 'Dolj');

--Tabela ‘Depozite:
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1001, 100, 1, 'Depozit Central', 'Neculai', 'Marius-Adrian');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1002, 101, 2, 'Depozit Aurora', 'Ionescu', 'Mihai');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1003, 102, 3, 'Depozit Meridian', 'Radulescu', 'Elena');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1004, 103, 4, 'Depozit Vesticon', 'Georgescu', 'Andrei');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1005, 104, 5, 'Depozit Estwave', 'Constantinescu', 'Maria');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1006, 105, 6, 'Depozit Marex', 'Dumitrescu', 'Cristian');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1007, 106, 7, 'Depozit Microlog', 'Stoica', 'Laura');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1008, 107, 8, 'Depozit NeoNova', 'Florescu', 'Alex');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1009, 108, 9, 'Depozit RetroHome', 'Popa', 'Gabriela');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1010, 109, 10, 'Depozit Nexus', 'Neagu', 'Ion');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1011, 100, 1, 'Depozit GreenEdge', 'Marinescu', 'Andreea');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1012, 101, 2, 'Depozit FastTrack', 'Gheorghiu', 'Diana');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1013, 102, 3, 'Depozit Zenith', 'Mihai', 'Alexandru');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1014, 103, 4, 'Depozit Terra', 'Dragomir', 'Ana');
INSERT INTO depozite (id_depozit, id_furnizor, id_locatie, denumire_depozit, nume_responsabil, prenume_responsabil) VALUES (1015, 104, 5, 'Depozit Skyline', 'Vasilescu', 'Daniel');

--Tabela ‘Produse’:
INSERT ALL
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (1, 'Cafetier? automat?', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (2, 'Boxe Bluetooth', 'Electronice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (3, 'Fier de c?lcat cu aburi', 'Electrocasnice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (4, 'Aparat de ras electric', 'Ingrijire personala')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (5, 'Ceas inteligent', 'Electronice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (6, 'Set de unelte pentru gr?din?rit', 'Gradin?rit')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (7, 'Aparat de aer condi?ionat', 'Electrocasnice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (8, 'Set de cutite pentru bucatarie', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (9, 'Ma?in? de tuns iarba', 'Gradin?rit')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (10, 'Boxe stereo pentru PC', 'Electronice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (11, 'Robot de buc?t?rie multifunc?ional', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (12, 'Consol? de jocuri', 'Electronice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (13, 'Aparat de cafea espresso', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (14, 'Hus? pentru laptop', 'Accesorii')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (15, 'Lamp? de birou LED', 'Iluminat')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (16, 'Prelungitor cu multiple prize', 'Accesorii')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (17, 'Aspirator portabil', 'Electrocasnice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (18, 'Aparat de vidat alimente', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (19, 'Smartphone performant', 'Telefoane')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (20, 'Ma?in? de sp?lat rufe', 'Electrocasnice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (21, 'Set de prosoape premium', 'Textile')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (22, 'Tocator electric pentru buc?t?rie', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (23, 'Aparat de g?tit cu abur', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (24, 'Trotinet? electric? pliabil?', 'Sport ?i timp liber')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (25, 'Aparat de purificat aerul', 'Electrocasnice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (26, 'Cafetier? french press', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (27, 'Mouse wireless ergonomic', 'Accesorii')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (28, 'Smartwatch sport', 'Accesorii')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (29, 'Set de c?ni termoizolante', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (30, 'Mixer vertical pentru buc?t?rie', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (31, 'Aparat de g?tit cu presiune', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (32, 'C??ti audio wireless', 'Electronice')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (33, 'Filtru de cafea permanent', 'Buc?t?rie')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (34, 'Aparat de înc?lzit cear? pentru epilat', 'Ingrijire personala')
    INTO produse_pr (id_produs, denumire_produs, categorie_produs)
    VALUES (35, 'Smart TV 4K', 'Electronice')
SELECT * FROM DUAL;

--Tabela ‘Stocuri’:
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (1, 1001, 1, 120.50, 25, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (2, 1002, 2, 199.99, 15, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (3, 1003, 3, 85.00, 30, TO_DATE('2023-03-10', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (4, 1004, 4, 45.80, 20, TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (5, 1005, 5, 299.00, 12, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (6, 1006, 6, 129.90, 18, TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (7, 1007, 7, 599.99, 5, TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (8, 1008, 8, 79.00, 28, TO_DATE('2021-08-05', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (9, 1009, 9, 249.50, 10, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (10, 1010, 10, 79.99, 22, TO_DATE('2021-10-20', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (11, 1011, 11, 49.00, 17, TO_DATE('2023-11-25', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (12, 1012, 12, 399.00, 8, TO_DATE('2022-12-05', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (13, 1013, 13, 139.80, 14, TO_DATE('2022-03-10', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (14, 1014, 14, 29.99, 32, TO_DATE('2022-02-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (15, 1015, 15, 69.50, 19, TO_DATE('2023-06-10', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (16, 1001, 16, 39.00, 40, TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (17, 1002, 17, 129.99, 18, TO_DATE('2022-08-20', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (18, 1003, 18, 149.00, 25, TO_DATE('2023-09-25', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (19, 1004, 19, 19.80, 50, TO_DATE('2021-10-30', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (20, 1005, 20, 899.00, 7, TO_DATE('2022-11-04', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (21, 1006, 21, 59.90, 28, TO_DATE('2019-12-10', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (22, 1007, 22, 199.99, 15, TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (23, 1008, 23, 29.00, 33, TO_DATE('2020-02-20', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (24, 1009, 24, 249.50, 11, TO_DATE('2021-03-25', 'YYYY-MM-DD'));
INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc) VALUES (25, 1010, 25, 499.99, 6, TO_DATE('2022-04-30', 'YYYY-MM-DD'));

UPDATE depozite 
SET prenume_responsabil='Marius Adrian'
WHERE id_depozit=1001;



--INTEROGARI


--1.	S? se selecteze toate stocurile care au data de intrare în anul 2019.
SELECT * FROM stocuri
WHERE EXTRACT(YEAR FROM data_intrare_stoc) = 2022;  

--2.	S? se selecteze id-ul si denumirea depozitelor care se afl? in jude?ul Cluj.
SELECT d.id_depozit,d.denumire_depozit FROM depozite d,locatii_pr l
WHERE d.id_locatie=l.id_locatie
AND UPPER(l.judet) like 'CLUJ';
 

--3.	S? se afiseze id-ul si denumirea produselor care se afl? în depozitul cu denumirea “Depozit Nexus”.
SELECT p.id_produs, p.denumire_produs FROM produse_pr p, stocuri s, depozite d
WHERE p.id_produs=s.id_produs
AND d.id_depozit=s.id_depozit
AND UPPER(d.denumire_depozit) LIKE 'DEPOZIT NEXUS';
 

--4.	S? se afi?eze num?rul total de tipuri de produse pentru fiecare categorie de produs
SELECT categorie_produs, COUNT(*) AS nr_tipuri_produse
FROM produse_pr
GROUP BY categorie_produs;
 

--5.	S? se calculeze valoarea total? a produselor aflate în fiecare depozit.
SELECT d.id_depozit,d.denumire_depozit,sum(s.pret*s.cantitate) Valoare_TOTALA from produse_pr p,stocuri s,depozite d
WHERE p.id_produs=s.id_produs
AND d.id_depozit=s.id_depozit
GROUP BY d.id_depozit,d.denumire_depozit;
		 

--6.	S? se calculeze valoarea totala a produselor aflate în depozite, grupate în func?ie de ora?ul din care fac parte.
SELECT l.oras, sum(s.pret*s.cantitate) Valoare_totala
FROM locatii_pr l, depozite d, stocuri s, produse_pr p
WHERE p.id_produs=s.id_produs
AND d.id_depozit=s.id_depozit
AND l.id_locatie=d.id_locatie
GROUP BY l.oras;
 

--7.	S? se selecteze denumirea, numele si prenumele responsabilului depozitelor  care au valoarea totala a stocurilor de produse mai mare de 4500 de lei.
SELECT d.id_depozit,d.denumire_depozit,d.nume_responsabil ,sum(s.pret*s.cantitate) Valoare_Toatala 
FROM produse_pr p,stocuri s,depozite d
WHERE p.id_produs=s.id_produs
AND d.id_depozit=s.id_depozit
GROUP BY d.id_depozit, d.denumire_depozit, d.nume_responsabil
HAVING sum(s.pret*s.cantitate)>4500;
 

--8.	S? se selecteze id-ul ?i denumire fiecarui produs care nu se afl? în nici unul din stocurile depozitelor.
SELECT p.id_produs,p.denumire_produs
FROM produse_pr p,stocuri s
WHERE p.id_produs=s.id_produs(+)
AND id_stoc is null;
 

--9.	S? se modifice pre?ul produselor care sunt în stoc din anul 2020 astfel încât acesta s? scad? cu 10%.
UPDATE stocuri
SET pret = pret * 0.9 
WHERE EXTRACT(YEAR FROM data_intrare_stoc) = 2020;



--10.	S? se modifice cantitate produselor care sunt în stoc ?i fac parte din categoria produselor de ‘GRADIN?RIT’ astfel încât aceasta s? scad? cu 5 unit??i.
UPDATE stocuri
SET cantitate=cantitate-5
WHERE stocuri.id_produs in (
SELECT id_produs FROM produse_pr WHERE UPPER(categorie_produs) like 'GRADIN?RIT');


--11.	S? se selecteze toate produsele din depozitul care are denumirea ‘Zenith’ ?i a c?ror dat? de intrare în stoc este in luna martie. 
SELECT p.id_produs,p.denumire_produs,s.data_intrare_stoc 
FROM stocuri s,produse_pr p,depozite d
WHERE p.id_produs=s.id_produs
AND d.id_depozit=s.id_depozit
AND TO_CHAR (data_intrare_stoc) LIKE '%MAR%'
AND LOWER(d.denumire_depozit) LIKE '%zenith%' ;
 
--12.	S? se selecteze toate stocurile care se afla in depozite de mai putin de 200 de zile si denumirea depozitului din care face parte fiecare.
SELECT s.id_stoc,d.denumire_depozit,TRUNC(sysdate - data_intrare_stoc)  zile_stoc_in_depozit
FROM stocuri s,depozite d
WHERE d.id_depozit=s.id_depozit
AND sysdate - data_intrare_stoc < 200;
 

--13.	S? se selecteze toti furnizorii  a caror adresa de email incepe cu ‘info’.
SELECT * FROM furnizori 
WHERE LOWER( SUBSTR (adresa_email, 0, 4)) ='info';
 

--14.	S? se determine diferit disponibilitatea fiec?rui produs prezet în toate depozitele în func?ie de cantitatea totala disponibila din acel produs astfel:
--  a.	Când cantitatea este mai mica de 20 de buc??i atunci disponibilitatea este ‘Stoc limitat’
--  b.	Când cantitatea este cuprins? între 20 ?i 35 de buc??i atunci disponibilitatea este ‘Stoc moderat’
--  c.	Când cantitatea este mai mare de 35 de buc??i atunci disponibilitatea este ‘Stoc suficient’
--  S? se afiseze inregistrarile in ordine cresc?toare a cantit??ii totale.

SELECT p.id_produs,p.denumire_produs,sum(s.cantitate),
CASE
    WHEN SUM(s.cantitate)<20 THEN 'Stoc limitat'
    WHEN SUM(s.cantitate) BETWEEN 20 AND 35 THEN 'Stoc moderat'
    WHEN SUM(s.cantitate)>35 THEN 'Stoc suficient'
END disponibilitate
FROM produse_pr p,stocuri s
WHERE p.id_produs=s.id_produs
GROUP BY p.id_produs,p.denumire_produs
ORDER BY SUM(s.cantitate);
 
--15.	S? se selecteze id-ul produsului, denumirea produsului ?i id-ul stocului din care face parte pentru toate produsele, chiar ?i cele care nu se afla în nici un stoc. Pentru produsele care nu se afla în nici un stoc, valoare NULL din coloana ‘id_stoc’ s? se înlocuiasc? cu cifra 0.
SELECT p.id_produs,p.denumire_produs,NVL(s.id_stoc,0)
FROM produse_pr p,stocuri s
WHERE p.id_produs=s.id_produs(+);
 

--16.	S? se afi?eze atât depozitele care au în stoc produse din categoria ‘GRADIN?RIT’ cât ?i depozitele care au în stoc produse din categoria ‘ACCESORII’.
SELECT d.* FROM depozite d,stocuri s, produse_pr p
WHERE d.id_depozit=s.id_depozit
AND s.id_produs=p.id_produs
AND UPPER(p.categorie_produs) LIKE 'ACCESORII'
UNION
SELECT d.* FROM depozite d,stocuri s, produse_pr p
WHERE d.id_depozit=s.id_depozit
AND s.id_produs=p.id_produs
AND UPPER(p.categorie_produs) LIKE 'GRADIN?RIT'; 
 

--17.	Sa se creeze o tabel? vitrual? care sa con?in? id-ul ?i denumire depozitelor, denumirea furnizorilor fiec?rui depozit, ora?ul, adresa ?i codul po?tal aferent fiec?rui depozit. Înregistr?rile s? se ordoneze dup? id-ul depozitelor.
CREATE VIEW gestiune_depozite AS 
SELECT d.id_depozit ,d.denumire_depozit,f.denumire_furnizor,l.oras,l.adresa,l.cod_postal
FROM depozite d,locatii_pr l,furnizori f
WHERE d.id_locatie=l.id_locatie
AND d.id_furnizor=f.id_furnizor
ORDER BY d.id_depozit;

SELECT * FROM gestiune_depozite;
 

--18.	S? se afi?eze toate produsele ?i cantit??ile disponibile în depozite mai pu?in cele care fac parte din categoria ‘Buc?t?rie’, ‘Gradin?rit’ ?i ’Accesorii’.
SELECT p.id_produs,p.denumire_produs,sum(s.cantitate)
FROM produse_pr p,stocuri s
WHERE p.id_produs=s.id_produs
GROUP BY p.id_produs,p.denumire_produs
MINUS
SELECT p.id_produs,p.denumire_produs,sum(s.cantitate)
FROM produse_pr p,stocuri s
WHERE p.id_produs=s.id_produs
AND (UPPER(p.categorie_produs)='BUC?T?RIE' or UPPER(p.categorie_produs)='GRADIN?RIT' or UPPER(p.categorie_produs)='ACCESORII')
GROUP BY p.id_produs,p.denumire_produs;
 

--19.	S? se introduc? un nou produs în tabela produse_pr cu id=99, denumire=’Periuta de dinti’, categorie=’Ingrijire personala’.
S? se creeze un nou stoc în tabela stocuri cu id=99, pentru depozitul cu id=1001 care s? con?in? 10 buc??i din produsul cu id=99 la pre?ul de 25 lei ?i data de intrare în stoc s? fie data curent? a sistemului.

INSERT INTO produse_pr (id_produs, denumire_produs, categorie_produs)
VALUES (99, 'Periuta de dinti', 'Ingrijire personala');

 

INSERT INTO stocuri (id_stoc, id_depozit, id_produs, pret, cantitate, data_intrare_stoc)
VALUES (99, 1001, 99, 25, 10, SYSDATE);
 

--20.	S? se selecteze id-ul produselor care au fost furnizate de furnizorul cu id_furnizor=100, denumire_produs ?i id-ul depozitului din care face parte.
SELECT DISTINCT p.id_produs,p.denumire_produs,d.id_depozit 
FROM produse_pr p,furnizori f,depozite d,stocuri s
WHERE f.id_furnizor=d.id_furnizor
AND d.id_depozit=s.id_depozit
AND s.id_produs=p.id_produs
AND f.id_furnizor=100;
 

--21.	S? se selecteze loca?iile în care depozitele au mai mult de 40 de bucati de produse. Înregistr?rile s? se afiseze în ordine cresc?toare dupa num?rul de produse.
SELECT l.*,sum(s.cantitate) nr_buc_produse 
FROM produse_pr p,depozite d,stocuri s,locatii_pr l
WHERE l.id_locatie=d.id_locatie
AND d.id_depozit=s.id_depozit
AND p.id_produs=s.id_produs
GROUP BY l.id_locatie,l.adresa,l.cod_postal,l.oras,l.judet
HAVING sum(s.cantitate)>40
ORDER BY sum(s.cantitate);
 

--22.	S? se ?tearg? iar apoi s? se recupereze tabela ‘locatii_pr’.
DROP TABLE stocuri cascade constraints;
FLASHBACK TABLE stocuri TO BEFORE DROP;

--refacerea legaturilor dintre tabele   
ALTER TABLE stocuri
ADD CONSTRAINT fk_stocuri_d FOREIGN KEY(id_depozit) REFERENCES depozite(id_depozit);
ALTER TABLE stocuri
ADD CONSTRAINT fk_stocuri_p FOREIGN KEY(id_produs) REFERENCES produse_pr(id_produs);

--23.	S? se creeze un sinonim pentru tabela locatii_pr cu denumirea ‘locatii_depozite’.
CREATE SYNONYM locatii_depozite FOR locatii_pr;
SELECT * FROM locatii_depozite; 
   
--24.	S? se creeze un raport în care s? se afiseze cate produse sunt în fiecare depozit, totalul cantitatilor de produse din fiecare depozit, si totalul pentru toate depozitele.
SELECT NVL(TO_CHAR(d.id_depozit),'Toate depozitele') Depozit,
    NVL(TO_CHAR(s.id_produs),'Total cantitate produse') Produs
    ,SUM(s.cantitate) cantitate ,LPAD(' ',5)||user as Utilizator
FROM stocuri s,depozite d
WHERE s.id_depozit=d.id_depozit
GROUP BY ROLLUP(d.id_depozit,s.id_produs)
ORDER BY d.id_depozit;
