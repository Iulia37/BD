--EX 13------------

--Actualizarea coloanei Capacitate din tabelul CAMERE pentru camerele care apartin 
--unui departament al carui sef are fericirea > 80%. Capacitatea va creste cu 2 oameni.

UPDATE Camere
SET Capacitate = Capacitate + 2
WHERE ID_Departament IN (
    SELECT d.ID_Departament
    FROM Departamente d
    JOIN Oameni o ON d.ID_Sef = o.ID
    WHERE o.Fericire > '80%'
);

--Stergerea înregistrarilor din tabelul CONSUMATIE pentru consumatiile mai vechi de anul 2085  

DELETE FROM Consumatie
WHERE ID_Consumatie IN (
    SELECT c.ID_Consumatie
    FROM Consumatie c
    WHERE TO_NUMBER(SUBSTR(c.Data_consumatie, 7, 4)) < 2085
);

--Cresterea stoculul cu 20 de unitati pentru resursele care au fost si aprovizionate si consumate macar odata 

UPDATE Resurse r
SET r.Stoc = r.Stoc + 20
WHERE r.ID_Resursa IN (
    SELECT a.ID_Resursa
    FROM Aprovizionare a
    JOIN Consumatie c ON a.ID_Resursa = c.ID_Resursa
    GROUP BY a.ID_Resursa
    HAVING COUNT(a.ID_Aprovizionare) > 0 AND COUNT(c.ID_Consumatie) > 0
);


--EX 12-------------------------------------------------------------------------
--Gasiti toate resursele care au fost aprovizionate si consumate de cel putin doua ori, 
--si au o cantitate totala mai mare de 100. Se va afisa id – ul resursei, numele si cantitatea

SELECT ID_Resursa, r.Nume, r.Stoc
FROM Resurse r
WHERE r.ID_Resursa IN (
    SELECT a.ID_Resursa
    FROM Aprovizionare a
    JOIN Consumatie c ON a.ID_Resursa = c.ID_Resursa
    JOIN Resurse r2 ON r2.ID_Resursa = a.ID_Resursa
    GROUP BY a.ID_Resursa
    HAVING COUNT(a.ID_Aprovizionare) >= 2 AND COUNT(c.ID_Consumatie) >= 2
) AND r.Stoc > 100;


--Gasiti resursele care au fost aprovizionate de cel putin trei ori si consumatiile lor asociate. 
--Se vor afita numele resursei, stocul disponibil precum si consumatiile totale

SELECT r.Nume, r.Stoc, NVL(sub.ConsumuriTotale, 0) AS ConsumuriTotale
FROM Resurse r
JOIN (
    SELECT ID_Resursa, SUM(Cantitate) AS ConsumuriTotale
    FROM Consumatie
    GROUP BY ID_Resursa
) sub ON r.ID_Resursa = sub.ID_Resursa
WHERE r.ID_Resursa IN (
    SELECT ID_Resursa
    FROM Aprovizionare
    GROUP BY ID_Resursa
    HAVING COUNT(ID_Aprovizionare) >= 3
);

--Gasiti departamentele care au aprovizionat resurse în anul 2089 
--si totalul resurselor consumate este mai mare de 100, precizand si numarul de resurse.

SELECT d.Nume, COUNT(DISTINCT c.ID_Resursa) AS nr_Resurse, SUM(c.Cantitate) AS TotalConsum
FROM Departamente d
JOIN Consumatie c ON d.ID_Departament = c.ID_Departament
JOIN Resurse r ON c.ID_Resursa = r.ID_Resursa
WHERE c.ID_Resursa IN (
    SELECT ID_Resursa
    FROM Aprovizionare
    WHERE TO_NUMBER(SUBSTR(c.Data_consumatie, 7, 4)) = 2089
)
GROUP BY d.Nume
HAVING SUM(c.Cantitate) > 100;

--Listati resursele si cantitatea lor, înlocuind cantitatile nule cu 0
--si clasificand resursele in functie de cantitate ("Scazut", "Mediu", "Ridicat"). 

SELECT r.Nume,  
       NVL(r.Stoc, 0) AS Cantitate,  
       DECODE( 
           CASE  
               WHEN NVL(r.Stoc, 0) <= 10 THEN 'Scãzut' 
               WHEN NVL(r.Stoc, 0) <= 50 THEN 'Mediu' 
               ELSE 'Ridicat' 
           END, 'Scãzut', 'Scãzut', 'Mediu', 'Mediu', 'Ridicat', 'Ridicat' 
       ) AS Clasificare 
FROM Resurse r 
ORDER BY Cantitate DESC; 

--Selectati numele fiecarei resurse, un prefix format din primele trei caractere ale numelui, 
--numele resursei in majuscule, lungimea numelui resursei, data ultimei aprovizionari formatata în formatul 'DD/MM/YYYY', 
--si clasificarea cantitatii totale consumate pentru resursa 

WITH RecentAprovizionare AS (
    SELECT ID_Resursa, MAX(Data_Aprovizionare) AS Ultima_Aprovizionare
    FROM Aprovizionare
    GROUP BY ID_Resursa
),
TotalConsum AS (
    SELECT c.ID_Resursa, SUM(c.Cantitate) AS Total_Cantitate
    FROM Consumatie c
    JOIN RecentAprovizionare ra ON c.ID_Resursa = ra.ID_Resursa
    GROUP BY c.ID_Resursa
)
SELECT 
    r.Nume,
    SUBSTR(r.Nume, 1, 3) AS Prefix_Nume,
    UPPER(r.Nume) AS Nume_Majuscule,
    LENGTH(r.Nume) AS Lungime_Nume,
    TO_CHAR(TO_DATE(a.Data_Aprovizionare, 'DD.MM.YYYY'), 'DD/MM/YYYY') AS Data_Formatata,
    CASE
        WHEN NVL(t.Total_Cantitate, 0) <= 10 THEN 'Scãzut'
        WHEN NVL(t.Total_Cantitate, 0) <= 50 THEN 'Mediu'
        ELSE 'Ridicat'
    END AS Clasificare_Cantitate
FROM 
    Resurse r
LEFT JOIN 
    TotalConsum t ON r.ID_Resursa = t.ID_Resursa
LEFT JOIN 
    RecentAprovizionare ra ON ra.ID_Resursa = r.ID_Resursa
LEFT JOIN 
    Aprovizionare a ON a.ID_Resursa = ra.ID_Resursa AND a.Data_Aprovizionare = ra.Ultima_Aprovizionare;



---ex primit la prezentare
SELECT 
    d.ID_Departament,
    d.ID_Sef,
    COUNT(c.ID_Camera) AS Nr_Camere
FROM 
    DEPARTAMENTE d
LEFT JOIN 
    CAMERE c ON d.ID_Departament = c.ID_Departament
GROUP BY 
    d.ID_Departament, d.ID_Sef;


--EX 14-------------------------------------------------------------------------

CREATE VIEW Sanatate_Departamente AS
SELECT 
    D.ID_Departament,
    D.Nume,
    COUNT(CASE WHEN S.Stare_Actuala <> 'Sanatos' THEN O.ID ELSE NULL END) AS Oameni_Nesanatosi,
    COUNT(O.ID) AS Total_Oameni,
    (CAST(COUNT(CASE WHEN S.Stare_Actuala <> 'Sanatos' THEN O.ID ELSE NULL END) AS FLOAT) / COUNT(O.ID)) * 100 AS Procentaj_Nesanatosi
FROM 
    Departamente D
JOIN 
    Camere C ON D.ID_Departament = C.ID_Departament
JOIN 
    Distributie_Camere DC ON C.ID_Camera = DC.ID_Camera
JOIN 
    Oameni O ON DC.ID_Persoana = O.ID
JOIN 
    Sanatate S ON O.ID = S.ID_Persoana
GROUP BY 
    D.ID_Departament, D.Nume;
    
SELECT * FROM Sanatate_Departamente;

--operatie LMD permisa

SELECT * FROM Sanatate_Departamente WHERE Procentaj_Nesanatosi > 50;

--operatie LMD nepermisa

UPDATE Sanatate_Departamente
SET Nume = 'Expeditii'
WHERE ID_Departament = 7;


--EX 15-------------------------------------------------------------------------

--OUTER JOIN pe minim 4 tabele

SELECT 
    O.Nume,
    O.Prenume,
    S.Stare_Actuala,
    D.Nume,
    C.ID_Camera,
    C.Nume
FROM 
    Camere C
LEFT OUTER JOIN Distributie_Camere DC ON C.ID_Camera = DC.ID_Camera
LEFT OUTER JOIN Oameni O ON DC.ID_Persoana = O.ID
LEFT OUTER JOIN Sanatate S ON S.ID_Persoana = O.ID
LEFT OUTER JOIN Departamente D ON C.ID_Departament = D.ID_Departament;


--DIVISION
--selecteaza oamenii care au participat in toate misiunile

SELECT 
    O.ID, 
    O.Nume, 
    O.Prenume
FROM 
    Oameni O
WHERE NOT EXISTS (
    SELECT M.ID_Misiune
    FROM Misiuni M
    WHERE NOT EXISTS (
        SELECT PM.ID_Misiune
        FROM Participare_Misiuni PM
        WHERE PM.ID_Misiune = M.ID_Misiune
          AND PM.ID_Persoana = O.ID
    )
);

--TOP-N
--selecteaza top 3 misiuni in care au participat cei mai multi oameni

SELECT 
    Nume_Misiune,
    Nr_Participanti
FROM 
    (SELECT 
         M.Nume_Misiune,
         COUNT(PM.ID_Persoana) AS Nr_Participanti
     FROM 
         Misiuni M
     JOIN 
         Participare_Misiuni PM ON M.ID_Misiune = PM.ID_Misiune
     GROUP BY 
         M.Nume_Misiune
     ORDER BY 
         Nr_Participanti DESC
    )
WHERE 
    ROWNUM <= 3;
    
    
--EX 16-------------------------------------------------------------------------
--numele oamenilor care au participat in misiuni care au durat mai mult de o zi
SELECT DISTINCT 
    O.Nume,
    O.Prenume
FROM 
    Oameni O
WHERE O.ID IN (
    SELECT PM.ID_Persoana
    FROM Participare_Misiuni PM
    JOIN Misiuni M ON PM.ID_Misiune = M.ID_Misiune
    WHERE TO_DATE(M.Data_Intoarcere, 'dd-mm-yyyy') - TO_DATE(M.Data_Plecare, 'dd-mm-yyyy') >= 2
);

--cererea optimizata
WITH Misiuni_Lungi AS (
    SELECT 
        PM.ID_Persoana
    FROM 
        Participare_Misiuni PM
    JOIN 
        Misiuni M ON PM.ID_Misiune = M.ID_Misiune
    WHERE 
        TO_DATE(M.Data_Intoarcere, 'dd-mm-yyyy') - TO_DATE(M.Data_Plecare, 'dd-mm-yyyy') >= 2
)
SELECT DISTINCT 
    O.Nume,
    O.Prenume
FROM 
    Oameni O
JOIN 
    Misiuni_Lungi ML ON O.ID = ML.ID_Persoana;






