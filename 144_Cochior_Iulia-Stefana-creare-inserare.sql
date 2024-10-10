CREATE SEQUENCE ID_SEQ START WITH 1022; 
CREATE SEQUENCE ID_Departament_SEQ START WITH 1; 
CREATE SEQUENCE ID_Camera_SEQ START WITH 100; 
CREATE SEQUENCE ID_Resursa_SEQ START WITH 1; 
CREATE SEQUENCE ID_Aprovizionare_SEQ START WITH 1; 
CREATE SEQUENCE ID_Consumatie_SEQ START WITH 1; 
CREATE SEQUENCE ID_Misiune_SEQ START WITH 1;
CREATE SEQUENCE ID_Echipament_SEQ START WITH 344;


CREATE TABLE Oameni(
    ID INT DEFAULT ID_SEQ.NEXTVAL PRIMARY KEY,
    Prenume VARCHAR(20),
    Nume VARCHAR(20),
    Varsta INT,
    Fericire  VARCHAR(6)
);

INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Rachel', 'Day', 24, '75%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Randy', 'Walker', 47, '77%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Ashley', 'Graham', 33, '67%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Teresa', 'Martin', 29, '69%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES( 'Jack', 'Sutton', 43, '73%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Angela', 'West', 40, '70%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Daniel', 'Saubers', 25, '90%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Alan', 'Smith', 27, '85%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Ethan', 'Browm', 30, '80%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Ava', 'Davis', 26, '91%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Emma', 'Brown', 22, '87%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Liam', 'Anderson', 35, '80%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Lottie', 'Caprice', 12, '98%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Marian', 'Martescu', 37, '81%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Lester', 'Anderson', 56, '77%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Holly', 'Jefferson', 36, '89%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Clementine', 'Barny', 24, '78%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Pamela', 'Albine', 28, '87%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Xenon', 'Lee Park', 31, '85%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Darian', 'Constance', 33, '70%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Andreea', 'Stan', 25, '90%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Alexandru', 'Dumitru', 30, '85%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Radu', 'Wilson', 29, '80%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Noah', 'Davis', 27, '92%');
INSERT INTO Oameni(Prenume, Nume, Varsta, Fericire) VALUES('Ella', 'Brooks', 26, '90%');


SELECT *
FROM Oameni;

CREATE TABLE Departamente(
    ID_Departament INT DEFAULT ID_Departament_SEQ.NEXTVAL PRIMARY KEY,
    Nume VARCHAR(20),
    ID_Sef INT,
    FOREIGN Key(ID_Sef) REFERENCES Oameni(ID)
);

INSERT INTO Departamente(Nume, ID_Sef) VALUES('Tratarea Apei', 1023);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Generare Electrica', 1025);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Cantina', 1026);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Securitate', 1029);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Medical', 1033);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Provizii', 1027);
INSERT INTO Departamente(Nume, ID_Sef) VALUES('Misiuni', 1044);

SELECT *
FROM Departamente;

CREATE TABLE Camere (
    ID_Camera INT DEFAULT ID_Camera_SEQ.NEXTVAL PRIMARY KEY,
    Nume VARCHAR(50),
    Capacitate INT,
    ID_Departament INT,
    FOREIGN KEY (ID_Departament) REFERENCES Departamente(ID_Departament)
);

INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Controlul Calitatii', 3, 1);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Centru de Distribuire', 10, 1);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Camera de Filtrare', 4, 1);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Depozitare Combustibil', 3, 2);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Panou de Electricitate', 10, 2);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Generator de Urgenta', 5, 2);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Bucatarie', 10, 3);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Sala de Mese', 4, 3);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Depozit de Mancare', 5, 3);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Supraveghere Video', 3, 4);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Control de securitate', 5, 4);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Farmacie', 2, 5);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Camera de Examinare', 2, 5);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Camera de Urgente', 2, 5);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Inventar', 5, 6);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Distribuire', 5, 6);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Comenzi si Livrari', 10, 6);
INSERT INTO Camere(Nume, Capacitate, ID_Departament) VALUES('Planificare Misiuni', 10, 7);

SELECT *
FROM Camere;

CREATE TABLE Resurse(
    ID_Resursa INT DEFAULT ID_Resursa_SEQ.NEXTVAL PRIMARY KEY,
    Nume VARCHAR(20),
    Stoc INT,
    Unitate_de_masura VARCHAR(20)
);

INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Conserve', 200, 'cutii');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Apa', 500, 'bidoane');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Trusa de prim ajutor', 10, 'truse');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Medicamente', 50, 'sticle');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Saci de dormit', 30, 'bucati        ');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Extinctoare', 5, 'bucati');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Masca de gaze', 15, 'masti');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Baterii', 200, 'pachete');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Combustibil', 500, 'canistre');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Produse de curatenie', 100, 'bucati');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Hartie igienica', 200, 'role');
INSERT INTO Resurse(Nume, Stoc, Unitate_de_masura) VALUES('Saci menajeri', 70, 'role');

SELECT *
FROM Resurse;

CREATE TABLE Distributie_Camere (
    ID_Persoana INT,
    ID_Camera INT,
    PRIMARY KEY (ID_Persoana, ID_Camera),
    FOREIGN KEY (ID_Persoana) REFERENCES Oameni(ID),
    FOREIGN KEY (ID_Camera) REFERENCES Camere(ID_Camera)
);

INSERT INTO Distributie_Camere VALUES(1029, 110);
INSERT INTO Distributie_Camere VALUES(1030, 101);
INSERT INTO Distributie_Camere VALUES(1025, 104);
INSERT INTO Distributie_Camere VALUES(1023, 100);
INSERT INTO Distributie_Camere VALUES(1032, 108);
INSERT INTO Distributie_Camere VALUES(1028, 105);
INSERT INTO Distributie_Camere VALUES(1026, 106);
INSERT INTO Distributie_Camere VALUES(1037, 107);
INSERT INTO Distributie_Camere VALUES(1034, 111);
INSERT INTO Distributie_Camere VALUES(1022, 109);
INSERT INTO Distributie_Camere VALUES(1024, 110);
INSERT INTO Distributie_Camere VALUES(1031, 112);
INSERT INTO Distributie_Camere VALUES(1033, 113);
INSERT INTO Distributie_Camere VALUES(1035, 114);
INSERT INTO Distributie_Camere VALUES(1036, 115);
INSERT INTO Distributie_Camere VALUES(1027, 116);
INSERT INTO Distributie_Camere VALUES(1039, 102);
INSERT INTO Distributie_Camere VALUES(1040, 103);
INSERT INTO Distributie_Camere VALUES(1041, 115);
INSERT INTO Distributie_Camere VALUES(1038, 101);
INSERT INTO Distributie_Camere VALUES(1042, 117);
INSERT INTO Distributie_Camere VALUES(1043, 117);
INSERT INTO Distributie_Camere VALUES(1044, 117);
INSERT INTO Distributie_Camere VALUES(1045, 117);
INSERT INTO Distributie_Camere VALUES(1046, 117);

SELECT *
FROM Distributie_Camere;

CREATE TABLE Aprovizionare(
    ID_Aprovizionare INT DEFAULT ID_Aprovizionare_SEQ.NEXTVAL PRIMARY KEY,
    ID_Resursa INT,
    Cantitate INT, 
    Data_aprovizionare VARCHAR(20),
    FOREIGN KEY(ID_Resursa) REFERENCES Resurse(ID_Resursa)
);

INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(1, 100, '20.08.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(7, 30, '01.08.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(9, 50, '17.09.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(11, 100, '21.09.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(4, 50, '05.10.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(1, 44, '02.08.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(1, 25, '07.11.2089');
INSERT INTO Aprovizionare(ID_Resursa, Cantitate, Data_Aprovizionare) VALUES(2, 100, '07.12.2089');

SELECT *
FROM Aprovizionare;

CREATE TABLE Consumatie(
    ID_Consumatie INT DEFAULT ID_Consumatie_SEQ.NEXTVAL PRIMARY KEY,
    ID_Resursa INT,
    Cantitate INT, 
    Data_consumatie VARCHAR(20),
    ID_Departament INT,
    FOREIGN KEY(ID_Resursa) REFERENCES Resurse(ID_Resursa),
    FOREIGN KEY(ID_Departament) REFERENCES Departamente(ID_Departament)
);

INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(2, 50, '06.10.2089', 2);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(1, 25, '13.09.2089', 3);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(4, 11, '21.08.2089', 5);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(5, 18, '15.09.2089', 1);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(7, 23, '28.08.2089', 4);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(5, 40, '25.08.2081', 4);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(1, 2, '02.04.2082', 1);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(7, 20, '29.01.2084', 2);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(1, 80, '31.10.2089', 3);
INSERT INTO Consumatie(ID_Resursa, Cantitate, Data_Consumatie, ID_Departament) VALUES(2, 60, '29.03.2089', 2);

SELECT *
FROM Consumatie;

CREATE TABLE Misiuni(
    ID_Misiune INT DEFAULT ID_Misiune_SEQ.NEXTVAL PRIMARY KEY,
    ID_Lider INT,
    Nume_Misiune VARCHAR(50),
    Data_Plecare VARCHAR(20),
    Data_Intoarcere VARCHAR(20),
    Scop VARCHAR(3000),
    Rezultate VARCHAR(3000),
    FOREIGN KEY(ID_Lider) REFERENCES Oameni(ID)  
);

INSERT INTO Misiuni(ID_Lider, Nume_Misiune, Data_Plecare, Data_Intoarcere, Scop, Rezultate) VALUES
                    (1046, 'Explorare si Cartografiere', '17.08.2089', '20.08.2089',
                    'Explorarea unei zone necunoscute în afara buncarului pentru a cartografia terenul si a descoperi potentiale resurse',
                    'Zona cartografiata cu succes; descoperite noi surse de apa si vegetatie comestibila');
INSERT INTO Misiuni(ID_Lider, Nume_Misiune, Data_Plecare, Data_Intoarcere, Scop, Rezultate) VALUES
                    (1044, 'Recunoastere rute de evacuare', '21.09.2087', '22.09.2087', 
                    'Identificarea si evaluarea posibilelor rute de evacuare în caz de urgenta, asigurand ca sunt sigure ai accesibile',
                    'Doua rute de evacuare sigure identificate; rutele marcate si integrate in planul de urgenta al buncarului');
INSERT INTO Misiuni(ID_Lider, Nume_Misiune, Data_Plecare, Data_Intoarcere, Scop, Rezultate) VALUES
                   (1043, 'Contact cu alte comunitati', '09.11.2090', '20.11.2090',
                   'Gasirea de alte comunitati de supravietuitori pentru a face schimb de resurse si informatii',
                   'Comunitate gasita la 100 km distanta; planificat un schimb de resurse');
INSERT INTO Misiuni(ID_Lider, Nume_Misiune, Data_Plecare, Data_Intoarcere, Scop, Rezultate) VALUES
                   (1045, 'Recuperare resurse', '15.10.2088', '16.10.2088', 
                   'Recuperarea de provizii si resurse dintr-o cladire abandonata aflata la cativa kilometri de buncar',
                   'Recuperate provizii medicale si alimente conservate suficiente pentru o luna');
INSERT INTO Misiuni(ID_Lider, Nume_Misiune, Data_Plecare, Data_Intoarcere, Scop, Rezultate) VALUES
                   (1042, 'Instalare statii monitorizare', '23.11.2083', '25.11.2083', 
                   'Instalarea unor statii de monitorizare a radiatiilor si a conditiilor atmosferice la diferite distante de buncar',
                   'Patru statii de monitorizare instalate si functionale; primele date transmise sunt conforme cu asteptarile');

SELECT * FROM Misiuni;

CREATE TABLE Participare_Misiuni(
    ID_Misiune INT,
    ID_Persoana INT,
    PRIMARY KEY (ID_Misiune, ID_Persoana),
    FOREIGN KEY (ID_Persoana) REFERENCES Oameni(ID),
    FOREIGN KEY (ID_Misiune) REFERENCES Misiuni(ID_Misiune)
);

INSERT INTO Participare_Misiuni VALUES(1, 1046);
INSERT INTO Participare_Misiuni VALUES(1, 1045);
INSERT INTO Participare_Misiuni VALUES(2, 1044);
INSERT INTO Participare_Misiuni VALUES(2, 1042);
INSERT INTO Participare_Misiuni VALUES(3, 1045);
INSERT INTO Participare_Misiuni VALUES(3, 1043);
INSERT INTO Participare_Misiuni VALUES(3, 1042);
INSERT INTO Participare_Misiuni VALUES(4, 1045);
INSERT INTO Participare_Misiuni VALUES(4, 1044);
INSERT INTO Participare_Misiuni VALUES(5, 1042);
INSERT INTO Participare_Misiuni VALUES(5, 1043);
INSERT INTO Participare_Misiuni VALUES(5, 1046);

SELECT * FROM Participare_Misiuni;

CREATE TABLE Sanatate(
    ID_Persoana INT PRIMARY KEY,
    Istoric_Medical VARCHAR(3000),
    Stare_Actuala VARCHAR(1000),
    Tratamente_Actuale VARCHAR(1000),
    Ultimul_Control VARCHAR(20),
    FOREIGN KEY (ID_Persoana) REFERENCES Oameni(ID)
);

INSERT INTO Sanatate (ID_Persoana, Istoric_Medical, Stare_Actuala, Tratamente_Actuale, Ultimul_Control) 
              VALUES (1022, 'Nicio afectiune anterioara', 'Diabet zaharat tip 2', 'Insulina, Metformina', '05.07.2089');
INSERT INTO Sanatate (ID_Persoana, Istoric_Medical, Stare_Actuala, Tratamente_Actuale, Ultimul_Control) 
              VALUES (1033, 'Nicio afectiune anterioara', 'Sanatos', 'N/A', '01.08.2089');
INSERT INTO Sanatate (ID_Persoana, Istoric_Medical, Stare_Actuala, Tratamente_Actuale, Ultimul_Control) 
              VALUES (1037, 'Hipertensiune arteriala, Insuficienta renala', 'Osteoporoza, Insuficienta renala cronica', 'Suplimente de calciu, Dializa periodica', '20.07.2089');
INSERT INTO Sanatate (ID_Persoana, Istoric_Medical, Stare_Actuala, Tratamente_Actuale, Ultimul_Control) 
              VALUES (1044, 'Nicio afectiune anterioara', 'Depresie majora', 'Antidepresive', '25.06.2089');
INSERT INTO Sanatate (ID_Persoana, Istoric_Medical, Stare_Actuala, Tratamente_Actuale, Ultimul_Control) 
              VALUES (1025, 'Nicio afectiune anterioara', 'Migrene cronice', 'Medicamente anti-migrena', '03.07.2089');


SELECT * FROM Sanatate;

CREATE TABLE Instruire(
    ID_Curs INT PRIMARY KEY,
    Nume_Curs VARCHAR(100),
    Descriere VARCHAR(1000),
    Data_Incepere VARCHAR(20),
    Data_Finalizare VARCHAR(20),
    ID_Departament INT,
    FOREIGN KEY (ID_DEpartament) REFERENCES Departamente(ID_Departament)
);

INSERT INTO Instruire VALUES(1, 'Prim Ajutor', 
                            'Curs intensiv pentru acordarea primului ajutor în caz de accidente si urgente medicale.', 
                            '01.06.2089', '05.06.2089', 5);
INSERT INTO Instruire VALUES (2, 'Gestionare Stocuri', 
                             'Curs dedicat gestionãrii eficiente a stocurilor de resurse esentiale în buncãr.',
                             '10.07.2089', '15.07.2089', 6);
INSERT INTO Instruire VALUES (3, 'Securitate Informaticã', 
                             'Instruire privind protectia sistemelor informatice si a datelor în buncãr.', 
                             '01.08.2088', '07.08.2088', 4);
INSERT INTO Instruire VALUES (4, 'Supravietuire in Medii Extreme', 
                             'Curs de pregatire pentru supravietuirea in conditii extreme, atat in buncar cat si in afara acestuia', 
                             '01.09.2089', '10.09.2089', 7);
INSERT INTO Instruire VALUES (5, 'Leadership în Situatii de Criza', 'Curs avansat de leadership dedicat gestionarii situatiilor de criza si coordonarii echipelor', 
                             '01.10.2089', '07.10.2089', 7);


SELECT * FROM Instruire;

CREATE TABLE Echipament(
    ID_Echipament INT DEFAULT ID_Echipament_SEQ.NEXTVAL PRIMARY KEY,
    Nume_Echipament VARCHAR(32),
    Tip_Echipament VARCHAR(32),
    Stare VARCHAR(20),
    ID_Departament INT,
    Ultima_Revizie VARCHAR(20),
    FOREIGN KEY (ID_Departament) REFERENCES Departamente(ID_Departament)
);

INSERT INTO Echipament(Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Defibrillator', 'Medical', 'Functional', 5, '20.02.2086');
INSERT INTO Echipament(Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Generator', 'Tehnic', 'Necesita intretinere', 2, '07.04.2081');
INSERT INTO Echipament(Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Statie Radio', 'Comunicatii', 'Functional', 4, '19.03.2088');
INSERT INTO Echipament(Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Kit de prim ajutor', 'Salvare', 'Functional', 5, '25.11.2089');
INSERT INTO Echipament (Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Costum de protectie chimica', 'Protectie Personala', 'Functional', 5, '01.04.2088');
INSERT INTO Echipament (Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Masina', 'Deplasare', 'Functional', 7, '19.04.2088');
INSERT INTO Echipament (Nume_Echipament, Tip_Echipament, Stare, ID_Departament, Ultima_Revizie)
               VALUES ('Pistol Glock 17', 'Protectie Personala', 'Functional', 7, '01.05.2089');


SELECT * FROM Echipament;


SELECT ID_Misiune_SEQ.CURRVAL FROM dual;

DROP SEQUENCE ID_Misiune_SEQ;
CREATE SEQUENCE ID_Misiune_SEQ START WITH 3;

DELETE FROM Misiuni WHERE ID_Lider > 0;



DESCRIBE Participare_Misiuni;

