use batallaraces;

insert into players (player_name,player_password,player_global_points,player_enemies_defeated,player_damage_done,player_damage_taken) values
("pau","admin",0,0,0,0),
("pol","admin",0,0,0,0),
("jordi","admin",0,0,0,0);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Dagger", 3, 0, "weapons/dagger.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Sword", 1, 1, "weapons/sword.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Axe", 0, 3, "weapons/axe.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Double Sword", 2, 2, "weapons/doubleSwords.png", 14);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Scimitar", 2, 1, "weapons/scimitar.png", 14);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Bow", 5, 1, "weapons/bow.png", 15);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Katana", 3, 2, "weapons/katana.png", 18);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Dirk", 4, 0, "weapons/dirk.png", 12);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Double Axe", 0, 5, "weapons/doubleAxe.png", 20);

insert into races (race_name,race_points,race_life,race_strenght,race_defense,race_agility,race_speed) 
values("Dwarf",21,60,6,4,4,3);
insert into races (race_name,race_points,race_life,race_strenght,race_defense,race_agility,race_speed) 
values("Human",20,50,5,3,6,5);
insert into races (race_name,race_points,race_life,race_strenght,race_defense,race_agility,race_speed)
values("Elf",19,40,4,2,7,7);

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Bombur",1,"characters/bombur.png"),
("Fili",1,"characters/fili.png"),
("Kili",1,"characters/kili.png");

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Faramir",2,"characters/faramir.png"),
("Boromir",2,"characters/boromir.png"),
("Elendil",2,"characters/elendil.png");

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Thranduil",3,"characters/thranduil.png"),
("Legolas",3,"characters/legolas.png"),
("Elrond",3,"characters/elrond.png");

insert into weapons_available (id_race,id_weapon)
values (1,2),(1,3),(1,8),(1,9);

insert into weapons_available (id_race,id_weapon)
values (2,1),(2,2),(2,3),(2,4),(2,5),(2,7),(2,8);

insert into weapons_available (id_race,id_weapon)
values (3,1),(3,2),(3,4),(3,5),(2,6),(2,8);

