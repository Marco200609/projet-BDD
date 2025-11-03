create table if not exists genres
(
	id_genre int auto_increment
		primary key,
	libelle varchar(50) not null
);

create table if not exists pays
(
	id_pays int auto_increment
		primary key,
	pays varchar(56) not null
);

create table if not exists postes
(
	id_poste int auto_increment
		primary key,
	intitule_poste varchar(100) not null
);

create table if not exists region
(
	id_region int auto_increment
		primary key,
	region varchar(50) not null,
	id_pays_fk int not null,
	constraint region_id_pays_fk_fk
		foreign key (id_pays_fk) references pays (id_pays)
);

create table if not exists type_gaz
(
	id_type_gaz int auto_increment
		primary key,
	libelle varchar(10) not null
);

create table if not exists gaz
(
	id_gaz int auto_increment
		primary key,
	nom_gaz varchar(150) not null,
	sigle varchar(3) not null,
	id_type_gaz_fk int not null,
	constraint id_type_gaz_fk
		foreign key (id_type_gaz_fk) references type_gaz (id_type_gaz)
);

create table if not exists villes
(
	id_ville int auto_increment
		primary key,
	ville varchar(100) not null,
	code_postal varchar(10) null,
	id_region_fk int not null,
	constraint villes_id_region_fk
		foreign key (id_region_fk) references region (id_region)
);

create table if not exists adresses
(
	id_adresse int auto_increment
		primary key,
	numero_rue int null,
	nom_rue varchar(100) null,
	complement_adresse varchar(100) null,
	id_ville_fk int null,
	constraint adresses_id_ville_fk
		foreign key (id_ville_fk) references villes (id_ville)
);

create table if not exists agences
(
	id_agence int auto_increment
		primary key,
	id_ville_fk int not null,
	constraint agences_id_ville_fk
		foreign key (id_ville_fk) references villes (id_ville)
);

create table if not exists capteurs
(
	id_capteur int not null
		primary key,
	id_gaz_fk int not null,
	id_adresse_capteur_fk int not null,
	etat tinyint(1) default 1 not null,
	id_agence_fk int not null,
	constraint capteurs_id_agence_fk
		foreign key (id_agence_fk) references agences (id_agence),
	constraint id_adresse_capteur_fk
		foreign key (id_adresse_capteur_fk) references adresses (id_adresse),
	constraint id_gaz_fk
		foreign key (id_gaz_fk) references gaz (id_gaz)
);

create table if not exists donnees_capteur
(
	id_releve int auto_increment
		primary key,
	ref_releve varchar(11) not null,
	donnee float null,
	id_capteur_fk int not null,
	date date null,
	constraint id_capteur_fk
		foreign key (id_capteur_fk) references capteurs (id_capteur)
);

create table if not exists personnels
(
	id_personne int auto_increment
		primary key,
	nom varchar(100) not null,
	prenom varchar(50) not null,
	date_naissance date not null,
	numero_telephone varchar(20) not null,
	email varchar(254) not null,
	date_prise_poste date not null,
	diplome varchar(100) null,
	id_genre_fk int not null,
	id_adresse_fk int not null,
	id_agence_fk int not null,
	id_poste_fk int not null,
	id_ville_naissance_fk int null,
	constraint id_adresse_fk
		foreign key (id_adresse_fk) references adresses (id_adresse),
	constraint id_agence_fk
		foreign key (id_agence_fk) references agences (id_agence),
	constraint id_genre_fk
		foreign key (id_genre_fk) references genres (id_genre),
	constraint id_poste_fk
		foreign key (id_poste_fk) references postes (id_poste),
	constraint personnels_id_ville_naissance_fk
		foreign key (id_ville_naissance_fk) references villes (id_ville)
);

create table if not exists maintenance_capteur
(
	id_capteur_fk int not null,
	id_personnel_fk int not null,
	constraint maintenance_capteur_id_capteur_fk
		foreign key (id_capteur_fk) references capteurs (id_capteur),
	constraint maintenance_capteur_id_personnel_fk
		foreign key (id_personnel_fk) references personnels (id_personne)
);

create table if not exists rapports
(
	id_rapport int auto_increment
		primary key,
	date date not null,
	analyse text not null,
	id_agence_rapport_fk int not null,
	titre varchar(255) not null,
	Ref_rapport varchar(9) not null,
	constraint id_agence_rapport_fk
		foreign key (id_agence_rapport_fk) references agences (id_agence)
);

create table if not exists auteurs
(
	id_rapport_fk int not null,
	id_personne_fk int not null,
	constraint auteur_id_rapport_fk
		foreign key (id_rapport_fk) references rapports (id_rapport),
	constraint auteurs_id_personne_fk
		foreign key (id_personne_fk) references personnels (id_personne)
);

create table if not exists donnees_rapport
(
	id_rapport_fk int not null,
	id_releve_fk int not null,
	constraint id_rapport_fk
		foreign key (id_rapport_fk) references rapports (id_rapport),
	constraint id_releve_fk
		foreign key (id_releve_fk) references donnees_capteur (id_releve)
);

create definer = root@localhost trigger rapport_pas_delete
	before delete
	on rapports
	for each row
	begin
    SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Suppression des rapports interdite';
end;

create definer = root@localhost trigger rapport_pas_update
	before update
	on rapports
	for each row
	begin
    SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Modification des rapports interdite';
end;

create definer = root@localhost procedure ajouter_agence(IN nom_ville varchar(100), IN cp varchar(10), IN nom_region varchar(50), IN nom_pays varchar(56))
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
END;

