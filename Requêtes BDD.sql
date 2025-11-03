-- requêtes de selections

-- 1. Liste de l'ensemble des agences
SELECT agences.id_agence, villes.ville, region.region FROM villes
JOIN agences ON villes.id_ville = agences.id_ville_fk
JOIN region ON villes.id_region_fk = region.id_region;

-- 2. Liste de l'ensemble du personnel technique de l'agence de Bordeaux
SELECT nom, prenom FROM personnels
JOIN agences ON agences.id_agence = personnels.id_agence_fk
JOIN villes ON agences.id_ville_fk = villes.id_ville
JOIN postes ON personnels.id_poste_fk = postes.id_poste
WHERE villes.ville = 'Bordeaux'
AND postes.intitule_poste = 'Assisté d''agent technique';

-- 3. Nombre total de capteurs déployés.
SELECT COUNT(id_capteur) AS nombre_capeteur FROM capteurs;

-- 4. Liste des rapports publiés entre 2018 et 2023
-- (nous avons modifié la date de fin, car nous n'avons créé aucun rapport avant 2023).
SELECT * FROM rapports
WHERE date BETWEEN '2018-01-01' AND '2023-12-31';

-- 5. Afficher les concentrations de CH4 (en ppm) dans les régions « Ile-de-France », « Bretagne » et « Occitanie » entre mai 2021 et juin 2023.
-- (Nous avons diminué de deux ans la date de debut, car nous n'avons de mai à juin 2023).
SELECT donnees_capteur.date, donnees_capteur.donnee, villes.ville FROM donnees_capteur
JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
JOIN adresses ON capteurs.id_adresse_capteur_fk = adresses.id_adresse
JOIN villes ON adresses.id_ville_fk = villes.id_ville
JOIN region ON villes.id_region_fk = region.id_region
JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
WHERE region.region IN ('Île-de-France', 'Bretagne', 'Occitanie')
AND donnees_capteur.date BETWEEN '2021-05-01' AND '2023-06-30'
AND gaz.sigle = 'CH4'
AND capteurs.etat = 1;

-- 6. Liste des noms des agents techniques maintenant des capteurs concernant les gaz à effet de serre provenant de l’industrie (GESI).
SELECT DISTINCT personnels.nom FROM personnels
JOIN maintenance_capteur ON maintenance_capteur.id_personnel_fk = personnels.id_personne
JOIN capteurs ON maintenance_capteur.id_capteur_fk = capteurs.id_capteur
JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
JOIN type_gaz ON type_gaz.id_type_gaz = gaz.id_type_gaz_fk
WHERE type_gaz.libelle = 'GESI';

-- 7. Titres et dates des rapports concernant des concentrations de CO2 (et non NH3 car nous n'avons aucun capteur mesurant ce gaz), classés par ordre anti-chronologique.
SELECT titre, rapports.date FROM rapports
JOIN donnees_rapport ON rapports.id_rapport = donnees_rapport.id_rapport_fk
JOIN donnees_capteur ON donnees_rapport.id_releve_fk = donnees_capteur.id_releve
JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
WHERE gaz.sigle = 'CO2'
ORDER BY rapports.date DESC;


-- 8. Afficher le mois où la concentration de CO2 (et non PFC car nous ne disposons pas de capteur mesurant ce gaz) a été la moins importante pour chaque région.
WITH MinConcentrationsParRegion AS (
    SELECT
        region.region,
        MIN(donnees_capteur.donnee) AS min_concentration
    FROM donnees_capteur
            JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
            JOIN adresses ON capteurs.id_adresse_capteur_fk = adresses.id_adresse
            JOIN villes ON adresses.id_ville_fk = villes.id_ville
            JOIN region ON villes.id_region_fk = region.id_region
            JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
    WHERE gaz.sigle = 'CO2'
    AND capteurs.etat = 1
    GROUP BY region.region
)
SELECT
    EXTRACT(MONTH FROM donnees_capteur.date) AS mois,
    EXTRACT(YEAR FROM donnees_capteur.date) AS annee,
    region.region,
    donnees_capteur.donnee AS min_concentration
FROM donnees_capteur
         JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
         JOIN adresses ON capteurs.id_adresse_capteur_fk = adresses.id_adresse
         JOIN villes ON adresses.id_ville_fk = villes.id_ville
         JOIN region ON villes.id_region_fk = region.id_region
         JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
         JOIN MinConcentrationsParRegion ON MinConcentrationsParRegion.region = region.region
    AND MinConcentrationsParRegion.min_concentration = donnees_capteur.donnee
WHERE gaz.sigle = 'CO2'
AND capteurs.etat = 1;


-- 9. Moyenne des concentrations (en ppm) dans la région « Ile-de-France » en 2020, pour chaque gaz étudié.
SELECT gaz.sigle, AVG(donnees_capteur.donnee) AS concentration_moyenne FROM donnees_capteur
JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
JOIN adresses ON capteurs.id_adresse_capteur_fk = adresses.id_adresse
JOIN villes ON adresses.id_ville_fk = villes.id_ville
JOIN region ON villes.id_region_fk = region.id_region
JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
WHERE region.region = 'Île-de-France'
AND EXTRACT(YEAR FROM donnees_capteur.date) = 2020
AND capteurs.etat = 1
GROUP BY gaz.sigle;


-- 10. Taux de productivité des agents administratifs de l'agence de Toulouse
-- (le taux est calculé en nombre de rapports écrits par mois en moyenne, sur la durée de leur contrat)

SELECT personnels.nom, personnels.prenom,
       COUNT(rapports.id_rapport) /
       (EXTRACT(YEAR FROM CURRENT_DATE) * 12 + EXTRACT(MONTH FROM CURRENT_DATE) -
        EXTRACT(YEAR FROM personnels.date_prise_poste) * 12 - EXTRACT(MONTH FROM personnels.date_prise_poste))
        AS taux_productivite
FROM personnels
JOIN agences ON personnels.id_agence_fk = agences.id_agence
JOIN villes ON agences.id_ville_fk = villes.id_ville
JOIN auteurs ON personnels.id_personne = auteurs.id_personne_fk
JOIN rapports ON auteurs.id_rapport_fk = rapports.id_rapport
JOIN postes ON personnels.id_poste_fk = postes.id_poste
WHERE villes.ville = 'Toulouse'
  AND postes.intitule_poste = 'Assisté d''agent administratif'
GROUP BY personnels.nom, personnels.prenom, personnels.date_prise_poste;


-- 11. Pour un gaz donné, liste des rapports contenant des données qui le concernent
-- (on doit pouvoir donner le nom du gaz en paramètre)
SELECT DISTINCT rapports.titre, rapports.date FROM rapports
JOIN donnees_rapport ON rapports.id_rapport = donnees_rapport.id_rapport_fk
JOIN donnees_capteur ON donnees_rapport.id_releve_fk = donnees_capteur.id_releve
JOIN capteurs ON donnees_capteur.id_capteur_fk = capteurs.id_capteur
JOIN gaz ON capteurs.id_gaz_fk = gaz.id_gaz
WHERE gaz.sigle = :nom_gaz;

-- 12. Liste des régions dans lesquelles il y a plus de capteurs que de personnel d’agence.
SELECT region
FROM (
    SELECT region.region,
        COUNT(DISTINCT capteurs.id_capteur) AS nb_capteurs,
        COUNT(DISTINCT personnels.id_personne) AS nb_personnel
        FROM region
    JOIN villes ON region.id_region = villes.id_region_fk
    JOIN adresses ON villes.id_ville = adresses.id_ville_fk
    JOIN agences ON villes.id_ville = agences.id_ville_fk
    LEFT JOIN capteurs ON adresses.id_adresse = capteurs.id_adresse_capteur_fk
    LEFT JOIN personnels ON agences.id_agence = personnels.id_agence_fk
    GROUP BY region.region
     ) AS comptage
WHERE nb_capteurs > nb_personnel;
