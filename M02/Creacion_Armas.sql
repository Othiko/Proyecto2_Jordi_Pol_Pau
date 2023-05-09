use batallaraces;

/* ARMES: */

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Dagger", 3, 0, "armes/daga.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Sword", 1, 1, "armes/espasa.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Axe", 0, 3, "armes/destral.png", 10);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Double Sword", 2, 2, "armes/espasesDobles.png", 14);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Scimitar", 2, 1, "armes/simitarra.png", 14);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Bow", 5, 1, "armes/arc.png", 15);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Katana", 3, 2, "armes/katana.png", 18);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Dirk", 4, 0, "armes/punyal.png", 12);

INSERT INTO weapons (weapon_name, weapon_speed, weapon_strenght, weapon_image_path, weapon_points) 
VALUES ("Double Axe", 0, 5, "armes/destralDuesMans.png", 20);

select * from weapons;