-- procedure pour ajouter une agence
DELIMITER //
CREATE PROCEDURE ajouter_agence(
    IN nom_ville VARCHAR(100),
    IN cp VARCHAR(10),
    IN nom_region VARCHAR(50),
    IN nom_pays VARCHAR(56)
)
BEGIN
    DECLARE id_ville_var INT DEFAULT NULL;
    DECLARE id_region_var INT DEFAULT NULL;
    DECLARE id_pays_var INT DEFAULT NULL;

    -- Vérifier ou insérer le pays
    SELECT id_pays INTO id_pays_var FROM pays WHERE pays = nom_pays LIMIT 1;
    IF id_pays_var IS NULL THEN
        INSERT INTO pays (pays) VALUES (nom_pays);
        SET id_pays_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la région
    SELECT id_region INTO id_region_var FROM region WHERE region = nom_region LIMIT 1;
    IF id_region_var IS NULL THEN
        INSERT INTO region (region, id_pays_fk) VALUES (nom_region, id_pays_var);
        SET id_region_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la ville
    SELECT id_ville INTO id_ville_var FROM villes WHERE ville = nom_ville LIMIT 1;
    IF id_ville_var IS NULL THEN
        INSERT INTO villes (ville, code_postal, id_region_fk) VALUES (nom_ville, cp, id_region_var);
        SET id_ville_var = LAST_INSERT_ID();
    END IF;

    -- Insérer l'agence
    INSERT INTO agences (id_ville_fk) VALUES (id_ville_var);
END //
DELIMITER ;

-- example
CALL ajouter_agence('la rochelle', '17000', 'Nouvelle-Aquitaine', 'France');




-- procedure pour supprimer une agence (toutes les références à cette agence doivent être supprimées)

DELIMITER //
CREATE PROCEDURE supprimer_agence(
    IN id_agence_suppr INT
)
BEGIN
    DELETE FROM agences WHERE agences.id_agence = id_agence_suppr;
END //
DELIMITER ;


-- modification d'une agence

DELIMITER //
CREATE PROCEDURE modifier_agence(
    IN id_agence_modif INT,
    IN nom_ville VARCHAR(100),
    IN cp VARCHAR(10),
    IN nom_region VARCHAR(50),
    IN nom_pays VARCHAR(56)
)
BEGIN
    DECLARE id_ville_var INT DEFAULT NULL;
    DECLARE id_region_var INT DEFAULT NULL;
    DECLARE id_pays_var INT DEFAULT NULL;

    -- Vérifier ou insérer le pays
    SELECT id_pays INTO id_pays_var FROM pays WHERE pays = nom_pays LIMIT 1;
    IF id_pays_var IS NULL THEN
        INSERT INTO pays (pays) VALUES (nom_pays);
        SET id_pays_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la région
    SELECT id_region INTO id_region_var FROM region WHERE region = nom_region LIMIT 1;
    IF id_region_var IS NULL THEN
        INSERT INTO region (region, id_pays_fk) VALUES (nom_region, id_pays_var);
        SET id_region_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la ville
    SELECT id_ville INTO id_ville_var FROM villes WHERE ville = nom_ville LIMIT 1;
    IF id_ville_var IS NULL THEN
        INSERT INTO villes (ville, code_postal, id_region_fk) VALUES (nom_ville, cp,id_region_var);
        SET id_ville_var = LAST_INSERT_ID();
    END IF;

    -- Modifier l'agence
    UPDATE agences SET agences.id_ville_fk = id_ville_var WHERE agences.id_agence = id_agence_modif;
END //
DELIMITER ;


-- procedure pour ajouter un agent

DELIMITER //
CREATE PROCEDURE ajouter_agent(
    IN nom_agent VARCHAR(100),
    IN prenom_agent VARCHAR(50),
    IN date_naissance_agent DATE,
    IN ville_naissance_agent INT,
    IN numero_telephone_agent VARCHAR(20),
    IN adresse_mail VARCHAR(254),
    IN date_prise_poste_agent DATE,
    IN diplome_agent VARCHAR(100),
    IN id_agence INT,
    IN id_poste INT,
    IN genre INT,
    IN numero_rue_agent INT,
    IN nom_rue_agent VARCHAR(100),
    IN complement_adresse_agent VARCHAR(100),
    IN nom_ville_agent VARCHAR(100),
    IN cp VARCHAR(10),
    IN nom_region VARCHAR(50),
    IN nom_pays VARCHAR(56)
)
BEGIN
    DECLARE id_ville_var INT DEFAULT NULL;
    DECLARE id_region_var INT DEFAULT NULL;
    DECLARE id_pays_var INT DEFAULT NULL;
    DECLARE id_adresse_var INT DEFAULT NULL;

    -- Vérifier ou insérer le pays
    SELECT id_pays INTO id_pays_var FROM pays WHERE pays = nom_pays LIMIT 1;
    IF id_pays_var IS NULL THEN
        INSERT INTO pays (pays) VALUES (nom_pays);
        SET id_pays_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la région
    SELECT id_region INTO id_region_var FROM region WHERE region = nom_region LIMIT 1;
    IF id_region_var IS NULL THEN
        INSERT INTO region (region, id_pays_fk) VALUES (nom_region, id_pays_var);
        SET id_region_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer la ville
    SELECT id_ville INTO id_ville_var FROM villes WHERE ville = nom_ville_agent LIMIT 1;
    IF id_ville_var IS NULL THEN
        INSERT INTO villes (ville, code_postal, id_region_fk) VALUES (nom_ville_agent, cp, id_region_var);
        SET id_ville_var = LAST_INSERT_ID();
    END IF;

    -- Vérifier ou insérer l'adresse
    SELECT id_adresse INTO id_adresse_var FROM adresses WHERE nom_rue = nom_rue AND numero_rue = numero_rue AND complement_adresse = complement_adresse AND id_ville_fk = id_ville_var LIMIT 1;
    IF id_adresse_var IS NULL THEN
        INSERT INTO adresses (nom_rue, numero_rue, complement_adresse, id_ville_fk)
        VALUES (nom_rue_agent, numero_rue_agent, complement_adresse_agent, id_ville_var);
        SET id_adresse_var = LAST_INSERT_ID();
    END IF;

    -- Insérer l'agent
    INSERT INTO personnels (nom, prenom, date_naissance, id_ville_naissance_fk, numero_telephone, email, date_prise_poste, diplome, id_genre_fk, id_agence_fk, id_poste_fk)
    VALUES (nom_agent, prenom_agent, date_naissance_agent, ville_naissance_agent, numero_telephone_agent, adresse_mail, date_prise_poste_agent, diplome_agent, genre,id_agence,id_poste);
END //
DELIMITER ;


-- procedure pour supprimer un agent
DELIMITER //
CREATE PROCEDURE supprimer_agent(
    IN id_agent_suppr INT
)
BEGIN
    DELETE FROM personnels WHERE personnels.id_personne = id_agent_suppr;
END //
DELIMITER ;


-- procedure pour modifier un agent
DELIMITER //
CREATE PROCEDURE modifier_agent(
    IN id_agent_modif INT,
    IN nom_agent VARCHAR(100),
    IN prenom_agent VARCHAR(50),
    IN date_naissance_agent DATE,
    IN id_ville_naissance_agent INT,
    IN numero_telephone_agent VARCHAR(20),
    IN adresse_mail_agent VARCHAR(254),
    IN date_prise_poste_agent DATE,
    IN diplome_agent VARCHAR(100),
    IN id_agence_agent INT,
    IN id_poste_agent INT,
    IN id_genre_agent INT,
    IN id_adresse_agent INT)
BEGIN
    UPDATE personnels
    SET personnels.nom = nom_agent,
        personnels.prenom = prenom_agent,
        personnels.date_naissance = date_naissance_agent,
        personnels.id_ville_naissance_fk = id_ville_naissance_agent,
        personnels.numero_telephone = numero_telephone_agent,
        personnels.email = adresse_mail_agent,
        personnels.date_prise_poste = date_prise_poste_agent,
        personnels.diplome = diplome_agent,
        personnels.id_agence_fk = id_agence_agent,
        personnels.id_poste_fk = id_poste_agent,
        personnels.id_genre_fk = id_genre_agent,
        personnels.id_adresse_fk = id_adresse_agent
    WHERE personnels.id_personne = id_agent_modif;
end //
DELIMITER ;


-- procedure pour desactiver un capteur
DELIMITER //
CREATE PROCEDURE desactiver_capteur(
    IN id_capteur_des INT
)
BEGIN
    UPDATE capteurs SET capteurs.etat = 0 WHERE capteurs.id_capteur = id_capteur_des;
END //
DELIMITER ;


-- procedure pour activer un capteur
DELIMITER //
CREATE PROCEDURE activer_capteur(
    IN id_capteur_activ INT
)
BEGIN
    UPDATE capteurs SET capteurs.etat = 1 WHERE capteurs.id_capteur = id_capteur_activ;
END //
DELIMITER ;

-- procedure pour ajouter un capteur
DELIMITER //
CREATE PROCEDURE ajouter_capteur(
    IN type_gaz VARCHAR(50),
    IN gaz_sigle VARCHAR(10),
    IN nom_pays VARCHAR(56),
    IN nom_region VARCHAR(50),
    IN nom_ville VARCHAR(100),
    IN id_agence INT
)
BEGIN
    DECLARE id_ville_var INT DEFAULT NULL;
    DECLARE id_region_var INT DEFAULT NULL;
    DECLARE id_pays_var INT DEFAULT NULL;
    DECLARE id_gaz_var INT DEFAULT NULL;
    DECLARE id_type_gaz_var INT DEFAULT NULL;
    DECLARE id_adresse_var INT DEFAULT NULL;

    -- Pays
    SELECT id_pays INTO id_pays_var FROM pays WHERE pays = nom_pays LIMIT 1;
    IF id_pays_var IS NULL THEN
        INSERT INTO pays (pays) VALUES (nom_pays);
        SET id_pays_var = LAST_INSERT_ID();
    END IF;

    -- Région
    SELECT id_region INTO id_region_var FROM region WHERE region = nom_region LIMIT 1;
    IF id_region_var IS NULL THEN
        INSERT INTO region (region, id_pays_fk) VALUES (nom_region, id_pays_var);
        SET id_region_var = LAST_INSERT_ID();
    END IF;

    -- Ville
    SELECT id_ville INTO id_ville_var FROM villes WHERE ville = nom_ville LIMIT 1;
    IF id_ville_var IS NULL THEN
        INSERT INTO villes (ville, id_region_fk) VALUES (nom_ville, id_region_var);
        SET id_ville_var = LAST_INSERT_ID();
    END IF;

    -- Adresse (ici, on suppose une adresse minimale liée à la ville)
    SELECT id_adresse INTO id_adresse_var FROM adresses WHERE id_ville_fk = id_ville_var AND adresses.nom_rue is NULL LIMIT 1;
    IF id_adresse_var IS NULL THEN
        INSERT INTO adresses (id_ville_fk) VALUES (id_ville_var);
        SET id_adresse_var = LAST_INSERT_ID();
    END IF;

    -- Type de gaz
    SELECT id_type_gaz INTO id_type_gaz_var FROM type_gaz WHERE libelle = type_gaz LIMIT 1;
    IF id_type_gaz_var IS NULL THEN
        INSERT INTO type_gaz (libelle) VALUES (type_gaz);
        SET id_type_gaz_var = LAST_INSERT_ID();
    END IF;

    -- Gaz
    SELECT id_gaz INTO id_gaz_var FROM gaz WHERE sigle = gaz_sigle LIMIT 1;
    IF id_gaz_var IS NULL THEN
        INSERT INTO gaz (sigle, id_type_gaz_fk) VALUES (gaz_sigle, id_type_gaz_var);
        SET id_gaz_var = LAST_INSERT_ID();
    END IF;

    -- Capteur
    INSERT INTO capteurs (id_gaz_fk, id_adresse_capteur_fk, id_agence_fk) VALUES (id_gaz_var, id_adresse_var, id_agence);
END //
DELIMITER ;

-- procedure pour supprimer les données d'un capteur
DELIMITER //
CREATE PROCEDURE supprimer_donnes_capteur(
    IN id_capteur_suppr INT
)
BEGIN
    DELETE FROM donnees_capteur WHERE donnees_capteur.id_capteur_fk = id_capteur_suppr;
END //
DELIMITER ;

-- procedure pour supprimer un releve
DELIMITER //
CREATE PROCEDURE supprimer_releve(
    IN id_releve_suppr INT
)
BEGIN
    DELETE FROM donnees_rapport WHERE donnees_rapport.id_releve_fk = id_releve_suppr;
END //
DELIMITER ;

-- procedure pour ajouter un releve
DELIMITER //
CREATE PROCEDURE ajouter_releve(
    IN id_capteur INT,
    IN date_releve DATE,
    IN donnee_releve FLOAT,
    IN reference_releve VARCHAR(11)
)
BEGIN
    INSERT INTO donnees_capteur (id_capteur_fk, date, donnee, ref_releve)
    VALUES (id_capteur, date_releve, donnee_releve, reference_releve);
END //
DELIMITER ;



drop procedure ajouter_agence;