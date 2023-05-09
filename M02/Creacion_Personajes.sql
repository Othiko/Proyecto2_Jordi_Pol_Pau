use batallaraces;
select * from races;
/* Personajes */

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Bombur",1,"personatges/bombur.png"),
("Fili",1,"personatges/fili.png"),
("Kili",1,"personatges/kili.png");

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Faramir",2,"personatges/faramir.png"),
("Boromir",2,"personatges/boromir.png"),
("Elendil",2,"personatges/elendil.png");

insert into warriors (warrior_name,id_race,warrior_image_path)
values("Thranduil",3,"personatges/thranduil.png"),
("Legolas",3,"personatges/legolas.png"),
("Elrond",3,"personatges/elrond.png");

select * from warriors;
