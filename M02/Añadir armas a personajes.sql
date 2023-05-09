/* 1-Nan,2-Huma,3-Elf */
select * from weapons_available;
insert into weapons_available (id_race,id_weapon)
values (1,2),(1,3),(1,8),(1,9);

insert into weapons_available (id_race,id_weapon)
values (2,1),(2,2),(2,3),(2,4),(2,5),(2,7),(2,8);

insert into weapons_available (id_race,id_weapon)
values (3,1),(3,2),(3,4),(3,5),(2,6),(2,8);
select * from weapons_available;