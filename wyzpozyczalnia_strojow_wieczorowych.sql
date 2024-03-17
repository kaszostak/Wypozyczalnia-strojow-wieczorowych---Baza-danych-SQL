CREATE TABLE asortyment ( 
id_stroju INTEGER NOT NULL, 
nazwa_stroju VARCHAR2(20 CHAR) NOT NULL, 
cena_wypozyczenia NUMBER NOT NULL, 
opis VARCHAR2(200 CHAR), 
rozmiary_id_rozmiaru INTEGER NOT NULL, 
marki_id_marki INTEGER, 
kategorie_id_kategorii INTEGER 
);

ALTER TABLE asortyment ADD CONSTRAINT asortyment_pk PRIMARY KEY ( id_stroju );

CREATE TABLE dostawcy (  
id_dostawcy INTEGER NOT NULL,  
telefon VARCHAR2(14 CHAR) NOT NULL,  
adres_email VARCHAR2(20 CHAR) NOT NULL,  
nr_konta INTEGER NOT NULL,  
ulica VARCHAR2(30 CHAR) NOT NULL,  
numer_domu VARCHAR2(5 CHAR) NOT NULL,  
kody_pocztowe_kod_pocztowy VARCHAR2(8 CHAR)  
);

ALTER TABLE dostawcy ADD CONSTRAINT dostawcy_pk PRIMARY KEY ( id_dostawcy );

CREATE TABLE egzemplarze ( 
id_egzemplarz INTEGER NOT NULL, 
dostepnosc NUMBER NOT NULL, 
data_zamowienia DATE NOT NULL, 
cena_zakupu NUMBER NOT NULL, 
asortyment_id_stroju INTEGER, 
dostawcy_id_dostawcy INTEGER 
);

ALTER TABLE egzemplarze ADD CONSTRAINT egzemplarze_pk PRIMARY KEY ( id_egzemplarz );

CREATE TABLE kategorie ( 
id_kategorii INTEGER NOT NULL, 
nazwa_kategorii VARCHAR2(20 CHAR) NOT NULL 
);

ALTER TABLE kategorie ADD CONSTRAINT kategorie_pk PRIMARY KEY ( id_kategorii );

CREATE TABLE klienci (  
id_klienta INTEGER NOT NULL,  
imie VARCHAR2(20 CHAR) NOT NULL,  
nazwisko VARCHAR2(20 CHAR) NOT NULL,  
telefon VARCHAR2(14 CHAR) NOT NULL,  
adres_email VARCHAR2(30 CHAR) NOT NULL,  
ulica VARCHAR2(30 CHAR) NOT NULL,  
numer_domu VARCHAR2(5 CHAR) NOT NULL,  
kody_pocztowe_kod_pocztowy VARCHAR2(8 CHAR)  
);

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( id_klienta );

CREATE TABLE kody_pocztowe (  
kod_pocztowy VARCHAR2(8 CHAR) NOT NULL,  
miasto VARCHAR2(20 CHAR) NOT NULL  
);

ALTER TABLE kody_pocztowe ADD CONSTRAINT kody_pocztowe_pk PRIMARY KEY ( kod_pocztowy );

CREATE TABLE kolory ( 
id_koloru INTEGER NOT NULL, 
nazwa_koloru VARCHAR2(20 CHAR) NOT NULL 
);

ALTER TABLE kolory ADD CONSTRAINT kolory_pk PRIMARY KEY ( id_koloru );

CREATE TABLE kolory_stroju ( 
kolory_id_koloru INTEGER, 
asortyment_id_stroju INTEGER 
);

CREATE TABLE marki ( 
id_marki INTEGER NOT NULL, 
nazwa_marki VARCHAR2(20 CHAR) NOT NULL 
);

ALTER TABLE marki ADD CONSTRAINT marki_pk PRIMARY KEY ( id_marki );

CREATE TABLE materialy ( 
id_materialu INTEGER NOT NULL, 
nazwa_materialu VARCHAR2(20 CHAR) NOT NULL 
);

ALTER TABLE materialy ADD CONSTRAINT materialy_pk PRIMARY KEY ( id_materialu );

CREATE TABLE materialy_stroju ( 
materialy_id_materialu INTEGER NOT NULL, 
asortyment_id_stroju INTEGER NOT NULL 
);

CREATE TABLE pracownicy ( 
id_pracownika INTEGER NOT NULL, 
imie VARCHAR2(20 CHAR) NOT NULL, 
nazwisko VARCHAR2(20 CHAR) NOT NULL, 
telefon VARCHAR2(14 CHAR) NOT NULL, 
pesel INTEGER NOT NULL, 
data_zatrudnienia DATE NOT NULL, 
pensja NUMBER NOT NULL, 
zatrudniony NUMBER NOT NULL, 
ulica VARCHAR2(30 CHAR), 
numer_domu VARCHAR2(5 CHAR) NOT NULL, 
kody_pocztowe_kod_pocztowy VARCHAR2(6 CHAR) NOT NULL 
);

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pk PRIMARY KEY ( id_pracownika );

CREATE TABLE rozmiary ( 
id_rozmiaru INTEGER NOT NULL, 
rozmiar VARCHAR2(4 CHAR) 
);

ALTER TABLE rozmiary ADD CONSTRAINT rozmiary_pk PRIMARY KEY ( id_rozmiaru );

CREATE TABLE wypozyczenia ( 
id_wypozyczenia INTEGER NOT NULL, 
data_wypozyczenia DATE NOT NULL, 
liczba_dni INTEGER NOT NULL, 
data_zwrotu DATE, 
stan VARCHAR2(20 CHAR), 
oplata_nieterminowosc NUMBER, 
oplata_zniszczenie NUMBER, 
oplata_poprawki NUMBER, 
fakt_liczba_dni INTEGER, 
data_splaty DATE, 
klienci_id_klienta INTEGER, 
pracownicy_id_pracownika INTEGER, 
asortyment_id_stroju INTEGER 
);

ALTER TABLE wypozyczenia ADD CONSTRAINT wypozyczenia_pk PRIMARY KEY ( id_wypozyczenia );

ALTER TABLE asortyment 
ADD CONSTRAINT asortyment_kategorie_fk FOREIGN KEY ( kategorie_id_kategorii ) 
REFERENCES kategorie ( id_kategorii );

ALTER TABLE asortyment 
ADD CONSTRAINT asortyment_marki_fk FOREIGN KEY ( marki_id_marki ) 
REFERENCES marki ( id_marki );

ALTER TABLE asortyment 
ADD CONSTRAINT asortyment_rozmiary_fk FOREIGN KEY ( rozmiary_id_rozmiaru ) 
REFERENCES rozmiary ( id_rozmiaru );

ALTER TABLE dostawcy 
ADD CONSTRAINT dostawcy_kody_pocztowe_fk FOREIGN KEY ( kody_pocztowe_kod_pocztowy ) 
REFERENCES kody_pocztowe ( kod_pocztowy );

ALTER TABLE egzemplarze 
ADD CONSTRAINT egzemplarze_asortyment_fk FOREIGN KEY ( asortyment_id_stroju ) 
REFERENCES asortyment ( id_stroju );

ALTER TABLE egzemplarze 
ADD CONSTRAINT egzemplarze_dostawcy_fk FOREIGN KEY ( dostawcy_id_dostawcy ) 
REFERENCES dostawcy ( id_dostawcy );

ALTER TABLE klienci 
ADD CONSTRAINT klienci_kody_pocztowe_fk FOREIGN KEY ( kody_pocztowe_kod_pocztowy ) 
REFERENCES kody_pocztowe ( kod_pocztowy );

ALTER TABLE kolory_stroju 
ADD CONSTRAINT kolory_stroju_asortyment_fk FOREIGN KEY ( asortyment_id_stroju ) 
REFERENCES asortyment ( id_stroju );

ALTER TABLE kolory_stroju 
ADD CONSTRAINT kolory_stroju_kolory_fk FOREIGN KEY ( kolory_id_koloru ) 
REFERENCES kolory ( id_koloru );

ALTER TABLE materialy_stroju 
ADD CONSTRAINT materialy_stroju_asortyment_fk FOREIGN KEY ( asortyment_id_stroju ) 
REFERENCES asortyment ( id_stroju );

ALTER TABLE materialy_stroju 
ADD CONSTRAINT materialy_stroju_materialy_fk FOREIGN KEY ( materialy_id_materialu ) 
REFERENCES materialy ( id_materialu );

ALTER TABLE pracownicy 
ADD CONSTRAINT pracownicy_kody_pocztowe_fk FOREIGN KEY ( kody_pocztowe_kod_pocztowy ) 
REFERENCES kody_pocztowe ( kod_pocztowy );

ALTER TABLE wypozyczenia 
ADD CONSTRAINT wypozyczenia_asortyment_fk FOREIGN KEY ( asortyment_id_stroju ) 
REFERENCES asortyment ( id_stroju );

ALTER TABLE wypozyczenia 
ADD CONSTRAINT wypozyczenia_klienci_fk FOREIGN KEY ( klienci_id_klienta ) 
REFERENCES klienci ( id_klienta );

ALTER TABLE wypozyczenia 
ADD CONSTRAINT wypozyczenia_pracownicy_fk FOREIGN KEY ( pracownicy_id_pracownika ) 
REFERENCES pracownicy ( id_pracownika );

insert into kody_pocztowe (kod_pocztowy, miasto) values ('38-364', 'Zbůch');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('72-925', 'Monte Novo');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('295-236', 'Nanjie');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('43-2726', 'El Colorado');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('74-205', 'Matang');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('45-7437', 'Douz');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('784-259', 'Tân Hòa');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('65-2857', 'El Carmen');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('4827-547', 'Turbaco');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('57-45', 'Rueil-Malmaison');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('258-59', 'Pećigrad');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('57-254', 'Pilar');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('09-680', 'Sakété');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('668-45', 'Parrita');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('236-45', 'Tanshan');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('64-368', 'Mrzezino');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('054-3284', 'Kairouan');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('691-1479', 'Monção');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('38-37', 'Tabasalu');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('593-46', 'Pak Thong Chai');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('287-379', 'Chenzhou');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('045-265', 'Cikarang');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('703-65', 'Taihe');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('93-275', 'Yangong');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('386-74', 'Moroto');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('28-473', 'Trà Vinh');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('974-896', 'Vila Verde');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('26-84', 'Del Rosario');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('9523-45', 'Gunjur Kuta');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('9421-468', 'Bulahblangaro');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('143-67', 'Zunilito');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('374-74', 'Ryazhsk');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('007-3698', 'Ash Shaykh Zuwayd');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('2592-76', 'Muhur');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('57-62', 'Tecpán Guatemala');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('846-633', 'Donggang');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('86-215', 'Agía Foteiní');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('052-34', 'Laguna');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('56-257', 'Saint-Priest');

insert into kody_pocztowe (kod_pocztowy, miasto) values ('86-76', 'Palpalá');

insert into kategorie (id_kategorii, nazwa_kategorii) values (1, 'suknia wieczorowa');

insert into kategorie (id_kategorii, nazwa_kategorii) values (2, 'suknia koktajlowa');

insert into kategorie (id_kategorii, nazwa_kategorii) values (3, 'kombinezon');

insert into kategorie (id_kategorii, nazwa_kategorii) values (4, 'suknia ślubna');

insert into kategorie (id_kategorii, nazwa_kategorii) values (5, 'suknia druhny');

insert into kategorie (id_kategorii, nazwa_kategorii) values (6, 'suknia do sesji');

insert into kategorie (id_kategorii, nazwa_kategorii) values (7, 'garnitur');

insert into kategorie (id_kategorii, nazwa_kategorii) values (8, 'smoking');

insert into kategorie (id_kategorii, nazwa_kategorii) values (9, 'suknia dzienna');

insert into kategorie (id_kategorii, nazwa_kategorii) values (10, 'garnitur sportowy');

insert into kolory (id_koloru, nazwa_koloru) values (1, 'Indigo');

insert into kolory (id_koloru, nazwa_koloru) values (2, 'Pink');

insert into kolory (id_koloru, nazwa_koloru) values (3, 'Red');

insert into kolory (id_koloru, nazwa_koloru) values (4, 'White');

insert into kolory (id_koloru, nazwa_koloru) values (5, 'Crimson');

insert into kolory (id_koloru, nazwa_koloru) values (6, 'Khaki');

insert into kolory (id_koloru, nazwa_koloru) values (7, 'Aquamarine');

insert into kolory (id_koloru, nazwa_koloru) values (8, 'Green');

insert into kolory (id_koloru, nazwa_koloru) values (9, 'Violet');

insert into kolory (id_koloru, nazwa_koloru) values (10, 'Blue');

insert into marki (id_marki, nazwa_marki) values (1, 'Magnifique');

insert into marki (id_marki, nazwa_marki) values (2, 'Thoughtmix');

insert into marki (id_marki, nazwa_marki) values (3, 'Zoomcast');

insert into marki (id_marki, nazwa_marki) values (4, 'Gabspot');

insert into marki (id_marki, nazwa_marki) values (5, 'Avamm');

insert into marki (id_marki, nazwa_marki) values (6, 'Eimbee');

insert into marki (id_marki, nazwa_marki) values (7, 'Fadeo');

insert into marki (id_marki, nazwa_marki) values (8, 'Twinte');

insert into marki (id_marki, nazwa_marki) values (9, 'Voolith');

insert into marki (id_marki, nazwa_marki) values (10, 'Skipfire');

insert into marki (id_marki, nazwa_marki) values (11, 'Aimbu');

insert into marki (id_marki, nazwa_marki) values (12, 'Flipbug');

insert into marki (id_marki, nazwa_marki) values (13, 'Blogspan');

insert into marki (id_marki, nazwa_marki) values (14, 'Kazio');

insert into marki (id_marki, nazwa_marki) values (15, 'Voonder');

insert into materialy (id_materialu, nazwa_materialu) values (1, 'Welna');

insert into materialy (id_materialu, nazwa_materialu) values (2, 'Bawelna');

insert into materialy (id_materialu, nazwa_materialu) values (3, 'Poliester');

insert into materialy (id_materialu, nazwa_materialu) values (4, 'Wiskoza');

insert into materialy (id_materialu, nazwa_materialu) values (5, 'Len');

insert into materialy (id_materialu, nazwa_materialu) values (6, 'Jedwab');

insert into materialy (id_materialu, nazwa_materialu) values (7, 'Skora');

insert into materialy (id_materialu, nazwa_materialu) values (8, 'Akryl');

insert into materialy (id_materialu, nazwa_materialu) values (9, 'Nylon');

insert into materialy (id_materialu, nazwa_materialu) values (10, 'Jeans');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (1, 'Homere', 'Bater', '4918544967', '1121548326', '12-Mar-2020', 3790, '1', 'Coolidge', '210', '64-368');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (2, 'Milton', 'Duignan', '7646096697', '8739533441', '17-Mar-2022', 4511,' 1', 'Trailsway', '99', '09-680');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (3, 'Yoko', 'Skottle', '1851325083', '7262724363', '02-Jan-2022', 4592, '0', 'Reinke', '6', '86-76');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (4, 'Luther', 'Cottis', '2635030270', '4026650979', '19-Mar-2019', 3793, '1', 'Ludington', '7083', '258-59');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (5, 'Micky', 'Cornu', '8142262866', '5647532098', '10-Nov-2020', 3132, '1', 'Warrior', '7', '386-74');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (6, 'Hedwiga', 'Kissell', '2372434535', '6374984463', '09-Sep-2021', 2941, '0', 'Hermina', '3252', '386-74');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (7, 'Lainey', 'Fairpo', '5264560933', '7893525916', '02-Feb-2022', 4875, '1', 'Stoughton', '45535', '64-368');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (8, 'Romona', 'Bispham', '4602255407', '6327074235', '31-Jul-2021', 4171, '1', 'Shelley', '880', '09-680');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (9, 'Eustace', 'Yexley', '2823521465', '0088237958', '17-Jun-2020', 4808, '1', 'Cherokee', '8421', '86-76');

insert into pracownicy (id_pracownika, imie, nazwisko, telefon, pesel, data_zatrudnienia, pensja, zatrudniony, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (10, 'Eddie', 'Dumbrall', '3609744561', '2019366975', '28-Dec-2021', 3895, '0', 'Fremont', '991', '258-59');

insert into rozmiary (id_rozmiaru, rozmiar) values (1, 'XS');

insert into rozmiary (id_rozmiaru, rozmiar) values (2, 'S');

insert into rozmiary (id_rozmiaru, rozmiar) values (3, 'M');

insert into rozmiary (id_rozmiaru, rozmiar) values (4, 'L');

insert into rozmiary (id_rozmiaru, rozmiar) values (5, 'XL');

insert into rozmiary (id_rozmiaru, rozmiar) values (6, 'XXL');

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (1, 'bel1', 276, 'opis', 5, 10, 3);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (2, 'bel2', 489, 'opis', 3, 15, 9);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (3, 'princess12', 10, 'opis', 3, 14, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (4, 'dama1', 416, 'opis', 4, 12, 8);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (5, 'dama2', 416, 'opis', 5, 10, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (6, 'dama3', 33, 'opis', 5, 6, 1);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (7, 'dama4', 379, 'opis', 1, 3, 9);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (8, 'dama5', 379, 'opis', 3, 9, 1);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (9, 'dama6', 417, 'opis', 2, 11, 2);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (10, 'dama7', 82, 'opis', 1, 15, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (11, 'dama8', 366, 'opis', 3, 6, 10);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (12, 'dama9', 13, 'opis', 1, 2, 4);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (13, 'dama10', 235, 'opis', 3, 1, 10);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (14, 'dama11', 371, 'opis', 5, 3, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (15, 'dama12', 371, 'opis', 1, 13, 9);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (16, 'dama13', 93, 'opis', 5, 6, 9);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (17, 'dama14', 100, 'opis', 3, 6, 5);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (18, 'dama15', 329, 'opis', 1, 5, 7);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (19, 'dama16', 374, 'opis', 1, 3, 1);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (20, 'dama17', 362, 'opis', 5, 8, 3);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (21, 'dama18', 320, 'opis', 1, 1, 1);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (22, 'dama19', 173, 'opis', 6, 6, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (23, 'dama20', 64, 'opis', 1, 5, 5);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (24, 'dama21', 380, 'opis', 4, 7, 2);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (25, 'dama22', 479, 'opis', 3, 5, 2);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (26, 'dama23', 453, 'opis', 4, 9, 6);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (27, 'dama24', 101, 'opis', 6, 7, 4);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (28, 'dama25', 272, 'opis', 3, 3, 1);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (29, 'dama26', 388, 'opis', 4, 15, 7);

insert into asortyment (id_stroju, nazwa_stroju, cena_wypozyczenia, opis, rozmiary_id_rozmiaru, marki_id_marki, kategorie_id_kategorii) values (30, 'dama27', 69, 'opis', 2, 5, 9);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 1);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (5, 2);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 3);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (5, 4);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (3, 5);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (10, 6);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (5, 7);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (5, 8);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (8, 9);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (8, 10);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (7, 11);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (2, 12);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (4, 13);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (4, 14);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (7, 15);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (8, 16);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (2, 17);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (9, 18);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (10, 19);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (7, 20);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (9, 21);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (6, 22);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (3, 23);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (7, 24);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (3, 25);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 26);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (9, 27);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (2, 28);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (7, 29);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (2, 30);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 1);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (3, 2);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (2, 3);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 4);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (1, 5);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (4, 6);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (10, 7);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (8, 8);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (9, 9);

insert into kolory_stroju (kolory_id_koloru, asortyment_id_stroju) values (8, 10);

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (1, '7444609299', 'mstgers0@utexas.edu', 41838786813008002544, 'Larry', '588', '28-473');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (2, '4053499741', 'nnadn1@paypal.com', 54608006026264508616, 'Ohio', '02', '374-74');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (3, '5628501191', 'lheins2@blog.com', 21915535311660964322, 'Veith', '5', '45-7437');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (4, '3698706426', 'cfihburn3@amazon.de', 86723070310558533662, 'Carioca', '2119', '28-473');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (5, '1132472950', 'mmizi4@epa.gov', 65643291935504637081, 'Red Cloud', '3698', '007-3698');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (6, '2944824545', 'adinah5@un.org', 70623330515094057031, 'Hintze', '19', '258-59');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (7, '6939273831', 'bgiaoppo6@ameblo.jp', 67467009002240098827, 'Annamark', '809', '007-3698');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (8, '7864357145', 'spolen7@hubpages.com', 85357838075844457410, 'Crowley', '5', '374-74');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (9, '9957465949', 'ndotry8@usa.gov', 30397264044885093894, 'Pearson', '3941', '45-7437');

insert into dostawcy (id_dostawcy, telefon, Adres_email, nr_konta, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (10, '4036664843', 'asadwick9@slate.com', 99566053168868843424, 'Morning', '99033', '28-473');

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (1, '1', '01-Jan-2020', 30, 5, 10);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (2, '1', '24-Mar-2021', 100, 15, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (3, '0', '24-Jun-2020', 452, 16, 10);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (4, '1', '21-Dec-2021', 157, 26, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (5, '1', '30-Jan-2020', 117, 7, 5);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (6, '0', '20-Oct-2019', 728, 1, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (7, '1', '22-Aug-2020', 727, 13, 2);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (8, '0', '15-May-2020', 66, 7, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (9, '1', '25-Apr-2021', 302, 26, 4);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (10, '1', '20-Jul-2020', 459, 17, 6);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (11, '0', '25-Jun-2021', 526, 13, 5);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (12, '1', '02-May-2020', 537, 25, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (13, '0', '16-Apr-2022', 565, 13, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (14, '0', '25-Oct-2019', 694, 6, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (15, '1', '18-Dec-2021', 120, 7, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (16, '0', '13-Feb-2022', 294, 9, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (17, '0', '14-Feb-2021', 876, 11, 10);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (18, '1', '11-Dec-2019', 809, 22, 6);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (19, '1', '25-Mar-2022', 465, 20, 10);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (20, '0', '06-Sep-2020', 993, 26, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (21, '1', '23-Jun-2021', 316, 12, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (22, '0', '17-Jan-2022', 492, 28, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (23, '1', '10-Oct-2019', 53, 16, 4);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (24, '0', '26-Jun-2021', 120, 27, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (25, '1', '08-Apr-2022', 123, 2, 5);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (26, '0', '28-Aug-2020', 489, 2, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (27, '0', '15-Nov-2021', 414, 30, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (28, '0', '06-May-2022', 992, 19, 10);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (29, '1', '05-Feb-2020', 21, 13, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (30, '0', '07-May-2021', 175, 5, 5);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (31, '0', '07-Jul-2022', 426, 4, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (32, '1', '28-Oct-2021', 16, 18, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (33, '1', '14-Apr-2022', 119, 22, 4);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (34, '0', '23-Sep-2021', 856, 12, 2);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (35, '0', '19-Jan-2020', 860, 6, 4);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (36, '1', '15-Dec-2021', 399, 2, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (37, '0', '18-Nov-2019', 961, 21, 2);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (38, '0', '19-Jun-2020', 736, 20, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (39, '0', '01-Jan-2022', 936, 27, 6);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (40, '1', '17-Aug-2020', 215, 27, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (41, '0', '16-Apr-2020', 667, 17, 6);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (42, '0', '12-May-2022', 552, 6, 1);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (43, '1', '24-Feb-2021', 182, 9, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (44, '1', '12-Aug-2019', 242, 27, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (45, '0', '11-Mar-2021', 418, 1, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (46, '0', '19-Aug-2021', 714, 13, 3);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (47, '0', '02-Jul-2022', 141, 3, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (48, '1', '16-Oct-2020', 860, 14, 7);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (49, '0', '12-Apr-2022', 168, 16, 9);

insert into egzemplarze (id_egzemplarz, dostepnosc, data_zamowienia, cena_zakupu, asortyment_id_stroju, dostawcy_id_dostawcy) values (50, '0', '13-Mar-2021', 961, 21, 5);

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (1, 'Brandi', 'Bradbrook', '7332983679', 'bbradbrook0@google.nl', 'Eagan', '31', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (2, 'Marcille', 'Coldbath', '3309309126', 'mcoldbath1@statcounter.com', 'Oak', '24', '57-45');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (3, 'Karna', 'Volage', '1105683886', 'kvolage2@sfgate.com', 'Dapin', '3', '287-379');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (4, 'Joice', 'Spiaggia', '9445305505', 'jspiaggia3@vimeo.com', 'Maple Wood', '9497', '143-67');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (5, 'Tami', 'Enderlein', '4658438162', 'tenderlein4@eepurl.com', 'Schiller', '218', '86-215');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (6, 'Roberta', 'Iannazzi', '5461025364', 'riannazzi5@wiley.com', 'Loftsgordon', '220', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (7, 'Greta', 'Jeffes', '1558138694', 'gjeffes6@accuweather.com', 'Schmedeman', '863', '26-84');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (8, 'Minnaminnie', 'Weatherhead', '7729113946', 'mweatherhead7@nbcnews.com', 'Mesta', '8', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (9, 'Lynette', 'Goreway', '4963379324', 'lgoreway8@sbwire.com', 'Schlimgen', '44429', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (10, 'Cloris', 'Densell', '3947456885', 'cdensell9@admin.ch', 'Anniversary', '508', '4827-547');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (11, 'Tuesday', 'Reddish', '1425099463', 'treddisha@facebook.com', 'Canary', '70', '258-59');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (12, 'Franni', 'Labrow', '6467392905', 'flabrowb@ebay.co.uk', 'Monterey', '39378', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (13, 'Arden', 'Blinckhorne', '9727664449', 'ablinckhornec@studiopress.com', 'Dixon', '679', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (14, 'Pet', 'Denidge', '5185162644', 'pdenidged@pcworld.com', 'Miller', '5421', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (15, 'Frances', 'Buchett', '7661394531', 'fbuchette@bing.com', 'Sutteridge', '7754', '9421-468');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (16, 'Estrellita', 'Votier', '4904756195', 'evotierf@cdbaby.com', 'Delaware', '07078', '26-84');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (17, 'Jessy', 'Carrabott', '5018840617', 'jcarrabottg@rakuten.co.jp', 'Gina', '5151', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (18, 'Karyn', 'O''Cuddie', '6529152903', 'kocuddieh@people.com.cn', 'Heath', '237', '45-7437');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (19, 'Florence', 'Eddolls', '3775992628', 'feddollsi@reference.com', 'Continental', '41739', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (20, 'Anna', 'Gantlett', '5578548798', 'agantlettj@dedecms.com', 'Marquette', '01314', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (21, 'Bobine', 'Gallafant', '6411685746', 'bgallafantk@about.com', 'Nelson', '592', '45-7437');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (22, 'Pepi', 'Paula', '5715717856', 'ppaulal@creativecommons.org', 'Valley Edge', '3105', '9421-468');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (23, 'Crin', 'Christiensen', '8976525885', 'cchristiensenm@hatena.ne.jp', '8th', '891', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (24, 'Noelle', 'Macewan', '5266437575', 'nmacewann@gizmodo.com', 'Gerald', '03', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (25, 'Nari', 'Biever', '4535337058', 'nbievero@desdev.cn', 'Sunfield', '38', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (26, 'Andria', 'Easman', '9102682012', 'aeasmanp@independent.co.uk', 'American Ash', '659', '45-7437');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (27, 'Kizzee', 'Fritzer', '4609943521', 'kfritzerq@nyu.edu', 'Hazelcrest', '0900', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (28, 'Cherianne', 'Wyldes', '2159599185', 'cwyldesr@dmoz.org', 'Briar Crest', '99', '26-84');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (29, 'Dinah', 'Cawt', '8279255259', 'dcawts@china.com.cn', 'Lien', '746', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (30, 'Wendy', 'Stendall', '5552655614', 'wstendallt@macromedia.com', 'Oxford', '39298', '4827-547');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (31, 'Aundrea', 'Rettie', '4045615050', 'arettieu@alexa.com', 'Banding', '498', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (32, 'Yettie', 'Mechell', '9173886882', 'ymechellv@com.com', 'Melvin', '70', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (33, 'Donielle', 'Mattusevich', '1673984945', 'dmattusevichw@ibm.com', 'Towne', '77804', '258-59');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (34, 'Sharai', 'Malyon', '5874794264', 'smalyonx@bizjournals.com', 'Ruskin', '2', '9421-468');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (35, 'Priscilla', 'Burberry', '6234265227', 'pburberryy@nps.gov', 'Hovde', '3882', '45-7437');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (36, 'Nannie', 'Braunfeld', '2089325242', 'nbraunfeldz@nymag.com', 'Meadow Valley', '28590', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (37, 'Clair', 'Packman', '3922371401', 'cpackman10@independent.co.uk', 'Fuller', '1530', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (38, 'Lola', 'Pobjoy', '4807769328', 'lpobjoy11@archive.org', 'Scofield', '4', '38-37');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (39, 'Abigale', 'Succamore', '8049239548', 'asuccamore12@archive.org', 'Clove', '1439', '4827-547');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (40, 'Betty', 'Writer', '8343284247', 'bwriter13@ibm.com', 'Messerschmidt', '181', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (41, 'Anny', 'Mutter', '3778561896', 'amutter14@google.com.au', 'Myrtle', '1', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (42, 'Jonie', 'Aubury', '4556647346', 'jaubury15@chronoengine.com', 'Shoshone', '5213', '26-84');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (43, 'Susannah', 'Heinicke', '7967707516', 'sheinicke16@pcworld.com', 'Troy', '0198', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (44, 'Georgiana', 'Castanone', '9605863245', 'gcastanone17@virginia.edu', 'Lotheville', '49474', '9421-468');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (45, 'Lorrie', 'Sowter', '5316266890', 'lsowter18@friendfeed.com', 'Stephen', '5366', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (46, 'Vida', 'Pattillo', '7894368156', 'vpattillo19@tamu.edu', 'Steensland', '27', '691-1479');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (47, 'Faustina', 'Yushkin', '9652760961', 'fyushkin1a@imageshack.us', 'Quincy', '16374', '258-59');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (48, 'Latisha', 'Deporte', '1029261171', 'ldeporte1b@twitpic.com', 'Upham', '811', '09-680');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (49, 'Berta', 'Christofor', '9273558103', 'bchristofor1c@elpais.com', 'Fairview', '59', '9421-468');

insert into klienci (id_klienta, imie, nazwisko, telefon, Adres_email, ulica, numer_domu, kody_pocztowe_kod_pocztowy) values (50, 'Dorey', 'Handke', '6972141018', 'dhandke1d@google.com.br', 'Mcbride', '33764', '258-59');

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (9, 1);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (3, 2);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 3);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (9, 4);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (3, 5);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (6, 6);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (5, 7);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 8);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (5, 9);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (4, 10);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 11);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (9, 12);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (7, 13);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (7, 14);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 15);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 16);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 17);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 18);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 19);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 20);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (1, 21);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (6, 22);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (6, 23);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (6, 24);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (5, 25);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (4, 26);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 27);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (5, 28);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (4, 29);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (9, 30);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (3, 1);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 2);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 3);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (3, 4);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 5);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (2, 6);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (10, 7);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (3, 8);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (8, 9);

insert into materialy_stroju (materialy_id_materialu, asortyment_id_stroju) values (7, 10);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (1, '17-May-2020', 18, '23-Nov-2022', 'zly', 50, 105, 33, 14, '24-Feb-2021', 28, 7, 22);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (2, '07-Sep-2020', 14, '11-Dec-2022', 'dobry', null, null, null, 14, '23-Oct-2022', 10, 2, 23);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (3, '22-Nov-2020', 8, '14-Jun-2022', 'dobry', null, null, null, 8, '23-Oct-2022', 12, 6, 16);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (4, '22-Jul-2020', 6, '08-Jul-2022', 'zly', 50, 50, 44, 10, '23-Oct-2022', 24, 2, 2);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (5, '22-Jul-2020', 17, '22-Oct-2022', 'dobry', null, null, null, 13, '23-Oct-2022', 42, 7, 12);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (6, '28-Jun-2021', 15, '12-Mar-2022', 'dobry', null, null, null, 15, '23-Oct-2022', 16, 2, 19);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (7, '14-Mar-2021', 13, '17-Aug-2021', 'zly', 50, 50, 41, 27, '23-Oct-2022', 47, 10, 14);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (8, '28-Jun-2020', 16, '21-Sep-2021', 'zly', 50, 105, 47, 27, '23-Oct-2022', 44, 2, 2);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (9, '28-Jun-2021', 26, '23-Oct-2022', 'zly', 50, 105, 37, 27, '23-Oct-2022', 7, 4, 12);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (10, '23-Nov-2020', 30, '22-Jan-2022', 'dobry', null, 50, null, 11, '23-Oct-2022', 24, 8, 5);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (11, '29-Jan-2020', 19, '26-Feb-2022', 'dobry', null, null, null, 1, '14-Jun-2022', 14, 5, 23);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (12, '01-Apr-2021', 22, '14-Jun-2022', 'dobry', null, null, null, 1, '14-Jun-2022', 16, 1, 9);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (13, '02-Aug-2021', 10, '11-Dec-2022', 'dobry', null, null, null, 7, '11-Dec-2022', 45, 10, 27);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (14, '17-May-2020', 10, '11-Dec-2022', 'dobry', null, 50, null, 2, '11-Dec-2022', 24, 5, 5);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (15, '22-Jul-2020', 14, '22-Oct-2022', 'dobry', null, null, null, 14, '22-Oct-2022', 42, 6, 1);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (16, '17-May-2020', 2, '08-Jul-2022', 'dobry', null, null, null, 2, '08-Jul-2022', 2, 5, 12);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (17, '07-Sep-2020', 27, '12-Mar-2022', 'dobry', null, null, null, 5, '12-Mar-2022', 49, 5, 4);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (18, '07-Sep-2020', 30, '23-Nov-2022', 'dobry', null, 50, null, 8, '23-Nov-2022', 19, 2, 21);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (19, '22-Nov-2020', 1, '23-Nov-2022', 'dobry', null, null, null, 1, '23-Nov-2022', 21, 2, 18);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (20, '28-Jun-2021', 17, '11-Dec-2022', 'zly', 50, 50, 43, 29, '11-Dec-2022', 47, 7, 15);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (21, '28-Jun-2021', 28, '11-Dec-2022', 'dobry', null, 50, null, 3, '11-Dec-2022', 18, 2, 17);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (22, '22-Jul-2020', 15, '12-Mar-2022', 'dobry', null, null, null, 15, '12-Mar-2022', 25, 3, 20);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (23, '17-May-2020', 8, '14-Jun-2022', 'dobry', null, null, null, 8, '14-Jun-2022', 10, 2, 14);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (24, '22-Nov-2020', 8, '08-Jul-2022', 'zly', 50, 50, 48, 14, '08-Jul-2022', 47, 4, 16);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (25, '17-May-2020', 1, '11-Dec-2022', 'dobry', null, null, null, 1, '11-Dec-2022', 21, 5, 10);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (26, '22-Jul-2020', 6, '14-Jun-2022', 'dobry', null, null, null, 6, '14-Jun-2022', 41, 4, 9);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (27, '28-Jun-2021', 10, '23-Nov-2022', 'dobry', null, null, null, 10, '23-Nov-2022', 43, 2, 20);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (28, '17-May-2020', 19, '12-Mar-2022', 'dobry', null, null, null, 19, '12-Mar-2022', 28, 2, 9);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (29, '28-Jun-2021', 26, '08-Jul-2022', 'dobry', null, 50, null, 24, '08-Jul-2022', 6, 8, 28);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (30, '17-May-2020', 8, '11-Dec-2022', 'dobry', null, 50, null, 8, '11-Dec-2022', 40, 7, 28);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (31, '07-Sep-2020', 17, '23-Nov-2022', 'dobry', null, null, null, 17, '23-Nov-2022', 12, 6, 8);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (32, '22-Nov-2020', 30, '22-Oct-2022', 'zly', 50, 105, 48, 35, '22-Oct-2022', 15, 2, 19);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (33, '22-Jul-2020', 5, '11-Dec-2022', 'zly', 50, 105, 34, 14, '21-Sep-2021', 5, 5, 12);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (34, '22-Nov-2020', 5, '22-Oct-2022', 'dobry', null, null, null, 5, '22-Oct-2022', 10, 6, 25);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (35, '07-Sep-2020', 10, '23-Nov-2022', 'dobry', null, null, null, 10, '23-Nov-2022', 9, 9, 1);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (36, '22-Jul-2020', 14, '14-Jun-2022', 'dobry', null, null, null, 2, '14-Jun-2022', 35, 2, 14);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (37, '22-Jul-2020', 21, '12-Mar-2022', 'zly', 50, 105, 43, 27, '12-Mar-2022', 3, 9, 11);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (38, '17-May-2020', 17, '23-Nov-2022', 'dobry', null, null, null, 17, '23-Nov-2022', 27, 9, 4);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (39, '28-Jun-2021', 6, '17-Aug-2021', 'dobry', null, null, null, 6, '17-Aug-2021', 20, 4, 25);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (40, '29-Jan-2020', 26, '21-Sep-2021', 'dobry', null, null, null, 26, '21-Sep-2021', 31, 6, 30);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (41, '22-Nov-2020', 26, '12-Mar-2022', 'dobry', null, null, null, 26, '12-Mar-2022', 44, 2, 18);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (42, '22-Nov-2020', 26, '23-Nov-2022', 'dobry', null, 50, null, 26, '23-Nov-2022', 25, 2, 21);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (43, '22-Jul-2020', 3, '23-Oct-2022', 'dobry', null, null, null, 3, '23-Oct-2022', 2, 2, 1);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (44, '07-Sep-2020', 5, '21-Sep-2021', 'dobry', null, null, null, 5, '21-Sep-2021', 6, 1, 2);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (45, '17-May-2020', 6, '12-Mar-2022', 'zly', 50, 105, 39, 14, '12-Mar-2022', 15, 10, 27);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (46, '29-Jan-2020', 13, '17-Aug-2021', 'dobry', null, null, null, 13, '17-Aug-2021', 31, 3, 30);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (47, '28-Jun-2021', 5, '12-Mar-2022', 'zly', 50, 105, 41, 29, '12-Mar-2022', 35, 9, 2);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (48, '07-Sep-2020', 13, '21-Sep-2021', 'zly', 50, 105, 43, 28, '21-Sep-2021', 23, 8, 14);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (49, '29-Jan-2020', 20, '17-Aug-2021', 'dobry', null, null, null, 20, '17-Aug-2021', 37, 2, 26);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (50, '28-Jun-2021', 4, '23-Nov-2022', 'dobry', null, null, null, 4, '23-Nov-2022', 10, 8, 4);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (51, '17-May-2020', 4, '22-Oct-2022', 'zly', 50, 105, 33, 38, '22-Oct-2022', 17, 10, 21);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (52, '29-Jan-2020', 11, '22-Oct-2022', 'dobry', null, null, null, 5, '22-Oct-2022', 36, 10, 10);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (53, '28-Jun-2021', 19, '23-Nov-2022', 'dobry', null, null, null, 19, '23-Nov-2022', 44, 1, 20);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (54, '22-Jul-2020', 25, '12-Mar-2022', 'dobry', null, null, null, 25, '12-Mar-2022', 5, 7, 12);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (55, '17-May-2020', 3, '08-Jul-2022', 'dobry', null, 50, null, 3, '08-Jul-2022', 5, 5, 15);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (56, '28-Jun-2021', 23, '23-Nov-2022', 'dobry', null, null, null, 23, '23-Nov-2022', 3, 2, 29);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (57, '22-Jul-2020', 1, '08-Jul-2022', 'dobry', null, 50, null, 1, '08-Jul-2022', 5, 2, 13);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (58, '07-Sep-2020', 22, '17-Aug-2021', 'zly', 50, 105, 43, 23, '17-Aug-2021', 39, 9, 2);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (59, '29-Jan-2020', 17, '22-Oct-2022', 'dobry', null, null, null, 17, '22-Oct-2022', 1, 3, 6);

insert into wypozyczenia (id_wypozyczenia, data_wypozyczenia, liczba_dni, data_zwrotu, stan, oplata_nieterminowosc, oplata_zniszczenie, oplata_poprawki, fakt_liczba_dni, data_splaty, klienci_id_klienta, pracownicy_id_pracownika, asortyment_id_stroju) values (60, '22-Jul-2020', 7, '08-Jul-2022', 'zly', 50, 105, 43, 19, '08-Jul-2022', 1, 2, 5);

SELECT Klienci.Imie, Klienci.Nazwisko, Klienci.Telefon, Klienci.Adres_email, Wypozyczenia.Data_Zwrotu, Wypozyczenia.Fakt_Liczba_Dni-Wypozyczenia.Liczba_Dni AS Liczba_Dni_Spoznienia 
FROM Klienci INNER JOIN Wypozyczenia ON Klienci.ID_Klienta = Wypozyczenia.Klienci_ID_Klienta 
WHERE Wypozyczenia.Fakt_Liczba_Dni - Wypozyczenia.Liczba_Dni > 0;

SELECT Asortyment.ID_Stroju, Asortyment.Nazwa_Stroju, Count(Wypozyczenia.ID_Wypozyczenia) AS Liczba_Wypozyczen 
FROM Asortyment INNER JOIN Wypozyczenia ON Asortyment.ID_Stroju = Wypozyczenia.Asortyment_ID_Stroju 
GROUP BY Asortyment.ID_Stroju, Asortyment.Nazwa_Stroju 
ORDER BY Count(Wypozyczenia.ID_Wypozyczenia) DESC;

SELECT Klienci.Imie, Klienci.Nazwisko, Klienci.Telefon, Count(Wypozyczenia.ID_Wypozyczenia) AS Liczba_Wypozyczen 
FROM Klienci INNER JOIN Wypozyczenia ON Klienci.ID_Klienta = Wypozyczenia.Klienci_ID_Klienta 
GROUP BY Klienci.Imie, Klienci.Nazwisko, Klienci.Telefon 
HAVING Count(Wypozyczenia.ID_Wypozyczenia)>3;

SELECT Pracownicy.ID_Pracownika, Pracownicy.Imie, Pracownicy.Nazwisko, Count(Wypozyczenia.ID_Wypozyczenia) AS Liczba_Transakcji 
FROM Pracownicy INNER JOIN Wypozyczenia ON Pracownicy.ID_Pracownika = Wypozyczenia.Pracownicy_ID_Pracownika 
GROUP BY Pracownicy.ID_Pracownika, Pracownicy.Imie, Pracownicy.Nazwisko 
ORDER BY Count(Wypozyczenia.ID_Wypozyczenia) DESC;

SELECT Klienci.ID_Klienta, Klienci.Imie, Klienci.Nazwisko, Klienci.Telefon, Klienci.Adres_email, Sum(Wypozyczenia.Oplata_Zniszczenie) AS Zniszczenia 
FROM Klienci INNER JOIN Wypozyczenia ON Klienci.ID_Klienta = Wypozyczenia.Klienci_ID_Klienta 
GROUP BY Klienci.ID_Klienta, Klienci.Imie, Klienci.Nazwisko, Klienci.Telefon, Klienci.Adres_email 
HAVING Sum(Wypozyczenia.Oplata_Zniszczenie) > 100;

SELECT ID_Klienta, Imie, Nazwisko FROM Klienci 
WHERE Imie LIKE '%a';

SELECT * FROM Wypozyczenia 
WHERE Data_Wypozyczenia BETWEEN '01-Jan-2020' AND '31-Dec-2020';

SELECT Marki.Nazwa_Marki, COUNT(Wypozyczenia.ID_Wypozyczenia) AS Liczba_Wypozyczen FROM Marki 
INNER JOIN Asortyment ON Marki.ID_Marki = Asortyment.Marki_ID_Marki 
INNER JOIN Wypozyczenia ON Asortyment.ID_Stroju = Wypozyczenia.Asortyment_ID_Stroju 
GROUP BY Marki.Nazwa_Marki 
ORDER BY COUNT(Wypozyczenia.ID_Wypozyczenia) DESC;

SELECT Asortyment.*, Egzemplarze.Dostepnosc FROM Asortyment 
INNER JOIN Egzemplarze ON Asortyment.ID_Stroju = Egzemplarze.Asortyment_ID_Stroju 
WHERE Egzemplarze.Dostepnosc = 1;

SELECT Asortyment.Nazwa_Stroju, Marki.Nazwa_Marki FROM Asortyment 
INNER JOIN Marki ON Asortyment.Marki_ID_Marki = Marki.ID_Marki 
WHERE Marki.Nazwa_Marki LIKE 'Magnifique';

SELECT Imie, Nazwisko FROM Klienci 
ORDER BY Nazwisko;

SELECT Klienci.ID_Klienta, Klienci.Imie, Klienci.Nazwisko, COUNT(Wypozyczenia.ID_Wypozyczenia) AS Liczba_Wypozyczen FROM Klienci 
INNER JOIN Wypozyczenia ON Klienci.ID_Klienta = Wypozyczenia.Klienci_ID_Klienta 
GROUP BY Klienci.ID_Klienta, Klienci.Imie, Klienci.Nazwisko 
ORDER BY COUNT(Wypozyczenia.ID_Wypozyczenia) DESC;

SELECT Klienci.*, Wypozyczenia.Data_Wypozyczenia, (Wypozyczenia.Fakt_Liczba_Dni - Wypozyczenia.Liczba_Dni) AS Liczba_Dni_Po_Terminie FROM Klienci 
INNER JOIN Wypozyczenia ON Klienci.ID_Klienta = Wypozyczenia.Klienci_ID_Klienta 
WHERE (Wypozyczenia.Fakt_Liczba_Dni - Wypozyczenia.Liczba_Dni) > 0;

SELECT AVG(Pensja) AS Srednia_Pensja FROM Pracownicy;

SELECT Marki.Nazwa_Marki, COUNT(Asortyment.ID_Stroju) AS Liczba_Strojow FROM Marki 
INNER JOIN Asortyment ON Marki.ID_Marki = Asortyment.Marki_ID_Marki 
GROUP BY Marki.Nazwa_Marki 
ORDER BY COUNT(Asortyment.ID_Stroju) DESC;

