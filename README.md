Manual d'instal·lació

M02 - Instal·lació de la Base de Dades:
  1. Descarrega els arxius table_creation.sql i data_insertion.sql. Aquests es poden trobar a la carpeta M02 dintre de la branca principal.
  2. Inicia el teu servidor local de MySQL Workbench. Asegurat que la configuració d'usuari d'aquest compta amb el nom d'usuari "root" i contrasenya "1234", d'altre  forma no hi funcionara correctament amb el joc. 
  3. Crea un nou esquema amb el nom "batallaRaces". Es important que el nom sigui exacte d'altre forma el programa no hi funcionarà de forma correcte.
  4. Al menu superior de MySQL Workbench, selecciona el desplegable "Server - Data Import" per tal de realitzar la inserció dels arxius sql a la base de dades. Dintre del asistent que hi apareixerà s'haurà de seleccionar la opció "Import from Self-Contained Folder" on hi buscarem al nostre sistema l'arxiu sql anomenat table_creation.sql (es important no seleccionar l'arxiu data_insertion.sql primer o el programa hi donarà error). Després de seleccionar l'arxiu, comprova que el schema target és el creat a l'anterior pas de nom batallaRaces. Si es així realitza la importació, espera uns segons i al finalitzar aquesta i refrescar la llista d'arxius, les taules amb els seus camps han d'haver estat creades al nostre esquema.
  5.  Seguidament tornarem a seleccionar la opció de data import pero aquesta vegada per la inserció de dades de configuració per al correcte funcionament del joc. Seleccionarem en aquest cas el fitxer de nom data_import.sql i batallaRaces com a target schema. Comprovem que es correcte i realitzem la importació. En finalitzar la mateixa les dades requerides per al funcionament del joc estaràn disponibles i la base de dades estarà complerta per al seu correcte funcionament inicial.


M03 - Instal·lació del Joc:
  1. Descarrega l'arxiu M03_RacialBattle.zip de la carpeta M03 dintre de la branca main.
  2. Descomprimeix l'arxiu zip per tal de que sigui accessible els seus continguts en forma de carpeta.
  3. Inicia el compilador que en fagis ús (recomenem l'ús d'Eclipse com a segur funcionament). Dintre del mateix selecciona "Create new Java Project".
  4. Al menu de creació del nou projecte, desselecciona l'opció "Use default location". En fer-ho s'habilitarà la posibilitat d'importar el projecte des-de una carpeta. Per tant seleccionarem la carpeta que hem descomprimit anteriorment i crearem el projecte en base a aquesta.
  5. Darrere la creació del projecte, ens mourem al mateix. Desplegarem els continguts de la carpeta src i veurem dos elements: un paquet anomenat "InterfaceGrafica" i un arxiu java. Aquest últim ha de ser eliminat per el correcte funcionament del programa. 
  6. Després de la eliminació de l'arxiu el programa ja hi estarà disponible per fer-ne ús. Simplement s'ha d'executar l'arxius "main.java" que es troba dintre del paquet "InterfaceGrafica". Es important que abans de la iniciació del programa s'hagi realitzat la instal·lació de la Base de Dades explicada a l'inici d'aquest document. D'altre banda el joc no hi funcionarà. 
