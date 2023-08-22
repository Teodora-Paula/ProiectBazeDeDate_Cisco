DROP DATABASE IF EXISTS CentruTurstic;
CREATE DATABASE IF NOT EXISTS CentruTuristic;
USE CentruTuristic; 

CREATE TABLE ghid(
id_ghid tinyint not null auto_increment,
nume varchar(50),
prenume varchar(50),
data_angajare date,
limbi_straine_cunoscute varchar(150),
varsta int,
PRIMARY KEY(id_ghid)
);
CREATE TABLE grup_turistic(
id_grup tinyint not null auto_increment,
nr_maxim_persoane int not null,
id_ghid tinyint not null,
PRIMARY KEY(id_grup),
FOREIGN KEY( id_ghid) REFERENCES ghid(id_ghid)
);

CREATE TABLE vizitator (
id_vizitator tinyint not null auto_increment,
nume varchar(50),
prenume varchar(50),
varsta tinyint,
id_grup tinyint not null,
PRIMARY KEY(id_vizitator),
FOREIGN KEY(id_grup) REFERENCES grup_turistic(id_grup)
);
CREATE TABLE obiectiv_turistic(
id_obiectiv tinyint not null auto_increment,
denumire_obiectiv varchar(150) not null,
oras varchar(50) not null,
adresa varchar(500) not null,
descriere mediumtext default null,
pret_vizita float not null,
primary key(id_obiectiv)
);
CREATE TABLE programari_vizita(
id_programare tinyint not null auto_increment,
data_programare datetime,
durata_tur TIME,
id_grup tinyint not null,
id_obiectiv tinyint not null,
primary key(id_programare),
foreign key(id_grup)references grup_turistic(id_grup),
foreign key(id_obiectiv) references obiectiv_turistic(id_obiectiv)
);
#comenzi cu ALTER TABLE
ALTER TABLE programari_vizita
ADD COLUMN ora_sfarsit_program TIME NOT NULL
AFTER data_programare;

ALTER TABLE vizitator
DROP foreign key vizitator_ibfk_1;

ALTER TABLE vizitator
ADD CONSTRAINT vizitator_fk foreign key(id_grup) REFERENCES grup_turistic(id_grup);

ALTER TABLE grup_turistic
drop foreign key grup_turistic_ibfk_1;

ALTER TABLE grup_turistic
ADD CONSTRAINT grup_turistic_fk foreign key(id_ghid) REFERENCES ghid(id_ghid);

alter table programari_vizita
drop column ora_sfarsit_program ;
#INSERT
INSERT INTO 
ghid
VALUES
(NULL,'Hoshiko','Ulrike', '2017-06-23','japoneza, engleza,spaniola', 24),
(NULL,'Hanzo','Hinata','2021-01-15','japoneza,engleza,romana',25),
(NULL,'Wilhelm','Sabrina','2020-07-21','engleza,spaniola,franceza',27),
(NULL,'Edgar','Louisa','2015-02-11','engleza,franceza',28),
(NULL,'Ryuu','Coleman','2015-07-09','spaniola,japoneza,engleza',30),
(NULL,'Riko','Martin','2019-06-28','araba,japoneza,engleza',30),
(NULL,'Hermann','Elisa','2015-10-12','germana,engleza,franceza',29),
(NULL,'Reiner','Iulia','2020-05-20','engleza,germana,franceza',29),
(NULL,'Osamu','Renate','2017-10-17','engleza,japoneza,franceza',29),
(NULL,'Marcella','Sanda','2017-08-21','germana, japoneza, italiana',22);

INSERT INTO
grup_turistic
VALUES
(NULL,10,2),
(NULL,20,2),
(NULL,20,1),
(NULL,30,2),
(NULL,30,3),
(NULL,25,7),
(NULL,15,8),
(NULL,10,9),
(NULL,10,10),
(NULL,10,5);

INSERT INTO
vizitator
values
(NULL,'Dobroslav','Norah',50,1),
(NULL,'Treasa','Magda',18,1),
(NULL,'Sixte','Arthur',21,2),
(NULL,'Koloman','Viktor',58,3),
(NULL,'Conrad','Helge',60,3),
(NULL,'Blagovest','Liidia',40,4),
(NULL,'Kai','Hana',43,5),
(NULL,'Leontine','Chris',35,4),
(NULL,'Gisbert','Pavlina',23,7),
(NULL,'Noelle','Lili',56,10);

INSERT INTO
obiectiv_turistic
VALUES
(NULL,'Colosseum','Roma','Regio III Isis et Serapis, Roma','Colosseumul este un monument istoric și turistic aflat in centrul Romei vizitat de foarte mulți turiști din toată lumea. El este probabil cea mai impresionantă clădire-ruină a Imperiului Roman. Colosseumul era cea mai mare construcție a vremurilor sale și astăzi este cel mai mare amfiteatru antic care poate fi vizitat in Italia','34.22'),
(NULL,'Stonehenge','Salisbury, comitaul Wiltshire','din soseaua A344- Amesbury, Wiltshire-SPE4 7DE','Ansamblul Stonehenge este format din patru cercuri concentrice construite din pietre.. Acestea împrejmuiesc un aranjament în formă de potcoavă, construit tot din piatră vânătă, în interiorul căreia se află o placă din gresie micacee, denumită Piatra de Altar.','10'),
(NULL,'Muzeul Louvre','Paris','Musée du Louvre, 75001 Paris, France','Muzeu cu caracter universal, Luvrul posedă opere de artă din epoci diferite ale civilizației, din Antichitate până la 1848, și acoperă o arie geo-culturală întinsă, de la Europa occidentală, Grecia, Egipt până la Orientul Apropiat.Luvrul este de asemenea unul dintre cele mai vizitate muzee din lume, cu aproximativ 8,5 milioane de vizitatori în 2008. În 2018, Luvru a fost cel mai vizitat muzeu de artă din lume, primind 10,2 milioane de vizitatori.',15),
(NULL,'Poarta Branderburg','Berlin','Pariser Platz, 10117 Berlin,Germania','Poarta Brandenburg este un monument ce se aseamănă cu Arcul de Triumf din București, fiind un edificiu construit în stilul neoclasic, devenit astăzi unul dintre cele mai cunoscute repere ale Germaniei. Poarta Brandenburg a fost construită în partea centrală a Berlinului, fiind un monument comandat de Regele Frederick William al II-lea al Prusiei ca un simbol al păcii absolute.',0),
(NULL,'Turnul  de televiziune din Berlin','Berlin','Alexanderplatz 10178 Berlin','Berliner Fernsehturm este un turn TV care se ridica la o inaltime de peste 360 de metri fata de baza sa futurista aflata in partea de sud a Alexanderplatz. Turnul este cea mai inalta structura din oras si poate fi vazut cu usurinta din orice parte a orasului.',9.5),
(NULL,'Turnul inclinat din Pisa','Pisa,Toscana','Piazza del Duomo, 56126 Pisa','Turnul înclinat din Pisa, este cea mai faimoasă clădire înclinată din lume și punctul de reper al orașului Pisa din Italia. Turnul a fost planificat ca o campanilă pentru Domul din Pisa.',18),
(NULL,'Sagrada Familia','Barcelona','Placa de la Sagrada Familia','Sagrada Familia, capodopera neterminata a lui Antoni Gaudi este unul dintre cele mai vizitate obiective turistice ale Barcelonei. Constructia cladirii este preconizata sa dureze cel putin pana in 2041, dar deja a devenit poate cel mai reprezentativ obiectiv turistic al orasului.',11.5),
(NULL,'Tower Bridge','Londra','Tower Bridge Rd, London SE1 2UP, UK','Tower Bridge este un pod peste Tamisa situat în Londra.Tower Bridge este în același timp un pod mobil și un pod suspendat.',10.60),
(NULL,'Castelul Osaka','Osaka','1-1 Ōsakajō, Chuo Ward, Osaka, 540-0002, Japonia','Castelul Osaka este un castel situat in Japonia, in orasul Osaka, sectorul Chuo. Numit initial Ozakajo, in secolul XVI, in perioada Azuchi-Momoyama, castelul a jucat un rol important in unificarea politica a Japoniei. Astazi Castelul Osaka este deschis publicului si este unul din cele mai cunoscute castele ale Japoniei.',6.75),
(NULL,'Turnul Eiffel','Paris','Arondismentul 7 din Paris; avenue Anatole-France nr. 5','Turnul Eiffel este o construcție faimoasă pe schelet de oțel din Paris ce măsoară 324 m înălțime. Turnul a devenit simbolul Franței cel mai răspândit la nivel mondial. A fost conceput de către Émile Nouguier, Maurice Koechlin și Stephen Sauvestre, angajați la Eiffel și Co. Gustave Eiffel, inițial reticent cu privire la proiect, a devenit ulterior un mare susținător al său și a cumpărat brevetul.',69.90);

INSERT INTO 
programari_vizita
VALUES
(NULL,'2021-09-06 18:56:44','03:45:00',1,1),
(NULL,'2023-11-05 05:16:43','02:05:00',2,2),
(NULL,'2019-03-01 07:43:11','00:45:00',2,3),
(NULL,'2019-07-08 10:13:07','00:50:10',3,4),
(NULL,'2022-10-28 09:58:25','00:54:05',4,10),
(NULL,'2021-03-21 14:02:27','00:50:00',5,5),
(NULL,'2020-07-08 10:13:10','01:10:05',6,6),
(NULL,'2021-11-25 15:10:03','01:10:10',7,7),
(NULL,'2022-01-19 17:10:00','00:45:50',8,7),
(NULL,'2021-04-17 12:56:31','00:56:00',9,9);

SET SQL_SAFE_UPDATES = 0;
DELETE from  programari_vizita;

ALTER TABLE programari_vizita auto_increment=1;
#UPDATE-URI
#modificam grupul vizitatorului cu id-ul 7 ; de la grupul 5 il mutam la 7
UPDATE vizitator
SET id_grup=7 
WHERE id_vizitator=7;

#modificam durata viztei cu id-ul 6  astfel incat durata turului sa fie de fix 60 de minute
UPDATE programari_vizita
SET durata_tur= '00:60:00'
WHERE id_programare=6;

#modificam grupul maxim de persoane la 15 pentru grupul cu id-ul 1
UPDATE grup_turistic
SET nr_maxim_persoane=15
WHERE id_grup=1;

SET SQL_SAFE_UPDATES = 0;
#DELETE-URI
# dorim sa stergem inregsitrarile pentru vizitatorii care au mai putin de 30 de ani
DELETE 
from vizitator
where varsta < 30;
#dorim sa stergem progrmarile de anul trecut din baza de date
delete 
from programari_vizita
WHERE year(data_programare)=2019;
#firma a decis ca angajatii sa cunoasca cel putin trei limbi straine. Va trebui sa eliminam, din pacate, angajatul cu id-ul 4.
DELETE
FROM ghid
where id_ghid=4;

#subinterogari
#obiectivele turistice a caror pret este mai mare decat pretul mediu al tuturor obiectivelor
SELECT 
denumire_obiectiv, adresa, pret_vizita
FROM  obiectiv_turistic
WHERE pret_vizita > (SELECT AVG(pret_vizita) FROM obiectiv_turistic);
#sa afiseze folosind un subquery obiectivele turistice care au acelasi oras ca cel cu id-ul 1
SELECT
denumire_obiectiv, adresa, pret_vizita
FROM obiectiv_turistic
WHERE oras=(SELECT oras FROM obiectiv_turistic WHERE id_obiectiv= 1);
#sa se afiseze, folosind un subquery, ghizii care au fost angajati in acelasi an cu cel al ghidului cu id-ul 1
SELECT *
FROM ghid
WHERE YEAR(data_angajare)= (SELECT year(data_angajare) from ghid where id_ghid=1);
#JOIN-uri
#sa se afiseze  id-ul, numele complet, data si durata turului pentru toate persoanele din tabela vizitator
SELECT  id_vizitator, CONCAT(prenume, ' ' , nume) nume, data_programare, durata_tur
FROM  vizitator JOIN grup_turistic JOIN programari_vizita
WHERE grup_turistic.id_grup=vizitator.id_grup AND grup_turistic.id_grup=programari_vizita.id_grup;
#sa se afiseze detalii despre ghizi pentru vizitatori
SELECT DISTINCT ghid.id_ghid, concat(ghid.nume, ' ',ghid.prenume) nume_ghid, limbi_straine_cunoscute, ghid.varsta, grup_turistic.id_grup
FROM vizitator join grup_turistic join ghid
WHERE grup_turistic.id_grup=vizitator.id_grup and grup_turistic.id_ghid=ghid.id_ghid;
##sa se afiseze detaliile tuturor ghizilor, chiar si celor care nu sunt distribuiti unui grup
select  ghid.id_ghid, concat(ghid.nume, ' ',ghid.prenume) nume_ghid, limbi_straine_cunoscute, ghid.varsta, grup_turistic.id_grup
FROM grup_turistic LEFT JOIN ghid 
on grup_turistic.id_ghid=ghid.id_ghid;
#Exemple functii de grup
#Cati vizitatori sunt in fiecare grup
SELECT id_grup, count(*) nr_viztatori
from programari_vizita
group by id_grup;
# Cati angajati din fiecare varsta sunt in centrul turistic, cu varsta de cel putin 25 de ani
select varsta, count(*) nr_angajati
from ghid
group  by varsta
having varsta >=25;
#Cati ghizi au fost angajati in fiecare an, dupa anul 2015, impreuna cu numele complet al acestora 
select year(data_angajare) an_angajare, count(*) nr_angajati, group_concat(concat(nume,' ' , prenume)) lista_angajati
from ghid
group  by an_angajare 
having an_angajare > 2015;

#operatii cu functii predefinite mySQL
#exemplul 1 : Dorim sa afisam id_programare, data programare si tipul turului(daca durata e mai mica de o ora, tipul  turului este scurt, 
#daca este mai mare de o ora, turul este lung, iar daca este mai  mare de 3 ore este foarte lung)
SELECT id_programare,data_programare, IF(durata_tur < '01:00:00','tur scurt',(IF(durata_tur > '03:00:00' , 'tur foarte lung', 'tur lung'))) Tip_Tur
from programari_vizita;

#exemplul 2 : Dorim sa afisam numele obiectivelor tursitice viztate de grupul 7, 8 si 9, afisand pretul aproximat la numar intreg prin adaos
SELECT denumire_obiectiv, programari_vizita.id_grup, ceil(pret_vizita) pret_intreg
FROM obiectiv_turistic inner JOIN programari_vizita
ON  obiectiv_turistic.id_obiectiv=programari_vizita.id_obiectiv
WHERE programari_vizita.id_grup IN (7,8,9);

#exemplul 3: Datele programarilor trebuie amanate cu 15 minute, din cauza unor probleme aparute la centru
#De asemenea, se doreste afisarea datei astfel: 'Abreviated Weekday, Month name in full, Year-4 digits, hour(0-23), minutes(00-59),Seconds(00-59) ;
UPDATE programari_vizita
SET data_programare=date_add(data_programare, interval 15 day_minute);

SELECT 
date_format(data_programare, '%a-%M-%Y / %k:%i:%s') data_programare
from programari_vizita;

#Vrem sa creem un View cu vizitatorii ce au varsta de peste 50 de ani
CREATE VIEW vizitator_in_varsta AS
SELECT CONCAT(nume, ' ', prenume) nume_vizitator, varsta, id_grup
FROM vizitator
WHERE varsta > 50; 

SELECT * FROM  vizitator_in_varsta;

#Dorim sa creem un View care sa cuprinda denumirea, orasul si descrierea obiectivelor turisitice care urmeaza sa fie vizitate.
CREATE VIEW obiective_viitoare AS
SELECT programari_vizita.id_grup, denumire_obiectiv, oras, descriere, data_programare
FROM obiectiv_turistic INNER JOIN programari_vizita
ON obiectiv_turistic.id_obiectiv= programari_vizita.id_obiectiv
WHERE data_programare > NOW();

SELECT * FROM  obiective_viitoare;

#Functii
#Functia 1: Ne propunem sa creem o functie care afiseaza cea mai mica varsta si cea mai mare varsta a angajatilor, pentru
# a afla intervalul de varsta al angajatilor din cadrul centrului turistic

DELIMITER //
CREATE FUNCTION limite_varsta_angajati() RETURNS VARCHAR(100)
BEGIN
DECLARE min_varsta INT;
DECLARE max_varsta INT;
SELECT MIN(varsta), MAX(varsta) INTO min_varsta, max_varsta FROM ghid;
RETURN CONCAT('Cea mai mica varsta este : ', min_varsta, ' , iar cea mai mare este : ' , max_varsta);
END;
//
DELIMITER ;

SELECT limite_varsta_angajati();

#FUNCTIA 2: Functie ce calculeaza vechimea angajatilor(in ani)
DELIMITER //
CREATE FUNCTION vechime_angajat(id_ghid TINYINT) RETURNS INT
BEGIN
DECLARE vechime_angajat INT;
SELECT  (YEAR(curdate())-year(data_angajare)) 
INTO vechime_angajat
FROM ghid
WHERE ghid.id_ghid=id_ghid;
RETURN vechime_angajat; 
END;
//
DELIMITER ;

SELECT vechime_angajat(7);
#Functia 3: Functie ce afiseaza tipul grupei de care apartine un vizitator.
#grupe: 0-18 ani -> minor
# 19-50 ani ->adult
#> 50 ani -> varsta_inaintata

DELIMITER //
CREATE FUNCTION categorie_grupaDeVarsta (id TINYINT) RETURNS VARCHAR(50)
BEGIN
DECLARE varsta_vizitator INT;
DECLARE mesaj VARCHAR(50) DEFAULT null;
SELECT varsta
INTO varsta_vizitator
FROM vizitator
WHERE vizitator.id_vizitator=id;
IF (varsta_vizitator > 0 and varsta_vizitator < 18 ) then
       set mesaj='Minor'; END IF;
IF(varsta_vizitator >= 18 and varsta_vizitator <= 50) then
set mesaj='Adult'; END IF;
IF(varsta_vizitator > 50)  THEN set mesaj='Varsta inaintata';  END IF;
RETURN mesaj;
END;
//
DELIMITER ;

DROP FUNCTION categorie_grupaDeVarsta;
select categorie_grupaDeVarsta(12);

#Proceduri
#Procedura 1:Se doreste a se crea o procedura care sa afiseze numele si prenumele concantenat si limbile cunoscute de catre un angajat al centrului, in functie de id. 
#Sa se salveze in parametrii de iesire aceste doua detalii. 

DELIMITER //
CREATE PROCEDURE detalii_ghid( IN id TINYINT, OUT nume_complet varchar(150), OUT  limbi_cunoscute varchar(150))
BEGIN
SELECT CONCAT(ghid.nume, ' ', ghid. prenume) , limbi_straine_cunoscute
INTO nume_complet, limbi_cunoscute
FROM ghid
WHERE ghid.id_ghid= id;
END;
//
DELIMITER ;

CALL detalii_ghid(5 , @n,@l);
SELECT @n nume_ghid, @l limbi_cunoscute;

#Procedura 2: Procedura care afiseaza momentul zilei in care are loc vizita.
#if-uri dupa ora;
DELIMITER //
CREATE PROCEDURE momentul_zilei
(
IN id TINYINT,
OUT mesaj VARCHAR(50),
OUT data_prog datetime
)
BEGIN
SELECT programari_vizita.data_programare
INTO data_prog
FROM programari_vizita
where programari_vizita.id_programare=id;

if(hour(data_prog) >= '05' and hour(data_prog) < '11')
then set mesaj='Dimineata'; end if;
if(hour(data_prog) >= '11' and hour(data_prog) < '14')
then set mesaj='Pranz'; end if;
if(hour(data_prog) >= '14' and hour(data_prog) < '17')
then set mesaj='Dupa-amiaza'; end if;
if(hour(data_prog) > '17')
then set mesaj='Seara'; end if;
end;
//
delimiter ;

call momentul_zilei(8,@m,@d);
SELECT @m momentul_zilei;

#Procedura 3: O procedura care sa afiseze pretul mediu al tutoror obiectivelor turistice, dar si denumirea obiectivelor din baza de date.
DELIMITER //
CREATE PROCEDURE detalii_obiective 
(
OUT denumire VARCHAR(500),
OUT pret_mediu float
)
begin
select group_concat(denumire_obiectiv), avg(pret_vizita)
INTO denumire, pret_mediu
FROM obiectiv_turistic;
end;
//
delimiter ;

CALL detalii_obiective(@d,@p);
SELECT @p pretul_mediu, @d denumire;

#Cursori in cadrul rutinelor
#Rutina si cursor 1: O functie care salveaza intr-un cursor datele unui vizitator
#(are ca parametru de intrare id-ul acestuia), iar atunci cand parcurge cursorul sa
#adauge(prin concatenare) in dreptul numelui daca primeste sau nu reducere, 
#in functie de varsta ( daca <= 18 ani -> reducere de student de 30%, daca
# are peste 50 de ani, reducere de 15%). Acesta sa returneze o lista cu numele si 
#reducerile aferente.
DELIMITER //
CREATE FUNCTION vizitatori_reducere(id_vizitator TINYINT) RETURNS VARCHAR(1000)
BEGIN
DECLARE varsta_c INT;
DECLARE idGrup_c TINYINT;
DECLARE idViz_c TINYINT;
DECLARE nume_complet VARCHAR(150);
DECLARE nume_si_reduceri VARCHAR(150);
DECLARE lista_nume_si_reduceri  VARCHAR(1000);
DECLARE ok BOOLEAN DEFAULT 1;
DECLARE cursor_reduceri cursor for
     select id_vizitator, CONCAT(nume, ' ', prenume), varsta, id_grup
     FROM vizitator
     where vizitator.id_vizitator=id_vizitator;     
declare continue handler for not found set ok=0;
open cursor_reduceri;
reduceri:LOOP 
             FETCH cursor_reduceri INTO idViz_c, nume_complet, varsta_c, idGrup_c;
	if ok=0 then 
               LEAVE reduceri;
	else 
        if(varsta_c <=18) THEN set nume_si_reduceri=CONCAT(nume_complet, ' reducere de 20%');
            else if (varsta_c >=50) then set nume_si_reduceri=CONCAT(nume_complet,' reducere de 15%');
		end if;
		   set lista_nume_si_reduceri=CONCAT_WS('/',lista_nume_si_reduceri, nume_si_reduceri);
		end if;
    end if;
end loop reduceri;
return lista_nume_si_reduceri;
END;
// 
DELIMITER ;

select vizitatori_reducere(11);

#Cursor si rutina 2: O functie care primeste ca parametru un pret maxim si
#contine un cursor in care se salveaza detalii asupra obiectivelor care au pretul
#vizitelor mai mic decat pretul (maxim) trimis ca parametru si le concateneaza intr-o lista.
DELIMITER //
CREATE FUNCTION obiective_pret_maxim(pret_maxim FLOAT) RETURNS VARCHAR(1000)
BEGIN
DECLARE idOb_c TINYINT;
DECLARE denumire_c VARCHAR(150);
DECLARE adresa_c VARCHAR(500);
DECLARE pret_vizita_C FLOAT;
declare obiective VARCHAR(150);
DECLARE lista_obiective VARCHAR(1000);
DECLARE ok BOOLEAN DEFAULT 1;
DECLARE obiective_cursor  cursor FOR
    SELECT id_obiectiv, denumire_obiectiv, adresa, pret_vizita
    FROM obiectiv_turistic
    WHERE obiectiv_turistic.pret_vizita <= pret_maxim;
declare continue handler for not found set ok=0;
open obiective_cursor;
obiective: loop
   fetch obiective_cursor into idOb_c, denumire_c, adresa_c, pret_vizita_c;
   if ok=0 then leave obiective;
   else set obiective=CONCAT(denumire_c, ' are adresa ',  adresa_c, ' si pretul  accesibil de ', pret_vizita_c);
		set lista_obiective=CONCAT_WS('/', lista_obiective,obiective);
   end if;
end loop obiective;
close obiective_cursor;
return lista_obiective;
END;
//
DELIMITER ;
drop function obiective_pret_maxim;
select obiective_pret_maxim(10) detalii_obiective;
#Cursor si rutina 3: Dorim sa creem o noua tabela cu programari viitoare si
#sa o populam cu date dintr-un cursor intr-o procedura.

CREATE TABLE if not exists programari_viitoare
(
id_programare tinyint not null auto_increment,
data_programare datetime,
durata_tur TIME,
id_grup tinyint not null,
id_obiectiv tinyint not null,
primary key(id_programare),
foreign key(id_grup)references grup_turistic(id_grup),
foreign key(id_obiectiv) references obiectiv_turistic(id_obiectiv)
);

DELIMITER //
CREATE PROCEDURE populeaza_progrViit()
BEGIN
declare data_programare_c datetime;
declare durata_tur_c time;
declare id_grup_c tinyint;
declare id_obiectiv_c tinyint;
declare ok boolean default 1;
declare cursor_progrViit  CURSOR for 
      select data_programare, durata_tur, id_grup, id_obiectiv
      from programari_vizita
      where data_programare > NOW();
declare continue handler for not found set ok = 0;
open cursor_progrViit;
viit:loop
fetch cursor_progrViit into data_programare_c, durata_tur_c, id_grup_c,id_obiectiv_c;
      if ok = 0 then leave viit;
      else insert into programari_viitoare values(null, data_programare_c, durata_tur_c, id_grup_c,id_obiectiv_c);
  end if;
  end loop viit;
close cursor_progrViit;
END;
//
DELIMITER ;

call populeaza_progrViit();
select * from programari_viitoare;

#Triggeri
#Exemplu trigger 1: Sa se construiasca un trigger de tip before insert pentru
#care sa verifice daca numarul maxim de persoane din grupul turistic
#in care urmeaza sa se adauge o inregistrare este depasit sau nu;
DELIMITER //
CREATE TRIGGER bi_vizitator before insert 
on vizitator for each row
begin
      if (select count(*) from vizitator join grup_turistic on grup_turistic.id_grup=vizitator.id_grup) >= (select nr_maxim_persoane 
											                                                              from grup_turistic join vizitator
																										  on grup_turistic.id_grup=vizitator.id_grup)
	 then signal sqlstate '45000' set message_text='Nr persoane maxim depasit';
     end if;
                                             
end;
//
delimiter ;

UPDATE grup_turistic
SET nr_maxim_persoane=2 WHERE id_grup=1;

INSERT INTO vizitator VALUES(null, 'Popescu','Mariana',23,1);


#Exemplu trigger 2:Sa se realizeze un trigger before insert pentru tabela
#ghid, avand drept conditie ca varsta angajatilor sa fie 
#cel putin de 18 ani;
delimiter //
CREATE TRIGGER bi_ghid before insert
on ghid for each row
begin   
    if new.varsta < 18 then signal sqlstate '45000' set message_text='Limita minima de varsta este de 18 ani!';
end if;
end;
//
delimiter ;
insert into ghid values(null,'Ionescu','Maria',curdate(),'japoneza, engleza',17);
#Exemplu trigger 3: Sa se creeze un after insert trigger pentru a introduce intr-o 
#noua tabela persoanele angajate in ziua curenta 
CREATE TABLE if not exists Ghid_nou
(
id_ghid tinyint not null auto_increment,
nume varchar(50),
prenume varchar(50),
data_angajare date,
limbi_straine_cunoscute varchar(150),
varsta int,
PRIMARY KEY(id_ghid)
);
insert into ghid values(null,'Ionescu','Dorin',curdate(),'japoneza, engleza,franceza',19),
                       (null,'Pletea','Daria',curdate(),'japoneza, engleza,franceza',34),
                       (null,'Amarii','Darius',curdate(),'japoneza, germana,engleza',34);
DELIMITER //
CREATE TRIGGER ai_ghid after insert 
on ghid for each row
begin
    insert into Ghid_nou values(new.id_ghid,new.nume,new.prenume,new.data_angajare, new.limbi_straine_cunoscute,new.varsta);
end;
//
delimiter ;
drop trigger ai_ghid;
select * from ghid;
select * from Ghid_nou;
