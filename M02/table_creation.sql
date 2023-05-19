create schema if not exists batallaRaces;

create database if not exists batallaRaces;

use batallaRaces;

drop table if exists battle;
drop table if exists weapons_available;
drop Table if exists warriors;
drop table if exists weapons;
drop table if exists players;
drop table if exists races;

create table races (
    race_id int not null auto_increment primary key,
    race_name char(20),
    race_points int,
    race_life int,
    race_strenght int,
    race_defense int,
    race_agility int,
    race_speed int
);

CREATE TABLE warriors (
    warrior_id int not null auto_increment primary key,
    warrior_name char(30),
    id_race int,
    constraint fk_idr_rid foreign key (id_race)
    references races(race_id),
    warrior_image_path char(80)
);

CREATE TABLE weapons (
    weapon_id int not null auto_increment primary key,
    weapon_name char(30),
    weapon_speed int,
    weapon_strenght int,
    weapon_image_path char(80),
    weapon_points int
);

CREATE TABLE weapons_available (
    id_race int not null,
    id_weapon int not null,
    constraint fk_wid_idw foreign key (id_race)
    references races(race_id),
    constraint fk_weid_idwe foreign key (id_weapon)
    references weapons(weapon_id)
);


CREATE TABLE players (
    player_id int not null auto_increment primary key,
    player_name char(30) not null unique,
    player_password char(30) not null,
    player_global_points int,
    player_enemies_defeated int,
    player_damage_done int,
    player_damage_taken int
);

create table battle (
    battle_id int not null primary key auto_increment,
    id_player int not null,
    id_warrior int not null,
    warrior_weapon_id int not null,
    oponent_id int not null,
    oponent_weapon_id int not null,
    injuries_caused int not null,
    injuries_suffered int not null,
    battle_points int not null,
    constraint fk_pid_pid foreign key (id_player)
    references players(player_id),
    constraint fk_wid_wid foreign key (id_warrior)
    references warriors(warrior_id),
    constraint fk_wwid_wid foreign key (warrior_weapon_id)
    references weapons_available(id_weapon),
    constraint fk_oid_pid foreign key (oponent_id)
    references warriors(warrior_id),
    constraint fk_owid_wid foreign key (oponent_weapon_id)
    references weapons_available(id_weapon)
);
