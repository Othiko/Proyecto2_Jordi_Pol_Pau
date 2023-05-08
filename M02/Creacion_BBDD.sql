create database if not exists batallaRaces;

drop Table if exists personatges;
drop table if exists armes;

use batallaRaces;

CREATE TABLE personatges (
    id_personatge int null auto_increment,
    nom_personatge char(30),
    raca char(10),
    imagePath_personatge char(80),
    punts_raca int,
    vida int,
    forca int,
    defensa int,
    agilitat int,
    velocitat int,
    puntuacioGlobal int,
    enemicsDerrotats int,
    danyRealitzat int,
    danyRebut int,
    PRIMARY KEY (id_personatge)
);

CREATE TABLE armes (
    id_arma int null auto_increment,
    nom_arma char(30),
    velocitat_arma int,
    forca_arma int,
    imagePath_arma char(80),
    punts_arma int,
    huma boolean,
    elf boolean,
    nan boolean,
    PRIMARY KEY (id_arma)
);

