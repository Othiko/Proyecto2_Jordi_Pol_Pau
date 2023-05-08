/* ARMES: */

INSERT INTO armes (id_arma, nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES (1, "Daga", 3, 0, "armes/daga.png", 10, 1, 1, 0);

INSERT INTO armes (id_arma, nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES (2, "Espasa", 1, 1, "armes/espasa.png", 10, 1, 1, 1);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Destral", 0, 3, "armes/destral.png", 10, 1, 0, 1);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Espases dobles", 2, 2, "armes/espasesDobles.png", 14, 1, 1, 0);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Simitarra", 2, 1, "armes/simitarra.png", 14, 1, 1, 0);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Arc", 5, 1, "armes/arc.png", 15, 0, 1, 0);

INSERT INTO armes ( nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Katana", 3, 2, "armes/katana.png", 18, 1, 0, 0);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ("Punyal", 4, 0, "armes/punyal.png", 12, 1, 1, 1);

INSERT INTO armes (nom_arma, velocitat_arma, forca_arma, imagePath_arma, punts_arma, huma, elf, nan) 
VALUES ( "Destral de dues mans", 0, 5, "armes/destralDuesMans.png", 20, 0, 0, 1);

select * from armes;