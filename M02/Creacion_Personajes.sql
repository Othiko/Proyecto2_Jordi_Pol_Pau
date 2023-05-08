/* Personajes */

insert into personatges (nom_personatge,raca,imagePath_personatge,punts_raca,vida,forca,defensa,agilitat,velocitat,puntuacioGlobal,enemicsDerrotats,danyRealitzat,danyRebut)
values("Faramir","Huma","personatges/faramir.png",20,50,6,4,5,3,0,0,0,0),
("Boromir","Huma","personatges/boromir.png",20,50,6,4,5,3,0,0,0,0),
("Elendil","Huma","personatges/elendil.png",20,50,6,4,5,3,0,0,0,0);

insert into personatges (nom_personatge,raca,imagePath_personatge,punts_raca,vida,forca,defensa,agilitat,velocitat,puntuacioGlobal,enemicsDerrotats,danyRealitzat,danyRebut)
values("Bombur","Nan","personatges/bombur.png",21,60,6,4,5,3,0,0,0,0),
("Fali","Nan","personatges/fali.png",21,60,6,4,5,3,0,0,0,0),
("Kili","Nan","personatges/Kili.png",21,60,6,4,5,3,0,0,0,0);

insert into personatges (nom_personatge,raca,imagePath_personatge,punts_raca,vida,forca,defensa,agilitat,velocitat,puntuacioGlobal,enemicsDerrotats,danyRealitzat,danyRebut)
values("Thranduil","Elf","personatges/thranduil.png",19,40,4,2,7,7,0,0,0,0),
("Legolas","Elf","personatges/legolas.png",19,40,4,2,7,7,0,0,0,0),
("Elrond","Elf","personatges/eili.png",19,40,4,2,7,7,0,0,0,0);

select * from personatges;
