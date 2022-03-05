select *from cliente
select *from CuentaUsuario where  IdUsuario=1014

select IdUsuario, Cuenta, idUsuarioSuperior from CuentaUsuario where  IdUsuario>1047
order by 1  

select IdUsuario, Cuenta, idUsuarioSuperior from CuentaUsuario where  idUsuarioSuperior=4
order by 1  


update CuentaUsuario set idUsuarioSuperior=1042 Where IdUsuario=1045
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1014
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1020
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1019
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1022
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1036
update CuentaUsuario set idUsuarioSuperior=1009 Where IdUsuario=1010
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=4
update CuentaUsuario set idUsuarioSuperior=1010 Where IdUsuario=1011
update CuentaUsuario set idUsuarioSuperior=1014 Where IdUsuario=1030
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1035
update CuentaUsuario set idUsuarioSuperior=1014 Where IdUsuario=1029
update CuentaUsuario set idUsuarioSuperior=1027 Where IdUsuario=1041
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1018
update CuentaUsuario set idUsuarioSuperior=1031 Where IdUsuario=2
update CuentaUsuario set idUsuarioSuperior=1008 Where IdUsuario=1012
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1037
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1017
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1039
update CuentaUsuario set idUsuarioSuperior=4 Where IdUsuario=1008
update CuentaUsuario set idUsuarioSuperior=1032 Where IdUsuario=1043
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1040
update CuentaUsuario set idUsuarioSuperior=4 Where IdUsuario=1005
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1023
update CuentaUsuario set idUsuarioSuperior=1014 Where IdUsuario=1031
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1021
update CuentaUsuario set idUsuarioSuperior=1016 Where IdUsuario=1033
update CuentaUsuario set idUsuarioSuperior=1041 Where IdUsuario=1046
update CuentaUsuario set idUsuarioSuperior=1016 Where IdUsuario=1034
update CuentaUsuario set idUsuarioSuperior=1015 Where IdUsuario=1032
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1016
update CuentaUsuario set idUsuarioSuperior=1007 Where IdUsuario=1009
update CuentaUsuario set idUsuarioSuperior=1010 Where IdUsuario=1013
update CuentaUsuario set idUsuarioSuperior=1017 Where IdUsuario=1038
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1027
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1026
update CuentaUsuario set idUsuarioSuperior=1042 Where IdUsuario=1044
update CuentaUsuario set idUsuarioSuperior=4 Where IdUsuario=1007
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1015
update CuentaUsuario set idUsuarioSuperior=1014 Where IdUsuario=1028
update CuentaUsuario set idUsuarioSuperior=1041 Where IdUsuario=1047
update CuentaUsuario set idUsuarioSuperior=1027 Where IdUsuario=1042
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1024
update CuentaUsuario set idUsuarioSuperior=4 Where IdUsuario=1006
update CuentaUsuario set idUsuarioSuperior=2 Where IdUsuario=1025

insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('aron.enrique',1027)

insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('axel.ortega',1047)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('lizbeth.leocadio',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('axel.leocadio',1047)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('yareli.lezama',4)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('carlos.tellez',4)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('edgar.cruz',4)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('celia.sanchez',1007)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('alan.reyes',1007)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('evelyn.avila',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('cristina.perez',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('virginia.tovar',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('imelda.salcedo',1012)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('eduardo.ceballos',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('jean.ceballos',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('silvia.ayluardo',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('yannick.teran',1008)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('kathia.briseño',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('laura.huerta',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('rosalinda.alvarado',1014)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('daniel.elguera',0)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('jessica.perez',1017)
insert  into CuentaUsuario   (Cuenta, idUsuarioSuperior) values ('raul.buendia',1017)



select *from   CuentaUsuario  where cuenta  in  (
'aron.enrique',
'axel.ortega',
'lizbeth.leocadio',
'axel.leocadio',
'yareli.lezama',
'carlos.tellez',
'edgar.cruz',
'celia.sanchez',
'alan.reyes',
'evelyn.avila',
'cristina.perez',
'virginia.tovar',
'imelda.salcedo',
'eduardo.ceballos',
'jean.ceballos',
'silvia.ayluardo',
'yannick.teran',
'kathia.briseño',
'laura.huerta',
'rosalinda.alvarado',
'daniel.elguera',
'jessica.perez',
'raul.buendia'

)

update cliente set  nombre='Abraham Elias Bolaños Alonso',rfc='BOAA860312CV9',curp='BOAA860312HMCLL02', referencia='92028605829',idsocio=1008 WHERE  id=9
update cliente set  nombre='Aldo Becerra Hernández',rfc='BEHA820927139',curp='BAHA820927HDFCRL00', referencia='100822927139',idsocio=0 WHERE  id=81
update cliente set  nombre='Aldo Becerra Hernández',rfc='BEHA820927139',curp='BAHA820927HDFCRL00', referencia='100822927139',idsocio=0 WHERE  id=82
update cliente set  nombre='Alejandro Intriago Sierra',rfc='NULL',curp='NULL', referencia='16866421783',idsocio=2 WHERE  id=21
update cliente set  nombre='Alejandro Rodríguez Limón',rfc='NULL',curp='NULL', referencia='37947111417',idsocio=4 WHERE  id=5
update cliente set  nombre='Alma Nashieli Rios Ortiz',rfc='',curp='', referencia='30886801361',idsocio=4 WHERE  id=4
update cliente set  nombre='Ana Cecilia Marin Rodriguez',rfc='NULL',curp='NULL', referencia='90038429487',idsocio=1027 WHERE  id=52
update cliente set  nombre='Ana Verónica Garcia Rincón',rfc='NULL',curp='NULL', referencia='45028338601',idsocio=1041 WHERE  id=49
update cliente set  nombre='Antonio Israel Fuentes Jauregui',rfc='NULL',curp='NULL', referencia='11967614592',idsocio=1017 WHERE  id=35
update cliente set  nombre='Armando Espinosa Garcia',rfc='NULL',curp='NULL', referencia='3146208305',idsocio=1027 WHERE  id=51
update cliente set  nombre='Armando Gonzalez Rodriguez',rfc='NULL',curp='NULL', referencia='16077601736',idsocio=2 WHERE  id=18
update cliente set  nombre='Beatriz Adriana Alvarado Madrazo',rfc='NULL',curp='NULL', referencia='30927309630',idsocio=1031 WHERE  id=46
update cliente set  nombre='Blanca Selene Rubio Tapia',rfc='NULL',curp='NULL', referencia='92998000670',idsocio=2 WHERE  id=30
update cliente set  nombre='Carlos Hernandez Hernandez',rfc='HEHC740616TE5',curp='HEHC740616HMCRRR06', referencia='1907402703',idsocio=1008 WHERE  id=8
update cliente set  nombre='CONCEPCION BLANCO HERNANDEZ',rfc='BAHC811004EG1',curp='BAHC811004MDFLRN04', referencia='30998127135',idsocio=0 WHERE  id=84
update cliente set  nombre='Danny Sánchez Solorio',rfc='NULL',curp='NULL', referencia='45048104801',idsocio=1034 WHERE  id=38
update cliente set  nombre='David González Aguilar',rfc='GOAD800922UK9',curp='GOAD800922HDFNGV01', referencia='30988020381',idsocio=4 WHERE  id=2
update cliente set  nombre='Edgar Oswaldo Moguel Avila',rfc='NULL',curp='NULL', referencia='1997501190',idsocio=2 WHERE  id=26
update cliente set  nombre='Eduardo Octavio Ochoa Reyes',rfc='NULL',curp='NULL', referencia='11967512143',idsocio=2 WHERE  id=13
update cliente set  nombre='Elizabeth Flores Perez',rfc='NULL',curp='NULL', referencia='42866830328',idsocio=1046 WHERE  id=48
update cliente set  nombre='Fabiola Lopez Vazquez',rfc='NULL',curp='NULL', referencia='7068510184',idsocio=1017 WHERE  id=33
update cliente set  nombre='Facundo Cruz Landero',rfc='CULF711127EL7',curp='CULF711127HPLRNC07', referencia='90907118344',idsocio=4 WHERE  id=60
update cliente set  nombre='Fga 3',rfc='1',curp='2', referencia='3',idsocio=2 WHERE  id=87
update cliente set  nombre='Francisco Alejandro Romero Gutierrez',rfc='ROGF7501065F9',curp='ROGF750106HDFMTR01', referencia='30947539083',idsocio=1008 WHERE  id=10
update cliente set  nombre='Francisco Garcia Almaraz',rfc='',curp='', referencia='53896939138',idsocio=2 WHERE  id=16
update cliente set  nombre='Gerardo Reyes Alcocer',rfc='NULL',curp='NULL', referencia='16907310441',idsocio=2 WHERE  id=19
update cliente set  nombre='Guadalupe Hernandez Cortes',rfc='NULL',curp='NULL', referencia='45977806384',idsocio=2 WHERE  id=15
update cliente set  nombre='Hugo Martínez García',rfc='MAGH780619RP8',curp='MAGH780619HMCRRG02', referencia='18947824365',idsocio=2 WHERE  id=75
update cliente set  nombre='Humberto Jose Luis Hernandez Falcon',rfc='NULL',curp='NULL', referencia='92886863817',idsocio=1025 WHERE  id=37
update cliente set  nombre='Isrrael Valverde Torres',rfc='NULL',curp='NULL', referencia='92907356148',idsocio=2 WHERE  id=23
update cliente set  nombre='Jaime Ojeda Mendoza',rfc='OEMJ760216JK3',curp='OEMJ760216HDRJNM03', referencia='45967603627',idsocio=2 WHERE  id=58
update cliente set  nombre='Jaime Ojeda Mendoza',rfc='',curp='', referencia='',idsocio=2 WHERE  id=59
update cliente set  nombre='Jennifer Marcela Romero Arenas',rfc='ROAM840903PH0',curp='ROAM840903MDFMRR08', referencia='45088408955',idsocio=2 WHERE  id=25
update cliente set  nombre='Jessica Pérez Loredo',rfc='',curp='', referencia='2548624880',idsocio=2 WHERE  id=79
update cliente set  nombre='Jesus Miguel Perez Alvarez',rfc='NULL',curp='NULL', referencia='16048646281',idsocio=1016 WHERE  id=40
update cliente set  nombre='Jonathan Sergio Reyes Reyes',rfc='NULL',curp='NULL', referencia='92038320666',idsocio=2 WHERE  id=29
update cliente set  nombre='Jose Alberto Martínez Gutierrez',rfc='NULL',curp='NULL', referencia='16068005632',idsocio=2 WHERE  id=17
update cliente set  nombre='Jose Antonio Moreno Anaya',rfc='NULL',curp='NULL', referencia='39998113896',idsocio=1027 WHERE  id=50
update cliente set  nombre='Jose Guadalupe Cruz Landero',rfc='CULG691212K74',curp='CULG691212HPLRND03', referencia='62856918354',idsocio=4 WHERE  id=7
update cliente set  nombre='Jose Guadalupe Martinez Alonso',rfc='NULL',curp='NULL', referencia='1017401520',idsocio=1030 WHERE  id=41
update cliente set  nombre='José Luis Cabrera Olvera',rfc='CAOL750920LD6',curp='CAOL750920HDFBLS04', referencia='1957515040',idsocio=0 WHERE  id=80
update cliente set  nombre='Juan Luis Juarez Avila',rfc='',curp='', referencia='20977718921',idsocio=2 WHERE  id=20
update cliente set  nombre='Juan Manuel Zarate Hernández',rfc='ZAHJ8103099S4',curp='ZAHJ810309HDFRRN08', referencia='37058100761',idsocio=2 WHERE  id=24
update cliente set  nombre='Juan Mauricio Robles Aroche',rfc='NULL',curp='NULL', referencia='20088605165',idsocio=1016 WHERE  id=39
update cliente set  nombre='Julio Cesar Aguilar Saldivar',rfc='NULL',curp='NULL', referencia='92109111408',idsocio=1017 WHERE  id=36
update cliente set  nombre='Karina Oceguera Torres',rfc='OETK7712041K1',curp='OETK771204MDFCRR00', referencia='68927728482',idsocio=1008 WHERE  id=11
update cliente set  nombre='KATHIA NAYELI VERA ALATORRE',rfc='VEAK8204143N7',curp='VEAK820414MDFRLT07', referencia='92048209537',idsocio=0 WHERE  id=85
update cliente set  nombre='Laura Mijares Maldonado',rfc='NULL',curp='NULL', referencia='30927481652',idsocio=1029 WHERE  id=43
update cliente set  nombre='Leovigildo Sosa Hernandez',rfc='NULL',curp='NULL', referencia='78098815299',idsocio=1030 WHERE  id=42
update cliente set  nombre='LETICIA VERONICA MINJARES AYAR',rfc='MIAL7206236N0',curp='MIAL720623MDFNYT04', referencia='92937203724',idsocio=0 WHERE  id=83
update cliente set  nombre='Marco Antonio Huerta Altamirano',rfc='NULL',curp='NULL', referencia='2917418663',idsocio=2 WHERE  id=27
update cliente set  nombre='Maria del Carmen Sanchez Herrera',rfc='NULL',curp='NULL', referencia='92957747097',idsocio=1029 WHERE  id=45
update cliente set  nombre='Máximo Javier Castillo de la Rosa',rfc='NULL',curp='NULL', referencia='90947536257',idsocio=1028 WHERE  id=47
update cliente set  nombre='Mitzi Garcia Rodri',rfc='miti',curp='mgro', referencia='1234567890',idsocio=2 WHERE  id=78
update cliente set  nombre='Moises Gonzalez Torres',rfc='GOTM8304272Q0',curp='GOTM830427HZSNRS03', referencia='92998305368',idsocio=1008 WHERE  id=12
update cliente set  nombre='Monica Araceli Rios Piña',rfc='NULL',curp='NULL', referencia='39937738043',idsocio=1010 WHERE  id=1
update cliente set  nombre='Nelly Jair Marino Pacheco',rfc='',curp='', referencia='11018337607',idsocio=4 WHERE  id=3
update cliente set  nombre='Nevio Nava Masironi',rfc='NAMN570604AG5',curp='NAMN570604HNEVSV03', referencia='92905705221',idsocio=2 WHERE  id=28
update cliente set  nombre='Nora Andrea Azcue Funtanet',rfc='',curp='', referencia='11068107447',idsocio=2 WHERE  id=14
update cliente set  nombre='Norma Escobar Lopez',rfc='NULL',curp='NULL', referencia='11947433626',idsocio=1017 WHERE  id=34
update cliente set  nombre='Oscar Baca Botello',rfc='BABO750319356',curp='BABO750319HMCCTS05', referencia='92907375726',idsocio=4 WHERE  id=6
update cliente set  nombre='Ramón Herrera Ávila',rfc='HEAR730625EM5',curp='HEAR730625HDFRVM07', referencia='45937338247',idsocio=4 WHERE  id=57
update cliente set  nombre='Raquel Olvera Cordero',rfc='NULL',curp='NULL', referencia='45927488408',idsocio=1035 WHERE  id=32
update cliente set  nombre='Ricardo Carrillo Sierra',rfc='NULL',curp='NULL', referencia='1937416756',idsocio=2 WHERE  id=22
update cliente set  nombre='Roberto Ramirez Jimenez',rfc='NULL',curp='NULL', referencia='68957516393',idsocio=2 WHERE  id=31
update cliente set  nombre='Shanna Ambar Johnson Navarro',rfc='NULL',curp='NULL', referencia='11068708483',idsocio=1029 WHERE  id=44
update cliente set  nombre='Silverio Salazar Vazquez',rfc='SAVS710620U63',curp='SAVS710620HDFLZL05', referencia='90927115627',idsocio=1030 WHERE  id=56
update cliente set  nombre='TANIA IZBETH HERRERA HERNANDEZ',rfc='HEHT980127',curp='HEHT980127MMCRRN07', referencia='63159826914',idsocio=0 WHERE  id=86
update cliente set  nombre='Victor Hugo Palomares Reséndiz',rfc='PARV760124PA4',curp='PARV760124HDFLSC07', referencia='45957631778',idsocio=1030 WHERE  id=61



insert  into Persona  (IdtipoPersona, idUsuario) values ('3',1048)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1049)

insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1050)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1051)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1052)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1053)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1054)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1055)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1056)
insert  into Persona  (IdtipoPersona, idUsuario) values ('3',1057)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1058)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1059)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1060)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1061)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1062)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1063)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1064)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1065)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1066)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1067)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1068)
insert  into Persona  (IdtipoPersona, idUsuario) values ('1',1069)
insert  into Persona  (IdtipoPersona, idUsuario) values ('2',1070)


select  * from persona  ORDER  BY  1

UPDATE  P
SET p.nombre=c.cuenta, idSuscriptor=2, activo=1
from   persona p  inner join  CuentaUsuario  c on p.idUsuario=c.idUsuario  where   c.idUsuario >1047



select IdUsuario, Cuenta, idUsuarioSuperior from CuentaUsuario where  idUsuarioSuperior=4
order by 1  

select  p.IdUsuario, Cuenta, Nombre , p.IdTipoPersona, idUsuarioSuperior 
from   persona p  inner join  CuentaUsuario  c on p.idUsuario=c.idUsuario  where   c.idUsuario >1047


select  p.IdUsuario, Cuenta, Nombre , p.IdTipoPersona, idUsuarioSuperior 
from   persona p  inner join  CuentaUsuario  c on p.idUsuario=c.idUsuario  where    idUsuarioSuperior=4



select * from  CuentaUsuario


update  CuentaUsuario
set Perfiles='4', Grupos='4', activo=1 , Idsuscriptor=2

where   idUsuario >1047

select * from  CuentaUsuario  where  idUsuarioSuperior=1017

update  CuentaUsuario   set Grupos='5' where  idUsuarioSuperior=1027 or  IdUsuario=1027
update  CuentaUsuario   set Grupos='7' where  idUsuarioSuperior=1014 or  IdUsuario=1014