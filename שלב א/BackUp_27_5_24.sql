﻿prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by Tamar
set feedback off
set define off
prompt Creating CUSTOMER...
create table CUSTOMER
(
  cid    NUMBER(3) not null,
  cname  VARCHAR2(15),
  cemail VARCHAR2(15) not null,
  cphone VARCHAR2(15)
)
;
alter table CUSTOMER
  add primary key (CID);

prompt Creating DRESS...
create table DRESS
(
  did    NUMBER(3) not null,
  length NUMBER(3),
  color  VARCHAR2(15),
  price  NUMBER(3) not null
)
;
alter table DRESS
  add primary key (DID);

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  eid    NUMBER(3) not null,
  ename  VARCHAR2(15),
  eemail VARCHAR2(15) not null,
  ephone VARCHAR2(15)
)
;
alter table EMPLOYEE
  add primary key (EID);

prompt Creating ORDERS...
create table ORDERS
(
  oid        NUMBER(3) not null,
  orderdate  DATE not null,
  returndate DATE not null,
  eid        NUMBER(3) not null,
  did        NUMBER(3) not null,
  cid        NUMBER(3) not null
)
;
alter table ORDERS
  add primary key (OID);
alter table ORDERS
  add foreign key (EID)
  references EMPLOYEE (EID);
alter table ORDERS
  add foreign key (DID)
  references DRESS (DID);
alter table ORDERS
  add foreign key (CID)
  references CUSTOMER (CID);

prompt Creating LAUNDRY...
create table LAUNDRY
(
  lid         NUMBER(3) not null,
  cost        NUMBER(3) not null,
  lname       VARCHAR2(15),
  pickingdate DATE not null,
  oid         NUMBER(3) not null
)
;
alter table LAUNDRY
  add primary key (LID);
alter table LAUNDRY
  add foreign key (OID)
  references ORDERS (OID);

prompt Creating PAYMENT...
create table PAYMENT
(
  pid       NUMBER(3) not null,
  price     NUMBER(3) not null,
  ispaid    NUMBER(3) not null,
  fineprice NUMBER(3) not null,
  oid       NUMBER(3) not null
)
;
alter table PAYMENT
  add primary key (PID);
alter table PAYMENT
  add foreign key (OID)
  references ORDERS (OID);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);

prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DRESS...
alter table DRESS disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for LAUNDRY...
alter table LAUNDRY disable all triggers;
prompt Disabling triggers for PAYMENT...
alter table PAYMENT disable all triggers;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C007038;
alter table ORDERS disable constraint SYS_C007039;
alter table ORDERS disable constraint SYS_C007040;
prompt Disabling foreign key constraints for LAUNDRY...
alter table LAUNDRY disable constraint SYS_C007054;
prompt Disabling foreign key constraints for PAYMENT...
alter table PAYMENT disable constraint SYS_C007048;
prompt Deleting PAYMENT...
delete from PAYMENT;
commit;
prompt Deleting LAUNDRY...
delete from LAUNDRY;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting DRESS...
delete from DRESS;
commit;
prompt Deleting CUSTOMER...
delete from CUSTOMER;
commit;
prompt Loading CUSTOMER...
insert into CUSTOMER (cid, cname, cemail, cphone)
values (72, 'Suzanne-William', 'swilliamson@ass', '1636716192');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (405, 'Michael-Holbroo', 'michaelh@faef.d', '707738883');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (120, 'Lauren-Short', 'lauren.short@ti', '4153236284');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (672, 'Mac-Clarkson', 'mac.clarkson@mc', '3412583186');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (557, 'Lisa-Humphrey', 'lisa.humphrey@g', '1190241922');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (914, 'Catherine-Voigh', 'catherine.voigh', '755017234');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (780, 'Jeffery-Jessee', 'jeffery@fpf.com', '1120525873');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (503, 'Victor-Copeland', 'victor.copeland', '2542669515');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (374, 'Albertina-Roth', 'albertina.roth@', '3814200202');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (828, 'Marley-Armatrad', 'marley.armatrad', '631747546');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (608, 'Moe-Weaver', 'm.weaver@tropic', '3123465756');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (486, 'Darius-Hector', 'darius.hector@w', '4048366738');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (858, 'Kylie-Hannah', 'khannah@nsd.uk', '686745645');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (984, 'Arturo-Lawrence', 'arturo@ataservi', '2412447104');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (935, 'Bobbi-Sawa', 'bobbi.sawa@univ', '551178982');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (949, 'Blair-Briscoe', 'blair.briscoe@s', '3656062995');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (498, 'Carole-Dillane', 'c.dillane@kello', '2808736567');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (434, 'Barry-Colon', 'barry.colon@ape', '2142183790');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (849, 'Matt-Stigers', 'm.stigers@cis.c', '1319605181');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (36, 'Pam-Deejay', 'pam.deejay@cata', '2564457421');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (367, 'Carrie-Anne-Rai', 'crain@accuship.', '890380862');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (390, 'Thin-Cattrall', 'thin.cattrall@k', '2383339312');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (21, 'Mel-Womack', 'mel.womack@worl', '2072319453');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (64, 'Jay-Lavigne', 'jay.lavigne@sm.', '1460552962');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (566, 'Lenny-Cook', 'lenny.cook@pra.', '1043731008');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (383, 'Roberta-Hobson', 'r.hobson@infini', '1697528263');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (534, 'Yolanda-Morriso', 'yolanda@telepoi', '2567153947');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (213, 'Raymond-Skarsga', 'rskarsgard@mont', '8163302');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (270, 'Juliette-Hayes', 'juliette.hayes@', '3131292085');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (444, 'Kevn-Warden', 'kevn.w@digitalm', '1369713939');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (236, 'Emma-Moraz', 'emma.moraz@staf', '1801105643');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (156, 'Brothers-Karyo', 'bkaryo@vspan.br', '582483459');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (472, 'Ivan-Fiorentino', 'i.fiorentino@pr', '786433786');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (622, 'Wes-Santana', 'wess@gagwear.pt', '706996003');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (854, 'Vince-Faithfull', 'vince@networkdi', '2669702203');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (908, 'Sal-Brandt', 'sal.brandt@well', '2679787434');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (797, 'Oded-McDowall', 'oded.mcdowall@h', '815587364');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (258, 'Michael-Lloyd', 'michael@entelli', '522887581');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (412, 'Leon-Gough', 'leon.gough@mult', '2818252113');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (97, 'Vincent-Bell', 'vincent.bell@nr', '3960003655');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (378, 'Terence-Davies', 'terenced@neogen', '616946868');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (283, 'George-Peterson', 'george.peterson', '2274427089');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (790, 'Ozzy-Getty', 'ozzy@myricom.za', '3176876736');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (656, 'Marlon-Emmett', 'marlon.emmett@d', '2283472457');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (291, 'Lois-Senior', 'lois.senior@anh', '2064143042');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (675, 'Dar-Mohr', 'dar.m@spenser.c', '2369182846');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (365, 'James-Merchant', 'james.merchant@', '2057738767');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (994, 'Mitchell-Crysta', 'm.crystal@colga', '2762008759');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (633, 'Bobby-Brosnan', 'bobby.brosnan@t', '1776018292');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (282, 'Caroline-Prinze', 'caroline.prinze', '2533825955');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (401, 'Juliet-Choice', 'juliet.choice@f', '3081377274');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (946, 'Ashton-Duke', 'ashton.duke@evi', '3473133526');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (139, 'Jean-Claude-Bel', 'j.bello@pib.com', '3316388122');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (488, 'Horace-Reid', 'horacer@saralee', '1413001920');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (178, 'Brad-Lipnicki', 'bradl@sds.fi', '719219685');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (293, 'Bruce-Gibbons', 'bruce@ceom.com', '3216342117');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (386, 'Chi-Hamilton', 'chi.hamilton@og', '592020105');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (846, 'William-Eldard', 'william@verizon', '3693554284');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (844, 'Liquid-Allen', 'liquida@nsd.com', '3373563180');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (836, 'Andrae-Short', 'andrae.short@sh', '3470207940');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (976, 'Demi-Cheadle', 'demi.cheadle@bi', '1858364832');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (839, 'Avril-Hingle', 'avril@priorityl', '566344697');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (589, 'Bridgette-Nelli', 'bridgette@fetch', '3353572319');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (408, 'Lila-Malone', 'lilam@studiobpr', '1636792009');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (100, 'Lonnie-Aiken', 'lonniea@kiamoto', '3289217596');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (533, 'Deborah-Cusack', 'deborah.cusack@', '982898859');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (316, 'Malcolm-Judd', 'malcolm.judd@ab', '714922900');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (840, 'Charles-Loeb', 'charles.loeb@ds', '1486084953');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (747, 'Amanda-Phillips', 'amanda.phillips', '2006003891');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (99, 'Delroy-Curtis', 'delroy.curtis@i', '3819054809');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (631, 'Brittany-Curtis', 'brittany.curtis', '3075190623');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (740, 'Jesus-Skaggs', 'jesus.skaggs@ax', '3272970185');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (77, 'Nikka-Pfeiffer', 'nikka.pfeiffer@', '2298696546');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (757, 'Thomas-Eckhart', 'thomas.eckhart@', '3696969188');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (346, 'Keith-Leary', 'keith@randomwal', '2523510879');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (865, 'Rosco-Davies', 'rosco.davies@kn', '2700513590');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (330, 'Balthazar-Jonze', 'balthazar.jonze', '2030038165');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (705, 'Ned-Redford', 'nredford@consul', '4123302985');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (749, 'Rebecca-Gere', 'rebecca.gere@in', '1777909269');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (852, 'Bette-Schiff', 'bette.schiff@st', '2074778849');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (487, 'Rip-Hyde', 'rip.hyde@contra', '4260512493');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (275, 'Giovanni-Cherry', 'giovanni.cherry', '766562289');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (349, 'Joshua-Donelly', 'joshua.donelly@', '895025102');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (425, 'Gord-Monk', 'gord.monk@alter', '3195468446');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (528, 'Vickie-Fierstei', 'vickie.fierstei', '3949064355');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (972, 'Alec-Zappacosta', 'alec.zappacosta', '59116495');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (66, 'Clint-Gill', 'c.gill@globalwi', '835908787');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (635, 'Lily-Charles', 'l.charles@infov', '3656099963');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (975, 'Kelli-Evett', 'kelli.evett@ubp', '3789692440');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (299, 'Joanna-Cochran', 'joannac@priorit', '2481349511');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (117, 'Jeremy-Venora', 'jeremy@calence.', '2657913434');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (554, 'Ned-Manning', 'ned.manning@uni', '1995340926');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (824, 'Goran-Neville', 'goran.neville@m', '2374007156');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (939, 'Jeremy-Griffith', 'jeremy.griffith', '3647317442');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (26, 'Jay-Tyson', 'jayt@aoltimewar', '1483329094');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (499, 'Freda-Dillane', 'freda.dillane@t', '1676862361');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (599, 'Vickie-Lewin', 'vickie.lewin@as', '4030853967');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (368, 'Wally-Magnuson', 'wally.magnuson@', '1075591363');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (287, 'Lydia-Derringer', 'lderringer@bene', '1731560776');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (527, 'Freddy-Rucker', 'freddyr@timevis', '821845631');
commit;
prompt 100 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone)
values (65, 'Sigourney-Phill', 'sphillips@summi', '1596348976');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (85, 'Sydney-Bean', 'sydney.bean@ufs', '2731996739');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (469, 'Kitty-Kudrow', 'kitty.kudrow@se', '1472519275');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (964, 'Hope-LaSalle', 'hopel@generalmi', '1155589755');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (808, 'Javon-Deschanel', 'javon.deschanel', '1929539443');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (907, 'Rebeka-Cattrall', 'rebeka.cattrall', '2974964442');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (397, 'Oded-Tate', 'oded@capitolban', '1942705101');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (342, 'Ian-Sepulveda', 'ians@spotfireho', '55137777');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (938, 'Roberta-Roberts', 'robertar@ubp.za', '1768462700');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (738, 'Dabney-Perrinea', 'dabney.p@whitew', '1255527002');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (571, 'Tal-Romijn-Stam', 'tal.romijnstamo', '3684615271');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (677, 'Johnny-Branagh', 'j.branagh@nexxt', '2536970542');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (175, 'Geena-Whitman', 'geena.whitman@c', '1440475633');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (89, 'Freddie-Peet', 'freddie.peet@aq', '1243683319');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (482, 'Isaac-Dalley', 'isaac@gsat.com', '1621455800');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (746, 'Kyra-Garza', 'kyra@iss.ca', '4153835807');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (965, 'Gloria-Kier', 'gkier@smartroni', '4277127489');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (40, 'Juan-Lucas', 'j.lucas@tama.de', '506958119');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (985, 'Rosco-Frampton', 'rosco.frampton@', '1050257418');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (332, 'Marley-Numan', 'marley.numan@so', '2865209163');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (555, 'Brenda-Tyler', 'btyler@ciwservi', '1179663847');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (523, 'Juan-Connery', 'juan.c@data.fr', '2005505656');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (32, 'Lili-Singh', 'lili.singh@vms.', '3649629659');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (798, 'Loren-Peniston', 'loren.p@sfgo.ca', '1861052875');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (113, 'Keith-Pepper', 'keith.pepper@pr', '4069388170');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (701, 'Lionel-Union', 'lionel@dillards', '2030966712');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (194, 'Molly-Green', 'molly@clorox.fi', '3866383896');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (105, 'Mindy-Myers', 'mindy.myers@ari', '2536523912');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (298, 'Joely-Albright', 'joely.a@ubp.de', '2728929836');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (660, 'Geoff-Numan', 'geoff.numan@sta', '1847243041');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (265, 'Vern-Sarsgaard', 'vern.sarsgaard@', '2118659549');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (830, 'Mena-Kweller', 'mena.k@kitba.co', '2651355106');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (201, 'Jim-Schwarzeneg', 'jim.s@tama.ch', '1068780418');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (764, 'Ani-Sweet', 'ani.sweet@eastm', '3292937838');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (328, 'Dylan-Favreau', 'dylan.favreau@m', '3448773387');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (794, 'Christopher-Hol', 'christopher@aoe', '1937144760');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (931, 'Chuck-Hiatt', 'chuck.hiatt@nor', '2124018733');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (462, 'Armin-Olin', 'armin.olin@joll', '2686232973');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (415, 'Olga-Goodall', 'olga.goodall@ar', '1174497826');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (167, 'Andrew-Daniels', 'andrewd@gagwear', '971733588');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (603, 'Sigourney-Wooda', 'sigourney.w@sol', '4232171588');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (977, 'Joanna-Coverdal', 'joanna.c@team.c', '4113323463');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (729, 'Aida-Perlman', 'aida.perlman@ca', '1602615407');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (497, 'Lynette-McDonal', 'lynette.mcdonal', '3534369884');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (5, 'Nicolas-Keaton', 'nicolas.keaton@', '1929378273');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (137, 'Kiefer-Lennox', 'kiefer.lennox@z', '1678542245');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (15, 'Mike-McGriff', 'mikem@fetchlogi', '2654265182');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (119, 'Wayman-Baker', 'wayman.baker@so', '2270586717');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (256, 'Alicia-Creek', 'alicia.c@target', '3712472533');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (52, 'Martha-Whitwam', 'martha.whitwam@', '1441117242');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (756, 'Hope-Capshaw', 'hope.capshaw@ca', '28838152');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (63, 'Gavin-McCain', 'g.mccain@oriser', '2330652643');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (959, 'Joan-Guest', 'joan@generalmot', '3062052741');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (420, 'Liquid-Marsden', 'l.marsden@taste', '850074985');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (575, 'Noah-Bugnon', 'noah.b@spinnake', '2451008547');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (551, 'Julie-Horizon', 'julieh@insurmar', '3762714280');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (755, 'Kate-Magnuson', 'kate.m@logistic', '1029865395');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (428, 'Kate-Wine', 'kate.wine@nmr.c', '761048004');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (138, 'Amanda-Thewlis', 'amanda.thewlis@', '913752806');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (861, 'Philip-England', 'philip.england@', '782555660');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (121, 'Brian-Hudson', 'bhudson@catamou', '1757587950');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (84, 'Lindsay-Keener', 'lindsay.keener@', '2984494320');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (166, 'Lynette-Playboy', 'lynette.p@volks', '1224495102');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (791, 'Rebecca-Deejay', 'rebecca@viacom.', '2452463459');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (617, 'Madeline-Potter', 'madeline.potter', '624120968');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (11, 'Rascal-Withers', 'rascal.withers@', '3668236870');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (281, 'Kenny-Flack', 'kenny.f@ksj.com', '2320995528');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (770, 'Radney-Tinsley', 'radney.tinsley@', '2995648440');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (14, 'Kyle-Wincott', 'kyle@tilia.com', '3979541254');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (30, 'Eddie-Meniketti', 'eddie.meniketti', '2283995079');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (983, 'Christina-Whitm', 'christina.whitm', '2384598262');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (936, 'Armand-Singh', 'armand.singh@we', '1456514642');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (437, 'Boz-Rodriguez', 'boz@studiobprod', '2614273188');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (151, 'Gary-Young', 'gary.young@mast', '3666213741');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (806, 'Bridgette-Green', 'bridgetteg@dsp.', '2217515395');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (70, 'Philip-Braugher', 'philip.braugher', '3123074303');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (659, 'Herbie-Scheider', 'herbie.scheider', '3488135319');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (767, 'Lynn-LaSalle', 'llasalle@telech', '647181112');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (743, 'Shelby-Numan', 'shelby@electric', '824714998');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (919, 'Machine-Leachma', 'machine.leachma', '1639049548');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (268, 'William-Fiennes', 'william.fiennes', '2257265079');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (521, 'Busta-Wiest', 'busta.wiest@3ts', '1080789092');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (170, 'Temuera-Colton', 'temuerac@micros', '679560738');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (104, 'Leslie-Stamp', 'l.stamp@efcbanc', '3674894175');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (632, 'Kenny-Coburn', 'kennyc@nike.com', '3132640080');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (375, 'Lara-Ramirez', 'lramirez@epamsy', '545568228');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (53, 'Natacha-Collie', 'natacha.c@everg', '4226552235');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (399, 'Cledus-Phifer', 'cledus.phifer@m', '2840670431');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (292, 'Anthony-Shatner', 'anthony.shatner', '1391037383');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (895, 'Morgan-Bates', 'morgan.bates@sm', '4256551174');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (231, 'Charlie-Sedaka', 'csedaka@kiamoto', '3037903540');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (769, 'Cyndi-Latifah', 'cyndi.latifah@u', '2144330714');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (754, 'Naomi-Phifer', 'nphifer@gdi.ca', '4231482438');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (177, 'Julie-Karyo', 'julie.karyo@sys', '1434393075');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (402, 'Sean-Bello', 'seanb@adeasolut', '3374871786');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (783, 'Crispin-Estevez', 'cestevez@wci.co', '3809789055');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (69, 'Marianne-Lauper', 'marianne.l@albe', '1100855486');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (377, 'Catherine-Butle', 'catherine.butle', '3355041267');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (162, 'Danni-Herndon', 'danni.herndon@g', '2922015841');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (759, 'Cuba-Costner', 'cuba.costner@am', '3990670701');
commit;
prompt 200 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone)
values (276, 'Jennifer-Krumho', 'jennifer.krumho', '2821483143');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (73, 'Clint-Steagall', 'csteagall@cmi.d', '1142929992');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (693, 'Karon-Heston', 'karon.heston@as', '2943928219');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (491, 'Temuera-Liotta', 't.liotta@bioref', '1161826707');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (777, 'Loreena-Whitmor', 'loreenaw@anwort', '1434215247');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (989, 'Machine-Baez', 'machine.baez@ma', '3370642028');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (689, 'Holland-Bright', 'hbright@ccfhold', '1335265123');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (514, 'Talvin-Patton', 'talvin.patton@p', '1915267541');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (927, 'Sinead-Cervine', 'sinead@proclari', '3748430992');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (209, 'Mae-Nunn', 'mae@terrafirma.', '1148826746');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (224, 'Roberta-Joli', 'robertaj@electr', '1586687188');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (532, 'Vendetta-Marx', 'vendetta.marx@u', '3593280755');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (147, 'Clea-Lucien', 'clea.lucien@exi', '2470266446');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (990, 'Cary-Roy Parnel', 'croyparnell@ame', '3047620441');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (145, 'Emilio-Broza', 'emilio@abs.com', '3596336400');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (357, 'Ruth-Loggins', 'ruthl@cns.za', '3905561554');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (588, 'Clarence-Bates', 'clarence.bates@', '1269479430');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (751, 'Suzanne-Vinton', 'suzanne.vinton@', '1859455150');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (91, 'Glenn-Cash', 'glenn.cash@park', '2545224182');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (620, 'Lea-Palin', 'lea.palin@gener', '4225003621');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (393, 'Willem-Rollins', 'willem@officede', '1253456915');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (9, 'Elle-Levin', 'elle@berkshireh', '653182032');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (598, 'Emerson-Garcia', 'emerson@verizon', '1899343491');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (34, 'Stephanie-Parke', 'stephanie.parke', '1195200980');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (495, 'Maury-Farina', 'maury.farina@us', '1053374057');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (786, 'Tom-Hanks', 'tom.hanks@fetch', '810253289');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (480, 'Davy-Quatro', 'davy.quatro@nta', '923212137');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (198, 'Kenneth-Withers', 'k.witherspoon@k', '891751447');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (216, 'Colleen-Hutton', 'c.hutton@tlsser', '1610119815');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (600, 'Mitchell-Pride', 'mitchell.pride@', '2114553523');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (618, 'Richard-Dunst', 'richard.dunst@a', '3674768993');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (732, 'Queen-Jamal', 'queen.jamal@ams', '3435370038');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (433, 'Miranda-Apple', 'miranda.apple@e', '2720952158');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (565, 'Vern-Cage', 'vern@dillards.d', '3300830969');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (586, 'Judi-Rhames', 'judi@pioneerdat', '1233172289');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (115, 'Emerson-Place', 'emerson@ezecast', '967376656');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (317, 'Chris-Hector', 'chris@greenmoun', '1274844879');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (536, 'Patti-Rea', 'patti.rea@visio', '1610052648');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (345, 'Boyd-Sharp', 'boyd@marlabs.jp', '3253618161');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (916, 'Miranda-Duvall', 'miranda.d@gtp.z', '599140118');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (863, 'Tilda-Fariq', 't.fariq@volkswa', '1192693271');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (71, 'Nelly-Ribisi', 'nelly.ribisi@pr', '3090862295');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (440, 'Luis-Flanagan', 'luis@venoco.com', '4058568726');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (678, 'Carla-Vai', 'carla@kis.uk', '1928840076');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (909, 'Neve-Reed', 'neve.reed@ccfho', '2387187814');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (795, 'Judi-Ramirez', 'judi.ramirez@he', '1570208231');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (867, 'Kurtwood-Madsen', 'kurtwood@bat.co', '2729851058');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (57, 'Holland-Arquett', 'holland.arquett', '2705307107');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (320, 'Rosanna-Tucker', 'rosanna.tucker@', '1784869904');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (796, 'Jean-Claude-McC', 'jeanclaude.mcca', '1947021888');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (872, 'Winona-White', 'wwhite@generale', '2889396583');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (395, 'Loretta-Rourke', 'lrourke@ataserv', '2642569898');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (301, 'Giancarlo-Tenni', 'giancarlot@flav', '964082871');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (318, 'Collective-Free', 'cfreeman@meridi', '3801500357');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (955, 'Hank-Strong', 'hank.strong@nsd', '3884423418');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (208, 'Nicole-Rucker', 'nicole.rucker@c', '2691197628');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (108, 'Ray-Kline', 'r.kline@grs.com', '1488086880');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (967, 'Alec-Boorem', 'alec.b@linacsys', '1839710812');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (509, 'Jose-Li', 'jli@ogiointerna', '846896267');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (484, 'Dionne-Lachey', 'dionne.lachey@f', '3754847089');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (218, 'Rhona-Perry', 'rhonap@componen', '4005975737');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (772, 'Eileen-Haynes', 'eileen.haynes@n', '535308298');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (501, 'Sarah-Yorn', 'sarah.yorn@aris', '3801333002');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (945, 'Shawn-Renfro', 'shawn.renfro@ma', '3556961100');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (12, 'Garland-Oldman', 'g.oldman@provid', '1932113920');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (508, 'Maceo-Maxwell', 'maceo.maxwell@n', '1895614204');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (382, 'Rene-Dunaway', 'rene.dunaway@mo', '664528874');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (993, 'Yolanda-McDonne', 'ymcdonnell@tech', '3054679165');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (414, 'Casey-Travolta', 'casey.t@gltg.co', '2779830282');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (973, 'Parker-Molina', 'parker.molina@p', '1096686876');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (713, 'Gilbert-Burrows', 'gilbert@mathis.', '3331867031');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (876, 'Reese-Woodard', 'rwoodard@multim', '3048616589');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (76, 'Isaac-Tyson', 'isaac.tyson@spe', '2029994164');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (41, 'Fionnula-Sartai', 'fionnula.sartai', '2592918693');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (1, 'Crystal-Haynes', 'crystal.haynes@', '1492867790');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (545, 'Scott-El-Saher', 'scott.elsaher@c', '2428918053');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (596, 'Harry-Galecki', 'harry.g@horizon', '2373538644');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (18, 'Drew-Skaggs', 'drew@ccb.uk', '1065859559');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (879, 'Nick-Shelton', 'nick.s@target.c', '3194754490');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (481, 'Jill-Neill', 'jill.neill@swi.', '3703090924');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (29, 'Cledus-Vassar', 'cledus.vassar@t', '730734565');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (900, 'Kim-Clooney', 'kimc@virbac.jp', '669946732');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (187, 'Harvey-Bachman', 'harvey.bachman@', '616234840');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (640, 'Uma-Nivola', 'uma.nivola@wrgs', '4043810097');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (441, 'Boyd-Rucker', 'boyd.r@atxforms', '4166236316');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (567, 'Juliana-Snipes', 'julianas@carter', '3600542341');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (784, 'Hikaru-Cleary', 'hikaru.c@mattel', '2065879945');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (595, 'Bonnie-Mattea', 'bmattea@esoftso', '1622123213');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (152, 'Jackson-Coughla', 'jackson.coughla', '1339903322');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (341, 'Grant-Blaine', 'grant.blaine@em', '2152502955');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (352, 'Eileen-Shawn', 'eileen@trinityh', '2686836627');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (842, 'Gaby-Ontiveros', 'gaby@topicsente', '1010850268');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (195, 'Goldie-Gugino', 'goldie.gugino@a', '3405205686');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (389, 'Michelle-Vince', 'mvince@allstar.', '2997357767');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (787, 'Sandra-Giraldo', 'sandra.giraldo@', '1017267070');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (845, 'Lin-MacPherson', 'lin.macpherson@', '18428028');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (485, 'Donal-Harary', 'donal.harary@am', '1226769376');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (38, 'Goran-Heald', 'goran.heald@bri', '3472645645');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (360, 'Nikka-Thurman', 'nikka.thurman@p', '2846927587');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (889, 'Mary-Louise-Man', 'marylouisem@den', '4224062640');
commit;
prompt 300 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone)
values (902, 'Val-Steenburgen', 'val.steenburgen', '3058815776');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (928, 'Radney-Cruise', 'radney@y2market', '2166985774');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (848, 'Joaquim-Jane', 'jjane@netnumina', '2457612996');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (649, 'Grace-Brolin', 'grace.brolin@sp', '2631776471');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (857, 'Mika-Malkovich', 'm.malkovich@mat', '1759481672');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (645, 'Juan-Feore', 'j.feore@gha.com', '4126108396');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (511, 'Naomi-Mahoney', 'n.mahoney@kwraf', '2265481556');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (648, 'Beverley-Costa', 'beverley@author', '31213022');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (311, 'Juliet-Atlas', 'juliet.atlas@ss', '3211049956');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (988, 'Loren-Kapanka', 'loren.kapanka@m', '1159920677');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (765, 'Adrien-Thewlis', 'a.thewlis@hospi', '899719915');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (932, 'Carrie-Edmunds', 'c.edmunds@qls.d', '3756808272');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (303, 'Gary-Checker', 'gary.checker@bi', '1357333059');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (17, 'Chris-Connick', 'cconnick@medsou', '3210634331');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (68, 'Vertical-Belles', 'vertical.belles', '2388370667');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (279, 'Solomon-Uggams', 'solomon.uggams@', '2803639500');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (811, 'Bernard-Bryson', 'bernard.bryson@', '3029730528');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (215, 'Tommy-Aaron', 'tommy.aaron@big', '3469669115');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (942, 'King-Copeland', 'k.copeland@amer', '4083114705');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (302, 'Ted-Magnuson', 'ted@paintedword', '3720365951');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (535, 'Geoffrey-Playbo', 'geoffrey.playbo', '2072259994');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (269, 'Darius-Giannini', 'darius.g@youngi', '637064367');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (930, 'Ike-Forrest', 'ike.forrest@ahl', '1384427922');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (572, 'Treat-Dreyfuss', 'treat.dreyfuss@', '1059643543');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (549, 'Richie-Burke', 'richie@bashen.z', '2775887742');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (23, 'CeCe-Aaron', 'cece.aaron@swi.', '2832466084');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (234, 'Debi-Borden', 'debi.borden@nlx', '2761395904');
insert into CUSTOMER (cid, cname, cemail, cphone)
values (253, 'Eileen-Adkins', 'eadkins@inzone.', '671518750');
commit;
prompt 328 records loaded
prompt Loading DRESS...
insert into DRESS (did, length, color, price)
values (744, 124, 'Turquoise', 700);
insert into DRESS (did, length, color, price)
values (859, 112, 'Teal', 992);
insert into DRESS (did, length, color, price)
values (943, 128, 'Pink', 495);
insert into DRESS (did, length, color, price)
values (49, 120, 'Orange', 523);
insert into DRESS (did, length, color, price)
values (638, 189, 'Blue', 759);
insert into DRESS (did, length, color, price)
values (86, 117, 'Goldenrod', 647);
insert into DRESS (did, length, color, price)
values (586, 128, 'Red', 108);
insert into DRESS (did, length, color, price)
values (428, 172, 'Teal', 158);
insert into DRESS (did, length, color, price)
values (993, 168, 'Blue', 126);
insert into DRESS (did, length, color, price)
values (406, 128, 'Orange', 938);
insert into DRESS (did, length, color, price)
values (555, 123, 'Pink', 277);
insert into DRESS (did, length, color, price)
values (950, 161, 'Turquoise', 601);
insert into DRESS (did, length, color, price)
values (843, 187, 'Fuscia', 568);
insert into DRESS (did, length, color, price)
values (680, 132, 'Pink', 805);
insert into DRESS (did, length, color, price)
values (894, 158, 'Red', 282);
insert into DRESS (did, length, color, price)
values (890, 188, 'Orange', 162);
insert into DRESS (did, length, color, price)
values (621, 179, 'Khaki', 608);
insert into DRESS (did, length, color, price)
values (865, 121, 'Pink', 331);
insert into DRESS (did, length, color, price)
values (896, 115, 'Goldenrod', 552);
insert into DRESS (did, length, color, price)
values (855, 156, 'Green', 815);
insert into DRESS (did, length, color, price)
values (301, 131, 'Mauv', 446);
insert into DRESS (did, length, color, price)
values (936, 128, 'Yellow', 650);
insert into DRESS (did, length, color, price)
values (197, 144, 'Turquoise', 614);
insert into DRESS (did, length, color, price)
values (27, 157, 'Purple', 210);
insert into DRESS (did, length, color, price)
values (246, 167, 'Orange', 658);
insert into DRESS (did, length, color, price)
values (57, 137, 'Violet', 843);
insert into DRESS (did, length, color, price)
values (937, 106, 'Puce', 985);
insert into DRESS (did, length, color, price)
values (902, 118, 'Crimson', 638);
insert into DRESS (did, length, color, price)
values (84, 180, 'Blue', 377);
insert into DRESS (did, length, color, price)
values (771, 179, 'Khaki', 235);
insert into DRESS (did, length, color, price)
values (544, 142, 'Maroon', 381);
insert into DRESS (did, length, color, price)
values (401, 128, 'Indigo', 584);
insert into DRESS (did, length, color, price)
values (279, 167, 'Green', 410);
insert into DRESS (did, length, color, price)
values (626, 155, 'Green', 317);
insert into DRESS (did, length, color, price)
values (818, 103, 'Purple', 956);
insert into DRESS (did, length, color, price)
values (90, 175, 'Indigo', 703);
insert into DRESS (did, length, color, price)
values (436, 117, 'Orange', 118);
insert into DRESS (did, length, color, price)
values (867, 122, 'Blue', 878);
insert into DRESS (did, length, color, price)
values (125, 138, 'Goldenrod', 631);
insert into DRESS (did, length, color, price)
values (565, 111, 'Blue', 350);
insert into DRESS (did, length, color, price)
values (444, 185, 'Purple', 991);
insert into DRESS (did, length, color, price)
values (927, 132, 'Green', 210);
insert into DRESS (did, length, color, price)
values (342, 101, 'Indigo', 106);
insert into DRESS (did, length, color, price)
values (211, 175, 'Mauv', 454);
insert into DRESS (did, length, color, price)
values (87, 181, 'Fuscia', 490);
insert into DRESS (did, length, color, price)
values (553, 105, 'Blue', 908);
insert into DRESS (did, length, color, price)
values (456, 182, 'Red', 103);
insert into DRESS (did, length, color, price)
values (334, 125, 'Turquoise', 489);
insert into DRESS (did, length, color, price)
values (820, 112, 'Crimson', 890);
insert into DRESS (did, length, color, price)
values (567, 184, 'Goldenrod', 493);
insert into DRESS (did, length, color, price)
values (149, 129, 'Pink', 257);
insert into DRESS (did, length, color, price)
values (356, 180, 'Puce', 194);
insert into DRESS (did, length, color, price)
values (533, 122, 'Aquamarine', 733);
insert into DRESS (did, length, color, price)
values (952, 135, 'Crimson', 943);
insert into DRESS (did, length, color, price)
values (599, 174, 'Puce', 246);
insert into DRESS (did, length, color, price)
values (634, 159, 'Orange', 735);
insert into DRESS (did, length, color, price)
values (525, 122, 'Green', 185);
insert into DRESS (did, length, color, price)
values (373, 120, 'Aquamarine', 212);
insert into DRESS (did, length, color, price)
values (318, 139, 'Violet', 538);
insert into DRESS (did, length, color, price)
values (806, 116, 'Fuscia', 372);
insert into DRESS (did, length, color, price)
values (538, 158, 'Red', 683);
insert into DRESS (did, length, color, price)
values (395, 173, 'Yellow', 169);
insert into DRESS (did, length, color, price)
values (409, 148, 'Violet', 789);
insert into DRESS (did, length, color, price)
values (919, 108, 'Khaki', 114);
insert into DRESS (did, length, color, price)
values (61, 180, 'Goldenrod', 591);
insert into DRESS (did, length, color, price)
values (473, 129, 'Turquoise', 114);
insert into DRESS (did, length, color, price)
values (602, 118, 'Yellow', 627);
insert into DRESS (did, length, color, price)
values (415, 144, 'Violet', 300);
insert into DRESS (did, length, color, price)
values (147, 182, 'Mauv', 105);
insert into DRESS (did, length, color, price)
values (416, 149, 'Teal', 582);
insert into DRESS (did, length, color, price)
values (107, 114, 'Red', 461);
insert into DRESS (did, length, color, price)
values (443, 187, 'Green', 527);
insert into DRESS (did, length, color, price)
values (263, 177, 'Aquamarine', 441);
insert into DRESS (did, length, color, price)
values (296, 121, 'Puce', 254);
insert into DRESS (did, length, color, price)
values (209, 125, 'Pink', 782);
insert into DRESS (did, length, color, price)
values (106, 176, 'Purple', 401);
insert into DRESS (did, length, color, price)
values (288, 144, 'Indigo', 899);
insert into DRESS (did, length, color, price)
values (257, 158, 'Khaki', 613);
insert into DRESS (did, length, color, price)
values (397, 164, 'Crimson', 825);
insert into DRESS (did, length, color, price)
values (458, 142, 'Yellow', 876);
insert into DRESS (did, length, color, price)
values (640, 119, 'Indigo', 151);
insert into DRESS (did, length, color, price)
values (371, 182, 'Aquamarine', 769);
insert into DRESS (did, length, color, price)
values (734, 186, 'Pink', 205);
insert into DRESS (did, length, color, price)
values (591, 113, 'Puce', 422);
insert into DRESS (did, length, color, price)
values (143, 123, 'Crimson', 238);
insert into DRESS (did, length, color, price)
values (506, 178, 'Khaki', 924);
insert into DRESS (did, length, color, price)
values (970, 120, 'Purple', 962);
insert into DRESS (did, length, color, price)
values (823, 143, 'Fuscia', 274);
insert into DRESS (did, length, color, price)
values (98, 132, 'Green', 746);
insert into DRESS (did, length, color, price)
values (340, 106, 'Teal', 151);
insert into DRESS (did, length, color, price)
values (333, 140, 'Maroon', 213);
insert into DRESS (did, length, color, price)
values (266, 180, 'Green', 170);
insert into DRESS (did, length, color, price)
values (853, 161, 'Violet', 924);
insert into DRESS (did, length, color, price)
values (979, 159, 'Yellow', 481);
insert into DRESS (did, length, color, price)
values (685, 153, 'Pink', 336);
insert into DRESS (did, length, color, price)
values (733, 119, 'Puce', 357);
insert into DRESS (did, length, color, price)
values (368, 185, 'Mauv', 742);
insert into DRESS (did, length, color, price)
values (394, 138, 'Aquamarine', 377);
insert into DRESS (did, length, color, price)
values (838, 184, 'Orange', 291);
insert into DRESS (did, length, color, price)
values (156, 138, 'Maroon', 785);
commit;
prompt 100 records committed...
insert into DRESS (did, length, color, price)
values (819, 128, 'Crimson', 831);
insert into DRESS (did, length, color, price)
values (383, 187, 'Orange', 506);
insert into DRESS (did, length, color, price)
values (39, 100, 'Puce', 559);
insert into DRESS (did, length, color, price)
values (501, 153, 'Violet', 809);
insert into DRESS (did, length, color, price)
values (424, 155, 'Fuscia', 579);
insert into DRESS (did, length, color, price)
values (73, 186, 'Crimson', 308);
insert into DRESS (did, length, color, price)
values (552, 130, 'Violet', 742);
insert into DRESS (did, length, color, price)
values (335, 181, 'Yellow', 660);
insert into DRESS (did, length, color, price)
values (468, 167, 'Turquoise', 758);
insert into DRESS (did, length, color, price)
values (489, 178, 'Purple', 370);
insert into DRESS (did, length, color, price)
values (988, 122, 'Mauv', 705);
insert into DRESS (did, length, color, price)
values (564, 181, 'Yellow', 968);
insert into DRESS (did, length, color, price)
values (451, 187, 'Orange', 767);
insert into DRESS (did, length, color, price)
values (743, 153, 'Teal', 258);
insert into DRESS (did, length, color, price)
values (690, 178, 'Khaki', 904);
insert into DRESS (did, length, color, price)
values (437, 135, 'Khaki', 500);
insert into DRESS (did, length, color, price)
values (422, 140, 'Green', 792);
insert into DRESS (did, length, color, price)
values (135, 110, 'Fuscia', 189);
insert into DRESS (did, length, color, price)
values (571, 171, 'Red', 808);
insert into DRESS (did, length, color, price)
values (281, 109, 'Crimson', 731);
insert into DRESS (did, length, color, price)
values (677, 115, 'Teal', 940);
insert into DRESS (did, length, color, price)
values (215, 153, 'Orange', 468);
insert into DRESS (did, length, color, price)
values (725, 177, 'Aquamarine', 943);
insert into DRESS (did, length, color, price)
values (487, 162, 'Turquoise', 518);
insert into DRESS (did, length, color, price)
values (541, 145, 'Blue', 802);
insert into DRESS (did, length, color, price)
values (228, 176, 'Red', 629);
insert into DRESS (did, length, color, price)
values (72, 102, 'Yellow', 960);
insert into DRESS (did, length, color, price)
values (783, 168, 'Fuscia', 434);
insert into DRESS (did, length, color, price)
values (382, 124, 'Teal', 889);
insert into DRESS (did, length, color, price)
values (996, 160, 'Green', 729);
insert into DRESS (did, length, color, price)
values (747, 132, 'Green', 798);
insert into DRESS (did, length, color, price)
values (773, 102, 'Maroon', 747);
insert into DRESS (did, length, color, price)
values (414, 148, 'Puce', 557);
insert into DRESS (did, length, color, price)
values (995, 135, 'Maroon', 763);
insert into DRESS (did, length, color, price)
values (223, 120, 'Indigo', 187);
insert into DRESS (did, length, color, price)
values (459, 162, 'Yellow', 918);
insert into DRESS (did, length, color, price)
values (204, 138, 'Fuscia', 401);
insert into DRESS (did, length, color, price)
values (870, 178, 'Goldenrod', 368);
insert into DRESS (did, length, color, price)
values (438, 176, 'Mauv', 229);
insert into DRESS (did, length, color, price)
values (944, 152, 'Yellow', 107);
insert into DRESS (did, length, color, price)
values (955, 150, 'Teal', 869);
insert into DRESS (did, length, color, price)
values (457, 160, 'Puce', 160);
insert into DRESS (did, length, color, price)
values (732, 138, 'Crimson', 114);
insert into DRESS (did, length, color, price)
values (449, 189, 'Indigo', 533);
insert into DRESS (did, length, color, price)
values (269, 101, 'Red', 768);
insert into DRESS (did, length, color, price)
values (10, 171, 'Red', 559);
insert into DRESS (did, length, color, price)
values (134, 168, 'Fuscia', 815);
insert into DRESS (did, length, color, price)
values (230, 150, 'Turquoise', 723);
insert into DRESS (did, length, color, price)
values (51, 165, 'Red', 249);
insert into DRESS (did, length, color, price)
values (19, 129, 'Khaki', 277);
insert into DRESS (did, length, color, price)
values (231, 162, 'Orange', 699);
insert into DRESS (did, length, color, price)
values (155, 144, 'Aquamarine', 775);
insert into DRESS (did, length, color, price)
values (174, 151, 'Goldenrod', 481);
insert into DRESS (did, length, color, price)
values (387, 130, 'Turquoise', 930);
insert into DRESS (did, length, color, price)
values (980, 189, 'Red', 446);
insert into DRESS (did, length, color, price)
values (623, 118, 'Blue', 760);
insert into DRESS (did, length, color, price)
values (173, 105, 'Puce', 367);
insert into DRESS (did, length, color, price)
values (1, 107, 'Indigo', 596);
insert into DRESS (did, length, color, price)
values (517, 100, 'Turquoise', 361);
insert into DRESS (did, length, color, price)
values (210, 130, 'Aquamarine', 508);
insert into DRESS (did, length, color, price)
values (213, 177, 'Khaki', 149);
insert into DRESS (did, length, color, price)
values (562, 168, 'Green', 321);
insert into DRESS (did, length, color, price)
values (270, 117, 'Teal', 215);
insert into DRESS (did, length, color, price)
values (997, 190, 'Orange', 111);
insert into DRESS (did, length, color, price)
values (846, 111, 'Indigo', 664);
insert into DRESS (did, length, color, price)
values (949, 152, 'Khaki', 445);
insert into DRESS (did, length, color, price)
values (16, 126, 'Violet', 532);
insert into DRESS (did, length, color, price)
values (829, 161, 'Fuscia', 356);
insert into DRESS (did, length, color, price)
values (784, 112, 'Purple', 665);
insert into DRESS (did, length, color, price)
values (326, 147, 'Purple', 295);
insert into DRESS (did, length, color, price)
values (88, 158, 'Green', 118);
insert into DRESS (did, length, color, price)
values (347, 182, 'Mauv', 917);
insert into DRESS (did, length, color, price)
values (399, 179, 'Crimson', 806);
insert into DRESS (did, length, color, price)
values (133, 132, 'Orange', 289);
insert into DRESS (did, length, color, price)
values (717, 107, 'Teal', 561);
insert into DRESS (did, length, color, price)
values (169, 117, 'Khaki', 558);
insert into DRESS (did, length, color, price)
values (895, 158, 'Yellow', 297);
insert into DRESS (did, length, color, price)
values (749, 181, 'Turquoise', 575);
insert into DRESS (did, length, color, price)
values (947, 126, 'Yellow', 343);
insert into DRESS (did, length, color, price)
values (302, 108, 'Red', 153);
insert into DRESS (did, length, color, price)
values (167, 102, 'Green', 505);
insert into DRESS (did, length, color, price)
values (736, 118, 'Pink', 847);
insert into DRESS (did, length, color, price)
values (946, 139, 'Blue', 536);
insert into DRESS (did, length, color, price)
values (256, 132, 'Pink', 800);
insert into DRESS (did, length, color, price)
values (431, 112, 'Turquoise', 882);
insert into DRESS (did, length, color, price)
values (573, 182, 'Turquoise', 475);
insert into DRESS (did, length, color, price)
values (32, 134, 'Indigo', 308);
insert into DRESS (did, length, color, price)
values (875, 138, 'Turquoise', 783);
insert into DRESS (did, length, color, price)
values (647, 100, 'Crimson', 322);
insert into DRESS (did, length, color, price)
values (4, 112, 'Green', 210);
insert into DRESS (did, length, color, price)
values (45, 116, 'Blue', 129);
insert into DRESS (did, length, color, price)
values (754, 136, 'Blue', 332);
insert into DRESS (did, length, color, price)
values (942, 143, 'Mauv', 485);
insert into DRESS (did, length, color, price)
values (466, 128, 'Red', 242);
insert into DRESS (did, length, color, price)
values (82, 104, 'Aquamarine', 573);
insert into DRESS (did, length, color, price)
values (227, 120, 'Mauv', 563);
insert into DRESS (did, length, color, price)
values (989, 113, 'Fuscia', 225);
insert into DRESS (did, length, color, price)
values (303, 164, 'Goldenrod', 624);
insert into DRESS (did, length, color, price)
values (153, 149, 'Maroon', 586);
insert into DRESS (did, length, color, price)
values (366, 169, 'Aquamarine', 141);
commit;
prompt 200 records committed...
insert into DRESS (did, length, color, price)
values (50, 185, 'Crimson', 536);
insert into DRESS (did, length, color, price)
values (275, 104, 'Yellow', 565);
insert into DRESS (did, length, color, price)
values (140, 179, 'Khaki', 286);
insert into DRESS (did, length, color, price)
values (328, 143, 'Turquoise', 749);
insert into DRESS (did, length, color, price)
values (268, 178, 'Crimson', 161);
insert into DRESS (did, length, color, price)
values (25, 122, 'Red', 869);
insert into DRESS (did, length, color, price)
values (528, 133, 'Purple', 339);
insert into DRESS (did, length, color, price)
values (879, 169, 'Yellow', 845);
insert into DRESS (did, length, color, price)
values (845, 129, 'Turquoise', 168);
insert into DRESS (did, length, color, price)
values (402, 146, 'Puce', 669);
insert into DRESS (did, length, color, price)
values (329, 116, 'Yellow', 706);
insert into DRESS (did, length, color, price)
values (112, 114, 'Puce', 579);
insert into DRESS (did, length, color, price)
values (620, 182, 'Purple', 112);
insert into DRESS (did, length, color, price)
values (657, 183, 'Orange', 351);
insert into DRESS (did, length, color, price)
values (13, 139, 'Yellow', 593);
insert into DRESS (did, length, color, price)
values (80, 189, 'Green', 535);
insert into DRESS (did, length, color, price)
values (886, 168, 'Puce', 174);
insert into DRESS (did, length, color, price)
values (188, 140, 'Blue', 674);
insert into DRESS (did, length, color, price)
values (247, 187, 'Green', 835);
insert into DRESS (did, length, color, price)
values (376, 166, 'Pink', 927);
insert into DRESS (did, length, color, price)
values (63, 165, 'Aquamarine', 210);
insert into DRESS (did, length, color, price)
values (372, 103, 'Aquamarine', 751);
insert into DRESS (did, length, color, price)
values (226, 102, 'Maroon', 367);
insert into DRESS (did, length, color, price)
values (665, 118, 'Puce', 284);
insert into DRESS (did, length, color, price)
values (14, 135, 'Aquamarine', 465);
insert into DRESS (did, length, color, price)
values (240, 151, 'Mauv', 112);
insert into DRESS (did, length, color, price)
values (994, 108, 'Red', 866);
insert into DRESS (did, length, color, price)
values (312, 174, 'Teal', 566);
insert into DRESS (did, length, color, price)
values (718, 134, 'Yellow', 850);
insert into DRESS (did, length, color, price)
values (96, 174, 'Yellow', 547);
insert into DRESS (did, length, color, price)
values (866, 165, 'Maroon', 136);
insert into DRESS (did, length, color, price)
values (959, 166, 'Goldenrod', 172);
insert into DRESS (did, length, color, price)
values (559, 105, 'Purple', 224);
insert into DRESS (did, length, color, price)
values (826, 154, 'Green', 348);
insert into DRESS (did, length, color, price)
values (159, 167, 'Blue', 263);
insert into DRESS (did, length, color, price)
values (47, 130, 'Crimson', 361);
insert into DRESS (did, length, color, price)
values (187, 166, 'Aquamarine', 677);
insert into DRESS (did, length, color, price)
values (877, 117, 'Maroon', 567);
insert into DRESS (did, length, color, price)
values (574, 179, 'Fuscia', 366);
insert into DRESS (did, length, color, price)
values (67, 155, 'Goldenrod', 912);
insert into DRESS (did, length, color, price)
values (479, 137, 'Maroon', 147);
insert into DRESS (did, length, color, price)
values (419, 133, 'Violet', 700);
insert into DRESS (did, length, color, price)
values (292, 143, 'Purple', 565);
insert into DRESS (did, length, color, price)
values (526, 126, 'Violet', 944);
insert into DRESS (did, length, color, price)
values (508, 122, 'Khaki', 617);
insert into DRESS (did, length, color, price)
values (476, 156, 'Khaki', 602);
insert into DRESS (did, length, color, price)
values (671, 155, 'Orange', 471);
insert into DRESS (did, length, color, price)
values (713, 187, 'Maroon', 963);
insert into DRESS (did, length, color, price)
values (921, 179, 'Orange', 551);
insert into DRESS (did, length, color, price)
values (824, 175, 'Mauv', 902);
insert into DRESS (did, length, color, price)
values (848, 103, 'Violet', 913);
insert into DRESS (did, length, color, price)
values (928, 100, 'Crimson', 463);
insert into DRESS (did, length, color, price)
values (926, 107, 'Violet', 499);
insert into DRESS (did, length, color, price)
values (761, 136, 'Aquamarine', 907);
insert into DRESS (did, length, color, price)
values (309, 177, 'Goldenrod', 519);
insert into DRESS (did, length, color, price)
values (219, 148, 'Pink', 981);
insert into DRESS (did, length, color, price)
values (532, 111, 'Puce', 484);
insert into DRESS (did, length, color, price)
values (563, 181, 'Red', 575);
insert into DRESS (did, length, color, price)
values (635, 144, 'Puce', 333);
insert into DRESS (did, length, color, price)
values (507, 163, 'Yellow', 440);
insert into DRESS (did, length, color, price)
values (898, 133, 'Maroon', 941);
insert into DRESS (did, length, color, price)
values (658, 130, 'Goldenrod', 775);
insert into DRESS (did, length, color, price)
values (756, 187, 'Puce', 726);
insert into DRESS (did, length, color, price)
values (369, 190, 'Maroon', 999);
insert into DRESS (did, length, color, price)
values (798, 151, 'Blue', 490);
insert into DRESS (did, length, color, price)
values (362, 129, 'Teal', 222);
insert into DRESS (did, length, color, price)
values (693, 161, 'Crimson', 745);
insert into DRESS (did, length, color, price)
values (596, 109, 'Blue', 313);
insert into DRESS (did, length, color, price)
values (675, 180, 'Goldenrod', 413);
insert into DRESS (did, length, color, price)
values (365, 140, 'Fuscia', 304);
insert into DRESS (did, length, color, price)
values (453, 142, 'Aquamarine', 299);
insert into DRESS (did, length, color, price)
values (277, 119, 'Crimson', 300);
insert into DRESS (did, length, color, price)
values (447, 125, 'Orange', 295);
insert into DRESS (did, length, color, price)
values (276, 104, 'Crimson', 751);
insert into DRESS (did, length, color, price)
values (920, 113, 'Pink', 334);
insert into DRESS (did, length, color, price)
values (297, 100, 'Mauv', 355);
insert into DRESS (did, length, color, price)
values (662, 170, 'Fuscia', 813);
insert into DRESS (did, length, color, price)
values (885, 176, 'Aquamarine', 800);
insert into DRESS (did, length, color, price)
values (199, 160, 'Orange', 999);
insert into DRESS (did, length, color, price)
values (352, 105, 'Mauv', 966);
insert into DRESS (did, length, color, price)
values (619, 133, 'Teal', 269);
insert into DRESS (did, length, color, price)
values (184, 121, 'Aquamarine', 344);
insert into DRESS (did, length, color, price)
values (847, 129, 'Maroon', 587);
insert into DRESS (did, length, color, price)
values (308, 132, 'Crimson', 839);
insert into DRESS (did, length, color, price)
values (482, 102, 'Aquamarine', 856);
insert into DRESS (did, length, color, price)
values (282, 114, 'Indigo', 836);
insert into DRESS (did, length, color, price)
values (698, 163, 'Purple', 384);
insert into DRESS (did, length, color, price)
values (750, 133, 'Turquoise', 130);
insert into DRESS (did, length, color, price)
values (361, 143, 'Maroon', 450);
insert into DRESS (did, length, color, price)
values (956, 169, 'Turquoise', 315);
insert into DRESS (did, length, color, price)
values (499, 148, 'Puce', 887);
insert into DRESS (did, length, color, price)
values (510, 106, 'Puce', 740);
insert into DRESS (did, length, color, price)
values (460, 116, 'Puce', 653);
insert into DRESS (did, length, color, price)
values (320, 158, 'Orange', 766);
insert into DRESS (did, length, color, price)
values (589, 108, 'Purple', 835);
insert into DRESS (did, length, color, price)
values (95, 143, 'Violet', 510);
insert into DRESS (did, length, color, price)
values (321, 130, 'Teal', 829);
insert into DRESS (did, length, color, price)
values (922, 190, 'Teal', 440);
insert into DRESS (did, length, color, price)
values (953, 185, 'Purple', 774);
insert into DRESS (did, length, color, price)
values (161, 104, 'Puce', 538);
commit;
prompt 300 records committed...
insert into DRESS (did, length, color, price)
values (289, 113, 'Turquoise', 841);
insert into DRESS (did, length, color, price)
values (446, 101, 'Maroon', 116);
insert into DRESS (did, length, color, price)
values (529, 123, 'Violet', 181);
insert into DRESS (did, length, color, price)
values (425, 162, 'Purple', 640);
insert into DRESS (did, length, color, price)
values (102, 169, 'Pink', 343);
insert into DRESS (did, length, color, price)
values (130, 120, 'Indigo', 423);
insert into DRESS (did, length, color, price)
values (280, 173, 'Khaki', 571);
insert into DRESS (did, length, color, price)
values (336, 186, 'Orange', 701);
insert into DRESS (did, length, color, price)
values (523, 106, 'Khaki', 570);
insert into DRESS (did, length, color, price)
values (705, 171, 'Red', 980);
insert into DRESS (did, length, color, price)
values (617, 172, 'Indigo', 961);
insert into DRESS (did, length, color, price)
values (769, 101, 'Crimson', 270);
insert into DRESS (did, length, color, price)
values (396, 141, 'Purple', 181);
insert into DRESS (did, length, color, price)
values (384, 151, 'Red', 896);
insert into DRESS (did, length, color, price)
values (697, 133, 'Aquamarine', 719);
insert into DRESS (did, length, color, price)
values (137, 108, 'Khaki', 731);
insert into DRESS (did, length, color, price)
values (200, 178, 'Aquamarine', 895);
insert into DRESS (did, length, color, price)
values (64, 106, 'Maroon', 800);
insert into DRESS (did, length, color, price)
values (9, 118, 'Aquamarine', 808);
insert into DRESS (did, length, color, price)
values (195, 120, 'Red', 990);
insert into DRESS (did, length, color, price)
values (58, 169, 'Red', 555);
insert into DRESS (did, length, color, price)
values (513, 114, 'Maroon', 436);
insert into DRESS (did, length, color, price)
values (914, 141, 'Mauv', 836);
insert into DRESS (did, length, color, price)
values (912, 141, 'Purple', 747);
insert into DRESS (did, length, color, price)
values (576, 149, 'Orange', 329);
insert into DRESS (did, length, color, price)
values (284, 170, 'Purple', 864);
insert into DRESS (did, length, color, price)
values (629, 178, 'Indigo', 364);
insert into DRESS (did, length, color, price)
values (642, 138, 'Blue', 899);
insert into DRESS (did, length, color, price)
values (817, 182, 'Blue', 646);
commit;
prompt 329 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (101, ' ''Alice Smith''', ' ''alice@ex.com''', ' ''050-123-0101''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (102, ' ''Bob Johnson''', ' ''bob@ex.com''', ' ''050-123-0102''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (104, ' ''Diana King''', ' ''diana@ex.com''', ' ''050-123-0104''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (106, ' ''Fiona Brown''', ' ''fiona@ex.com''', ' ''050-123-0106''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (109, ' ''Ian Clark''', ' ''ian@ex.com''', ' ''050-123-0109''');
insert into EMPLOYEE (eid, ename, eemail, ephone)
values (110, ' ''Julia Lewis''', ' ''julia@ex.com''', ' ''050-123-0110''');
commit;
prompt 6 records loaded
prompt Loading ORDERS...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (399, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('08-08-2022', 'dd-mm-yyyy'), 110, 914, 201);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (993, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 102, 446, 617);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (572, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 247, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (488, to_date('17-05-2024', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 102, 482, 586);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (796, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 110, 397, 382);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (176, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 101, 280, 909);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (867, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('08-05-2022', 'dd-mm-yyyy'), 110, 647, 797);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (691, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('30-07-2022', 'dd-mm-yyyy'), 109, 437, 29);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (307, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 106, 197, 26);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (838, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('11-08-2022', 'dd-mm-yyyy'), 110, 823, 566);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (179, to_date('27-09-2022', 'dd-mm-yyyy'), to_date('19-11-2022', 'dd-mm-yyyy'), 102, 457, 147);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (887, to_date('26-10-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 106, 769, 645);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (512, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 106, 277, 796);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (723, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 104, 174, 32);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (536, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'), 109, 617, 311);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (589, to_date('31-01-2023', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'), 109, 134, 415);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (638, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), 110, 736, 844);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (466, to_date('23-03-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'), 109, 466, 565);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (156, to_date('05-04-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 101, 438, 846);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (324, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), 109, 49, 551);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (419, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('02-04-2022', 'dd-mm-yyyy'), 110, 453, 769);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (789, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), 101, 329, 415);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (661, to_date('21-01-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 101, 280, 993);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (975, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 109, 640, 765);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (710, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 106, 369, 959);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (499, to_date('04-05-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 104, 761, 945);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (587, to_date('28-10-2022', 'dd-mm-yyyy'), to_date('03-04-2022', 'dd-mm-yyyy'), 106, 369, 139);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (946, to_date('14-11-2022', 'dd-mm-yyyy'), to_date('08-02-2022', 'dd-mm-yyyy'), 106, 246, 551);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (406, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 102, 620, 586);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (303, to_date('27-04-2024', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 101, 383, 656);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (216, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 106, 204, 787);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (125, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 110, 944, 967);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (681, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 147, 108);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (438, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'), 110, 268, 618);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (672, to_date('07-05-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 102, 67, 751);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (540, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('11-09-2022', 'dd-mm-yyyy'), 104, 855, 405);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (106, to_date('27-02-2024', 'dd-mm-yyyy'), to_date('14-02-2022', 'dd-mm-yyyy'), 109, 928, 618);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (624, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('07-03-2022', 'dd-mm-yyyy'), 109, 80, 434);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (615, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-12-2022', 'dd-mm-yyyy'), 104, 371, 53);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (675, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'), 101, 693, 302);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (728, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 104, 396, 535);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (550, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 102, 956, 635);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (255, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 102, 395, 270);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (641, to_date('09-10-2023', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 110, 713, 936);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (10, to_date('22-03-2022', 'dd-mm-yyyy'), to_date('13-01-2023', 'dd-mm-yyyy'), 106, 920, 842);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (321, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 106, 297, 487);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (389, to_date('23-01-2022', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 106, 620, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (343, to_date('21-04-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 276, 389);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (818, to_date('10-07-2023', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 104, 50, 876);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (344, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 110, 626, 437);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (342, to_date('08-10-2022', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 104, 571, 900);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (835, to_date('24-06-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 104, 320, 201);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (866, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 110, 529, 660);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (317, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 106, 886, 863);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (814, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 104, 333, 757);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (428, to_date('26-11-2022', 'dd-mm-yyyy'), to_date('04-03-2022', 'dd-mm-yyyy'), 109, 98, 104);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (223, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-04-2022', 'dd-mm-yyyy'), 102, 875, 320);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (242, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 102, 510, 849);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (537, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 101, 289, 18);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (120, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'), 106, 240, 599);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (622, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 197, 797);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (761, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'), 101, 847, 828);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (748, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 110, 875, 29);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (326, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('05-04-2022', 'dd-mm-yyyy'), 106, 134, 889);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (590, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('13-01-2022', 'dd-mm-yyyy'), 110, 58, 528);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (468, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('16-07-2022', 'dd-mm-yyyy'), 106, 73, 234);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (931, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 101, 137, 482);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (386, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('26-04-2022', 'dd-mm-yyyy'), 109, 894, 377);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (502, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'), 102, 675, 746);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (601, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 101, 277, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (650, to_date('09-02-2024', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 101, 32, 428);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (757, to_date('08-05-2022', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), 101, 416, 316);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (541, to_date('04-03-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'), 106, 213, 218);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (842, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 109, 384, 484);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (699, to_date('19-02-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 312, 5);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (494, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 215, 462);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (652, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 109, 57, 857);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (397, to_date('05-03-2022', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 106, 288, 311);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (788, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('12-03-2022', 'dd-mm-yyyy'), 102, 685, 879);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (555, to_date('24-06-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 102, 256, 508);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (515, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 110, 818, 389);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (413, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 102, 366, 41);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (563, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 102, 995, 224);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (148, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 101, 396, 256);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (836, to_date('27-04-2023', 'dd-mm-yyyy'), to_date('02-06-2022', 'dd-mm-yyyy'), 110, 195, 414);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (472, to_date('21-01-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'), 110, 853, 287);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (183, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 110, 979, 749);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (26, to_date('25-02-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 596, 557);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (548, to_date('07-02-2022', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'), 101, 771, 675);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (186, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 101, 47, 972);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (562, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 101, 459, 374);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (313, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('22-01-2022', 'dd-mm-yyyy'), 101, 680, 486);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (358, to_date('20-07-2022', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 109, 371, 377);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (337, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'), 101, 898, 689);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (643, to_date('15-04-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 101, 80, 780);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (806, to_date('29-01-2023', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 104, 914, 38);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (275, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('10-03-2022', 'dd-mm-yyyy'), 101, 853, 318);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (815, to_date('16-05-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 104, 510, 328);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (870, to_date('29-04-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 104, 153, 342);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (424, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 106, 297, 487);
commit;
prompt 100 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (205, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 101, 215, 346);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (482, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 110, 602, 757);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (432, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 106, 950, 858);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (981, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('24-12-2022', 'dd-mm-yyyy'), 101, 269, 879);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (361, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 17);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (339, to_date('31-08-2022', 'dd-mm-yyyy'), to_date('27-03-2022', 'dd-mm-yyyy'), 109, 416, 740);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (266, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), 104, 143, 367);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (35, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 102, 227, 617);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (287, to_date('02-01-2022', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 104, 384, 484);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (431, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 104, 635, 26);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (868, to_date('17-02-2024', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 102, 997, 390);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (625, to_date('24-10-2022', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 110, 167, 156);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (703, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 110, 416, 195);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (717, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 102, 424, 858);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (513, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 104, 169, 177);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (393, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 106, 747, 408);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (315, to_date('15-03-2024', 'dd-mm-yyyy'), to_date('25-04-2022', 'dd-mm-yyyy'), 106, 373, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (885, to_date('02-06-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 104, 565, 595);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (915, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 102, 90, 281);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (234, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 110, 806, 916);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (448, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 109, 14, 91);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (400, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'), 104, 947, 26);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (46, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('26-03-2022', 'dd-mm-yyyy'), 109, 82, 955);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (20, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 101, 576, 618);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (742, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'), 110, 210, 378);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (285, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('24-04-2022', 'dd-mm-yyyy'), 104, 890, 1);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (658, to_date('24-04-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 110, 717, 955);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (561, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 104, 921, 955);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (232, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('18-04-2023', 'dd-mm-yyyy'), 102, 944, 772);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (514, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('22-02-2022', 'dd-mm-yyyy'), 106, 372, 367);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (951, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('23-06-2022', 'dd-mm-yyyy'), 104, 525, 780);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (773, to_date('02-07-2022', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 102, 937, 889);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (480, to_date('11-05-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 109, 446, 571);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (959, to_date('22-06-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 104, 928, 536);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (147, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 109, 263, 270);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (763, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 109, 263, 632);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (298, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), 104, 211, 73);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (864, to_date('30-12-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 680, 269);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (189, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), 106, 302, 749);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (978, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('26-05-2022', 'dd-mm-yyyy'), 106, 544, 872);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (779, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('03-03-2022', 'dd-mm-yyyy'), 110, 818, 14);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (404, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 266, 481);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (290, to_date('15-07-2022', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 110, 125, 491);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (598, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 85);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (47, to_date('31-03-2024', 'dd-mm-yyyy'), to_date('15-02-2022', 'dd-mm-yyyy'), 101, 959, 743);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (425, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 101, 629, 166);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (750, to_date('01-06-2022', 'dd-mm-yyyy'), to_date('25-06-2022', 'dd-mm-yyyy'), 101, 167, 759);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (720, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), 106, 806, 620);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (134, to_date('17-06-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 109, 508, 395);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (456, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 104, 371, 678);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (495, to_date('10-04-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 102, 64, 5);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (956, to_date('30-03-2023', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 101, 482, 622);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (770, to_date('30-03-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 106, 246, 71);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (686, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'), 102, 95, 777);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (104, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('28-02-2022', 'dd-mm-yyyy'), 110, 952, 895);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (338, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 106, 352, 491);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (738, to_date('24-11-2022', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 104, 532, 508);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (972, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 109, 756, 256);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (778, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 110, 541, 341);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (268, to_date('31-07-2022', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 106, 210, 495);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (21, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 102, 665, 256);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (530, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 101, 936, 17);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (606, to_date('31-08-2023', 'dd-mm-yyyy'), to_date('04-03-2022', 'dd-mm-yyyy'), 110, 647, 791);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (443, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 102, 959, 649);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (170, to_date('14-12-2022', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), 106, 39, 895);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (994, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'), 106, 453, 738);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (460, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), 104, 88, 292);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (76, to_date('22-06-2023', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 102, 226, 63);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (62, to_date('14-04-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 110, 980, 754);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (567, to_date('05-09-2022', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'), 104, 247, 119);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (70, to_date('23-10-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), 102, 437, 32);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (942, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 101, 894, 994);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (715, to_date('05-12-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 101, 275, 503);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (267, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'), 104, 161, 806);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (872, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 102, 19, 586);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (934, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 110, 416, 66);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (379, to_date('11-07-2023', 'dd-mm-yyyy'), to_date('25-02-2022', 'dd-mm-yyyy'), 102, 292, 732);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (507, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 109, 955, 367);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (614, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('15-11-2022', 'dd-mm-yyyy'), 110, 456, 99);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (810, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 101, 84, 63);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (426, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('12-01-2022', 'dd-mm-yyyy'), 102, 13, 797);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (29, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'), 109, 980, 848);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (382, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('31-03-2022', 'dd-mm-yyyy'), 109, 67, 330);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (42, to_date('27-07-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 110, 642, 293);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (374, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 109, 321, 701);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (114, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'), 106, 528, 167);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (439, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 619, 292);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (901, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 102, 87, 357);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (631, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), 109, 296, 497);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (476, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), 109, 947, 77);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (214, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 956, 89);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (999, to_date('14-05-2023', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 446, 18);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (506, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 106, 98, 907);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (853, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 106, 414, 808);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (937, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 106, 80, 572);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (173, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 104, 61, 985);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (283, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'), 102, 914, 85);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (271, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 104, 135, 964);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (355, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 102, 853, 565);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (97, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), 104, 675, 395);
commit;
prompt 200 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (560, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 101, 853, 316);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (278, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('09-04-2022', 'dd-mm-yyyy'), 110, 167, 854);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (546, to_date('09-04-2024', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 110, 137, 30);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (306, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 914, 740);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (353, to_date('15-02-2022', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 102, 806, 375);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (912, to_date('18-03-2023', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'), 104, 479, 872);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (629, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), 109, 553, 746);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (153, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('15-01-2022', 'dd-mm-yyyy'), 106, 1, 282);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (531, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 109, 879, 713);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (573, to_date('25-05-2022', 'dd-mm-yyyy'), to_date('24-03-2022', 'dd-mm-yyyy'), 110, 147, 567);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (737, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('13-02-2022', 'dd-mm-yyyy'), 101, 387, 865);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (674, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 101, 125, 486);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (996, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 110, 428, 236);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (706, to_date('27-01-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 106, 761, 842);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (75, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('30-09-2022', 'dd-mm-yyyy'), 110, 947, 399);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (37, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 102, 211, 298);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (166, to_date('25-09-2022', 'dd-mm-yyyy'), to_date('28-10-2022', 'dd-mm-yyyy'), 102, 443, 495);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (314, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 106, 997, 935);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (947, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('05-03-2022', 'dd-mm-yyyy'), 101, 953, 52);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (776, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 371, 303);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (985, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 102, 61, 415);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (963, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 109, 195, 588);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (523, to_date('09-02-2022', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 110, 468, 85);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (410, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 125, 949);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (0, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 102, 372, 317);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (558, to_date('17-04-2022', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 104, 10, 677);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (219, to_date('18-02-2024', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), 101, 979, 535);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (708, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'), 110, 501, 486);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (824, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 109, 853, 145);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (5, to_date('26-01-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 110, 263, 791);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (677, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 104, 750, 9);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (663, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 110, 223, 218);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (481, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), 106, 848, 514);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (786, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 109, 533, 645);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (449, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 101, 155, 377);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (341, to_date('22-09-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 912, 786);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (857, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 102, 64, 484);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (254, to_date('18-05-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 106, 277, 656);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (799, to_date('30-07-2022', 'dd-mm-yyyy'), to_date('14-01-2022', 'dd-mm-yyyy'), 104, 647, 928);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (949, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), 102, 936, 11);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (39, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'), 104, 769, 769);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (924, to_date('15-09-2022', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 102, 402, 234);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (740, to_date('10-09-2022', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 104, 937, 84);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (4, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'), 109, 847, 253);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (444, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 106, 446, 34);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (128, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), 109, 747, 147);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (902, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), 110, 922, 633);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (367, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 106, 356, 316);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (782, to_date('22-01-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 102, 713, 844);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (260, to_date('08-03-2023', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'), 110, 680, 115);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (15, to_date('22-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 109, 829, 675);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (475, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('11-02-2022', 'dd-mm-yyyy'), 104, 995, 12);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (855, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 109, 247, 70);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (116, to_date('02-08-2023', 'dd-mm-yyyy'), to_date('09-09-2022', 'dd-mm-yyyy'), 109, 501, 689);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (416, to_date('21-02-2023', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 109, 443, 755);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (990, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), 106, 988, 299);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (218, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('25-12-2022', 'dd-mm-yyyy'), 106, 63, 523);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (251, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('15-03-2022', 'dd-mm-yyyy'), 110, 586, 839);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (265, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'), 106, 288, 316);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (417, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 106, 419, 927);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (33, to_date('05-04-2024', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 104, 211, 231);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (66, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 102, 555, 701);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (398, to_date('19-12-2022', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 104, 95, 635);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (819, to_date('19-08-2023', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 101, 269, 495);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (731, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 104, 372, 215);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (727, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 101, 416, 554);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (458, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('16-05-2022', 'dd-mm-yyyy'), 106, 308, 972);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (78, to_date('04-03-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'), 110, 513, 440);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (995, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 102, 750, 311);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (405, to_date('25-10-2022', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 101, 949, 360);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (979, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('20-10-2022', 'dd-mm-yyyy'), 109, 507, 97);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (263, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 104, 489, 565);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (768, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 102, 926, 293);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (160, to_date('30-05-2022', 'dd-mm-yyyy'), to_date('28-05-2022', 'dd-mm-yyyy'), 106, 394, 755);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (180, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 109, 870, 77);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (958, to_date('20-09-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 109, 921, 599);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (231, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 102, 750, 839);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (38, to_date('12-04-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 101, 919, 919);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (107, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 102, 451, 434);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (903, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'), 102, 538, 469);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (894, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'), 104, 859, 73);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (518, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('19-01-2022', 'dd-mm-yyyy'), 109, 112, 599);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (802, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('04-06-2022', 'dd-mm-yyyy'), 110, 246, 533);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (369, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('04-04-2022', 'dd-mm-yyyy'), 104, 321, 976);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (967, to_date('04-04-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'), 101, 896, 99);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (725, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 101, 361, 618);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (659, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 110, 573, 268);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (83, to_date('19-04-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 101, 227, 660);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (211, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 101, 482, 764);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (918, to_date('08-08-2022', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 101, 994, 282);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (791, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 104, 275, 420);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (364, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('11-11-2022', 'dd-mm-yyyy'), 104, 195, 291);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (805, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'), 102, 460, 790);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (163, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 366, 469);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (932, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 106, 268, 224);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (653, to_date('30-08-2022', 'dd-mm-yyyy'), to_date('25-05-2022', 'dd-mm-yyyy'), 102, 671, 656);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (721, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 102, 9, 77);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (793, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('17-07-2022', 'dd-mm-yyyy'), 106, 19, 401);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (762, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 101, 499, 283);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (437, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 110, 88, 484);
commit;
prompt 300 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (673, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 312, 508);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (627, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 106, 890, 659);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (139, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 104, 705, 480);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (833, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 109, 211, 152);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (597, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('23-02-2022', 'dd-mm-yyyy'), 104, 438, 137);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (453, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 110, 425, 330);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (620, to_date('18-09-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 102, 402, 523);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (689, to_date('11-09-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 109, 32, 533);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (64, to_date('12-03-2022', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), 101, 223, 534);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (40, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'), 109, 280, 755);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (3, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'), 101, 769, 73);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (865, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 102, 867, 600);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (430, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 109, 63, 64);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (610, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'), 106, 761, 675);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (556, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 109, 489, 618);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (310, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('20-09-2022', 'dd-mm-yyyy'), 110, 308, 73);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (647, to_date('07-06-2022', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 102, 846, 527);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (886, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'), 102, 482, 292);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (602, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 106, 754, 139);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (119, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 104, 473, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (888, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('19-03-2022', 'dd-mm-yyyy'), 106, 736, 70);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (693, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), 101, 268, 902);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (754, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 109, 87, 551);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (687, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), 101, 13, 848);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (871, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 104, 562, 198);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (713, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), 104, 553, 71);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (331, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 104, 329, 120);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (736, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'), 106, 437, 328);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (154, to_date('16-01-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), 106, 296, 117);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid)
values (709, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 106, 947, 352);
commit;
prompt 330 records loaded
prompt Loading LAUNDRY...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (620, 72, 'ATX Forms', to_date('13-04-2024', 'dd-mm-yyyy'), 937);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (907, 315, 'Computer Source', to_date('08-06-2023', 'dd-mm-yyyy'), 985);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (820, 304, 'Anheuser-Busch ', to_date('07-04-2022', 'dd-mm-yyyy'), 39);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (606, 256, 'Amerisource Fun', to_date('27-01-2022', 'dd-mm-yyyy'), 15);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (923, 271, 'Paisley Consult', to_date('01-09-2022', 'dd-mm-yyyy'), 205);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (801, 271, 'IVCi', to_date('27-04-2022', 'dd-mm-yyyy'), 134);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (42, 325, 'Sterling Financ', to_date('30-05-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (400, 67, 'Biosite', to_date('22-07-2022', 'dd-mm-yyyy'), 148);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (1, 247, 'Mindworks', to_date('18-11-2023', 'dd-mm-yyyy'), 271);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (721, 131, 'Dillard’s', to_date('05-03-2024', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (445, 193, 'Meridian Gold', to_date('07-02-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (34, 178, 'Solution Builde', to_date('27-03-2023', 'dd-mm-yyyy'), 615);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (992, 229, 'Sandy Spring Ba', to_date('12-03-2022', 'dd-mm-yyyy'), 306);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (429, 350, 'Prosperity Banc', to_date('10-12-2023', 'dd-mm-yyyy'), 46);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (658, 262, 'Calence', to_date('09-04-2022', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (450, 153, 'U.S. Government', to_date('23-05-2022', 'dd-mm-yyyy'), 675);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (167, 169, 'S.C. Johnson & ', to_date('17-03-2024', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (938, 341, 'Infinity Contra', to_date('03-08-2023', 'dd-mm-yyyy'), 934);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (238, 52, 'MindIQ', to_date('03-09-2023', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (743, 329, 'Synovis Life Te', to_date('04-03-2022', 'dd-mm-yyyy'), 721);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (375, 229, 'AT&T Corp.', to_date('03-09-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (933, 90, 'SPS Commerce', to_date('12-12-2022', 'dd-mm-yyyy'), 331);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (828, 161, 'Synhrgy HR Tech', to_date('28-08-2023', 'dd-mm-yyyy'), 405);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (505, 164, 'Data Company', to_date('19-08-2022', 'dd-mm-yyyy'), 481);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (240, 50, 'Analytics Opera', to_date('10-01-2022', 'dd-mm-yyyy'), 358);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (266, 94, 'Auction Systems', to_date('13-04-2024', 'dd-mm-yyyy'), 885);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (874, 251, 'Invision.com', to_date('04-05-2022', 'dd-mm-yyyy'), 833);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (283, 129, 'PrivateBancorp', to_date('10-05-2022', 'dd-mm-yyyy'), 598);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (180, 58, 'Dillard’s', to_date('28-11-2023', 'dd-mm-yyyy'), 779);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (581, 180, 'Colgate-Palmoli', to_date('31-01-2023', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (129, 219, 'Heritage Microf', to_date('02-08-2022', 'dd-mm-yyyy'), 419);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (922, 329, 'Asta Funding', to_date('03-08-2023', 'dd-mm-yyyy'), 650);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (945, 319, 'AOL Time Warner', to_date('17-03-2023', 'dd-mm-yyyy'), 397);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (819, 322, 'Procurement Cen', to_date('06-08-2023', 'dd-mm-yyyy'), 119);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (17, 140, 'Alogent', to_date('22-04-2022', 'dd-mm-yyyy'), 614);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (778, 127, 'KeyMark', to_date('28-01-2024', 'dd-mm-yyyy'), 425);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (597, 325, 'Brandt Informat', to_date('02-10-2023', 'dd-mm-yyyy'), 231);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (348, 291, 'Palm Beach Tan', to_date('29-08-2023', 'dd-mm-yyyy'), 232);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (775, 147, 'Great Lakes Med', to_date('25-01-2022', 'dd-mm-yyyy'), 842);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (364, 217, 'ZonePerfect Nut', to_date('26-01-2023', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (895, 314, 'Flow Management', to_date('27-04-2022', 'dd-mm-yyyy'), 275);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (871, 178, 'ASAP Staffing', to_date('21-01-2023', 'dd-mm-yyyy'), 180);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (456, 119, 'U.S. Energy Ser', to_date('23-01-2023', 'dd-mm-yyyy'), 70);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (200, 213, 'First American ', to_date('06-08-2023', 'dd-mm-yyyy'), 353);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (322, 237, 'Marlabs', to_date('13-04-2022', 'dd-mm-yyyy'), 934);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (562, 347, 'Synovis Life Te', to_date('30-05-2023', 'dd-mm-yyyy'), 502);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (949, 247, 'IPS Advisory', to_date('20-06-2023', 'dd-mm-yyyy'), 416);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (249, 138, 'Sears, Roebuck ', to_date('30-08-2023', 'dd-mm-yyyy'), 686);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (68, 297, 'Paisley Consult', to_date('21-05-2024', 'dd-mm-yyyy'), 629);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (153, 336, 'Vertex Solution', to_date('13-09-2023', 'dd-mm-yyyy'), 947);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (97, 107, 'MHF Logistical ', to_date('19-03-2024', 'dd-mm-yyyy'), 810);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (960, 317, 'Evergreen Resou', to_date('09-12-2022', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (332, 257, 'Diageo', to_date('13-01-2024', 'dd-mm-yyyy'), 994);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (567, 135, 'MicroTek', to_date('28-05-2023', 'dd-mm-yyyy'), 21);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (756, 346, 'Summit Energy', to_date('26-08-2022', 'dd-mm-yyyy'), 234);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (523, 71, 'Uniserve Facili', to_date('16-09-2022', 'dd-mm-yyyy'), 975);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (384, 323, 'Legacy Financia', to_date('19-05-2024', 'dd-mm-yyyy'), 153);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (67, 127, 'Tracer Technolo', to_date('29-07-2023', 'dd-mm-yyyy'), 773);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (374, 240, 'Morgan Research', to_date('15-09-2022', 'dd-mm-yyyy'), 271);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (747, 169, 'Bluff City Stee', to_date('27-11-2022', 'dd-mm-yyyy'), 750);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (536, 208, 'MasterCard Inte', to_date('05-06-2022', 'dd-mm-yyyy'), 627);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (572, 133, 'FlavorX', to_date('31-03-2024', 'dd-mm-yyyy'), 76);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (391, 197, 'Coca-Cola Co.', to_date('30-09-2023', 'dd-mm-yyyy'), 625);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (709, 154, 'Horizon Organic', to_date('13-12-2023', 'dd-mm-yyyy'), 573);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (646, 298, 'Flow Management', to_date('01-08-2022', 'dd-mm-yyyy'), 912);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (794, 180, 'S.C. Johnson & ', to_date('27-04-2024', 'dd-mm-yyyy'), 689);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (151, 325, 'Prosum', to_date('20-04-2024', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (575, 329, 'PSC Info Group', to_date('09-05-2024', 'dd-mm-yyyy'), 424);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (376, 290, 'Democracy Data ', to_date('19-12-2022', 'dd-mm-yyyy'), 480);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (417, 141, 'Diamond Pharmac', to_date('14-01-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (617, 198, 'Prometheus Labo', to_date('15-09-2022', 'dd-mm-yyyy'), 97);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (714, 241, 'Mattel', to_date('16-08-2022', 'dd-mm-yyyy'), 672);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (15, 204, 'Viacom', to_date('28-07-2023', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (668, 129, 'Heartlab', to_date('28-05-2023', 'dd-mm-yyyy'), 405);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (333, 73, 'Tarragon Realty', to_date('14-02-2024', 'dd-mm-yyyy'), 674);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (495, 68, 'American Health', to_date('05-01-2024', 'dd-mm-yyyy'), 183);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (80, 285, 'Network Hardwar', to_date('19-05-2022', 'dd-mm-yyyy'), 128);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (51, 88, 'Diamond Technol', to_date('03-01-2022', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (107, 224, 'ATA Services', to_date('08-11-2022', 'dd-mm-yyyy'), 561);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (642, 247, 'Nike', to_date('09-11-2023', 'dd-mm-yyyy'), 995);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (764, 230, 'Pioneer Mortgag', to_date('01-02-2022', 'dd-mm-yyyy'), 263);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (262, 337, 'Federated Depar', to_date('26-06-2022', 'dd-mm-yyyy'), 120);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (564, 204, 'Comnet Internat', to_date('13-11-2022', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (647, 202, 'Bristol-Myers S', to_date('13-01-2022', 'dd-mm-yyyy'), 786);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (918, 88, 'AQuickDelivery', to_date('27-02-2022', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (179, 120, 'Freedom Medical', to_date('12-02-2022', 'dd-mm-yyyy'), 120);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (856, 139, 'Calence', to_date('28-12-2022', 'dd-mm-yyyy'), 658);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (502, 122, 'First Place Fin', to_date('11-08-2022', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (406, 197, 'Business Plus C', to_date('16-12-2023', 'dd-mm-yyyy'), 147);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (434, 294, 'Hencie', to_date('14-04-2022', 'dd-mm-yyyy'), 994);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (948, 105, 'Data Company', to_date('11-10-2023', 'dd-mm-yyyy'), 691);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (812, 207, 'Hi-Tech Pharmac', to_date('01-04-2022', 'dd-mm-yyyy'), 448);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (869, 330, 'Client Network ', to_date('28-05-2022', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (317, 338, 'Professional Pl', to_date('03-06-2022', 'dd-mm-yyyy'), 641);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (959, 86, 'Terra Firma', to_date('17-06-2023', 'dd-mm-yyyy'), 972);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (3, 314, 'American Land L', to_date('28-10-2022', 'dd-mm-yyyy'), 650);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (807, 83, 'Data Company', to_date('17-01-2024', 'dd-mm-yyyy'), 643);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (670, 347, 'Johnson & Johns', to_date('30-11-2022', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (890, 185, 'GDA Technologie', to_date('04-12-2022', 'dd-mm-yyyy'), 548);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (861, 68, 'Cardtronics', to_date('01-06-2023', 'dd-mm-yyyy'), 514);
commit;
prompt 100 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (688, 298, 'Astute', to_date('29-04-2022', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (544, 179, 'Multimedia Live', to_date('01-06-2023', 'dd-mm-yyyy'), 789);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (62, 155, 'SBC Communicati', to_date('29-02-2024', 'dd-mm-yyyy'), 20);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (565, 231, 'ConAgra', to_date('19-01-2023', 'dd-mm-yyyy'), 951);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (825, 300, 'KSJ & Associate', to_date('20-04-2024', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (610, 203, 'Hudson River Ba', to_date('23-05-2023', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (704, 251, 'Portfolio Recov', to_date('19-05-2022', 'dd-mm-yyyy'), 918);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (104, 312, 'Noodles & Co.', to_date('29-03-2022', 'dd-mm-yyyy'), 661);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (239, 233, 'Homebuilders Fi', to_date('03-08-2023', 'dd-mm-yyyy'), 687);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (999, 211, 'GDA Technologie', to_date('23-12-2022', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (404, 173, 'Span-America Me', to_date('24-02-2023', 'dd-mm-yyyy'), 338);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (850, 248, 'Horizon Consult', to_date('29-03-2022', 'dd-mm-yyyy'), 275);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (18, 247, 'Quaker City Ban', to_date('31-05-2022', 'dd-mm-yyyy'), 66);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (994, 338, 'Mission West Pr', to_date('27-06-2023', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (63, 215, 'Freedom Medical', to_date('06-10-2023', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (7, 156, 'Green Mountain ', to_date('29-06-2023', 'dd-mm-yyyy'), 219);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (965, 76, 'Hospital Soluti', to_date('21-09-2022', 'dd-mm-yyyy'), 762);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (954, 74, 'Mosaic', to_date('11-04-2023', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (639, 98, 'Parker Compound', to_date('06-12-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (85, 83, 'Digital Visual ', to_date('17-03-2023', 'dd-mm-yyyy'), 868);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (526, 190, 'Pulaski Financi', to_date('04-09-2022', 'dd-mm-yyyy'), 170);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (741, 191, 'Conquest', to_date('19-03-2024', 'dd-mm-yyyy'), 523);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (354, 96, 'PepsiCo', to_date('05-12-2022', 'dd-mm-yyyy'), 214);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (237, 192, 'Authoria', to_date('21-01-2024', 'dd-mm-yyyy'), 558);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (894, 254, 'National Herita', to_date('04-01-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (997, 248, 'Kimberly-Clark ', to_date('14-01-2024', 'dd-mm-yyyy'), 647);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (740, 305, 'Blue Angel Tech', to_date('04-09-2023', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (838, 181, 'Linksys', to_date('08-01-2023', 'dd-mm-yyyy'), 283);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (832, 291, 'Campbell Soup C', to_date('13-10-2022', 'dd-mm-yyyy'), 710);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (410, 209, 'Accurate Autobo', to_date('06-07-2022', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (301, 134, 'Nature''s Cure', to_date('21-12-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (557, 337, 'Orange Glo Inte', to_date('02-02-2022', 'dd-mm-yyyy'), 871);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (426, 171, 'Larkin Enterpri', to_date('15-05-2022', 'dd-mm-yyyy'), 810);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (599, 265, 'Kimberly-Clark ', to_date('18-07-2022', 'dd-mm-yyyy'), 894);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (593, 53, 'GDA Technologie', to_date('16-05-2024', 'dd-mm-yyyy'), 507);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (492, 233, 'Providence Serv', to_date('14-08-2022', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (618, 106, 'Boldtech System', to_date('05-03-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (684, 210, 'Kellogg Co.', to_date('13-03-2023', 'dd-mm-yyyy'), 819);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (345, 56, 'Deutsche Teleko', to_date('29-08-2022', 'dd-mm-yyyy'), 425);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (792, 54, 'Eze Castle Soft', to_date('24-07-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (902, 103, 'Atlantic.Net', to_date('10-01-2023', 'dd-mm-yyyy'), 606);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (503, 240, 'Joseph Sheairs ', to_date('17-06-2022', 'dd-mm-yyyy'), 782);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (981, 231, 'Genex Technolog', to_date('29-03-2022', 'dd-mm-yyyy'), 728);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (469, 301, 'Ositis Software', to_date('21-03-2022', 'dd-mm-yyyy'), 482);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (478, 152, 'Open Software S', to_date('09-02-2022', 'dd-mm-yyyy'), 560);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (154, 184, 'Great Lakes Tec', to_date('29-03-2024', 'dd-mm-yyyy'), 602);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (672, 58, 'PowerLight', to_date('28-03-2024', 'dd-mm-yyyy'), 419);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (408, 318, 'Hencie', to_date('20-05-2024', 'dd-mm-yyyy'), 147);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (444, 156, 'Imaging Busines', to_date('27-05-2022', 'dd-mm-yyyy'), 949);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (914, 107, 'Alden Systems', to_date('05-06-2023', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (292, 127, 'Tigris Consulti', to_date('31-07-2022', 'dd-mm-yyyy'), 166);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (468, 148, 'Multimedia Live', to_date('21-09-2023', 'dd-mm-yyyy'), 481);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (899, 254, 'SCI', to_date('07-09-2022', 'dd-mm-yyyy'), 116);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (122, 266, 'Amerisource Fun', to_date('27-08-2023', 'dd-mm-yyyy'), 721);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (535, 242, 'CapTech Venture', to_date('27-02-2022', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (144, 120, 'Comm-Works', to_date('27-03-2024', 'dd-mm-yyyy'), 703);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (605, 61, 'SmartDraw.com', to_date('29-02-2024', 'dd-mm-yyyy'), 629);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (889, 219, 'Vivendi Univers', to_date('02-04-2022', 'dd-mm-yyyy'), 379);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (114, 340, 'VoiceLog', to_date('06-10-2023', 'dd-mm-yyyy'), 10);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (968, 146, 'Flake-Wilkerson', to_date('04-01-2024', 'dd-mm-yyyy'), 290);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (251, 152, 'Sterling Financ', to_date('23-07-2023', 'dd-mm-yyyy'), 985);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (711, 105, 'Eze Castle Soft', to_date('27-01-2024', 'dd-mm-yyyy'), 824);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (165, 104, 'Gillani', to_date('10-09-2022', 'dd-mm-yyyy'), 531);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (574, 252, 'Blue Angel Tech', to_date('08-11-2022', 'dd-mm-yyyy'), 439);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (491, 78, 'Span-America Me', to_date('16-07-2023', 'dd-mm-yyyy'), 518);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (199, 223, 'TEOCO', to_date('25-09-2022', 'dd-mm-yyyy'), 806);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (134, 156, 'Advertising Ven', to_date('26-12-2023', 'dd-mm-yyyy'), 709);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (299, 145, 'Virbac', to_date('22-05-2024', 'dd-mm-yyyy'), 659);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (790, 97, 'Coadvantage Res', to_date('07-12-2022', 'dd-mm-yyyy'), 38);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (132, 271, 'Aventis', to_date('22-08-2022', 'dd-mm-yyyy'), 924);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (783, 310, 'Strategic Produ', to_date('04-03-2022', 'dd-mm-yyyy'), 367);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (120, 235, 'Mitsubishi Moto', to_date('10-06-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (843, 111, 'Saks Inc.', to_date('06-01-2022', 'dd-mm-yyyy'), 770);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (730, 276, 'Peerless Manufa', to_date('04-05-2023', 'dd-mm-yyyy'), 119);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (685, 57, 'IntegraMed Amer', to_date('28-03-2023', 'dd-mm-yyyy'), 624);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (757, 122, 'Vitacost.com', to_date('04-05-2023', 'dd-mm-yyyy'), 66);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (198, 198, 'Dell Computer C', to_date('14-05-2024', 'dd-mm-yyyy'), 0);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (855, 119, 'Extreme Pizza', to_date('11-03-2023', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (511, 320, 'WRG Services', to_date('11-08-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (145, 287, 'Interface Softw', to_date('22-02-2022', 'dd-mm-yyyy'), 337);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (225, 141, 'Cardtronics', to_date('15-07-2023', 'dd-mm-yyyy'), 216);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (170, 177, 'Sensor Technolo', to_date('20-07-2022', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (127, 342, 'IBM Corp.', to_date('03-01-2023', 'dd-mm-yyyy'), 536);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (976, 286, 'SALT Group', to_date('14-07-2023', 'dd-mm-yyyy'), 400);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (733, 163, 'Tropical Oasis', to_date('18-08-2022', 'dd-mm-yyyy'), 211);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (870, 334, 'Tripwire', to_date('28-01-2022', 'dd-mm-yyyy'), 546);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (102, 230, 'Mars Inc.', to_date('29-10-2023', 'dd-mm-yyyy'), 672);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (38, 277, 'American Land L', to_date('19-01-2023', 'dd-mm-yyyy'), 260);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (382, 138, 'Direct Data', to_date('18-12-2023', 'dd-mm-yyyy'), 814);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (156, 220, 'Electrical Solu', to_date('14-01-2024', 'dd-mm-yyyy'), 344);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (677, 246, 'Integrated Deci', to_date('27-10-2023', 'dd-mm-yyyy'), 598);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (474, 159, 'Capital Crossin', to_date('23-10-2023', 'dd-mm-yyyy'), 355);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (311, 78, 'Blue Pumpkin So', to_date('01-09-2023', 'dd-mm-yyyy'), 819);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (664, 196, 'Comm-Works', to_date('03-02-2023', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (719, 299, 'Alternative Tec', to_date('01-04-2024', 'dd-mm-yyyy'), 251);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (791, 217, 'Cendant Corp.', to_date('05-10-2023', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (631, 137, 'SALT Group', to_date('07-12-2022', 'dd-mm-yyyy'), 754);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (25, 182, 'Microsoft Corp.', to_date('17-07-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (284, 346, 'News Corp.', to_date('09-05-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (934, 152, 'Spectrum Commun', to_date('19-07-2023', 'dd-mm-yyyy'), 460);
commit;
prompt 200 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (484, 194, 'Cynergy Data', to_date('14-12-2023', 'dd-mm-yyyy'), 814);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (872, 329, 'esoftsolutions', to_date('24-01-2023', 'dd-mm-yyyy'), 738);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (373, 180, 'Blue Ocean Soft', to_date('11-06-2022', 'dd-mm-yyyy'), 963);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (231, 163, 'SYS-CON Media', to_date('25-01-2024', 'dd-mm-yyyy'), 563);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (420, 227, 'Alliance of Pro', to_date('11-10-2023', 'dd-mm-yyyy'), 967);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (548, 68, 'HealthCare Fina', to_date('06-03-2023', 'dd-mm-yyyy'), 915);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (380, 231, 'DataTrend Infor', to_date('09-10-2023', 'dd-mm-yyyy'), 173);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (845, 347, 'Club One', to_date('30-08-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (208, 170, 'Home Depot', to_date('25-11-2023', 'dd-mm-yyyy'), 555);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (896, 129, 'Digital Motorwo', to_date('04-03-2023', 'dd-mm-yyyy'), 358);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (543, 256, 'Tilia', to_date('04-09-2022', 'dd-mm-yyyy'), 710);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (765, 51, 'Magnet Communic', to_date('10-02-2023', 'dd-mm-yyyy'), 602);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (687, 298, 'Ogio Internatio', to_date('22-12-2022', 'dd-mm-yyyy'), 255);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (210, 165, 'Sandy Spring Ba', to_date('08-08-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (219, 238, 'Allegiant Banco', to_date('21-03-2022', 'dd-mm-yyyy'), 232);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (736, 233, 'Mercantile Bank', to_date('04-10-2023', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (294, 254, 'Pragmatech Soft', to_date('18-04-2023', 'dd-mm-yyyy'), 691);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (169, 310, 'Synovis Life Te', to_date('26-04-2022', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (178, 293, 'Restaurant Part', to_date('21-10-2022', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (583, 266, 'Network Managem', to_date('30-01-2023', 'dd-mm-yyyy'), 338);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (316, 212, 'Advanced Techno', to_date('21-09-2023', 'dd-mm-yyyy'), 398);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (323, 273, 'USA Environment', to_date('06-02-2023', 'dd-mm-yyyy'), 344);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (344, 183, 'Formatech', to_date('17-11-2023', 'dd-mm-yyyy'), 833);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (389, 348, 'Cardinal Cartri', to_date('26-01-2022', 'dd-mm-yyyy'), 33);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (441, 51, 'Pioneer Data Sy', to_date('03-03-2024', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (293, 212, 'Cardinal Cartri', to_date('06-09-2023', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (489, 79, 'Cynergy Data', to_date('20-06-2022', 'dd-mm-yyyy'), 723);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (125, 74, 'Conquest', to_date('06-06-2023', 'dd-mm-yyyy'), 979);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (252, 243, 'Contract Counse', to_date('04-01-2023', 'dd-mm-yyyy'), 937);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (932, 251, 'Veri-Tek Intern', to_date('13-10-2022', 'dd-mm-yyyy'), 186);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (230, 189, 'Smartronix', to_date('10-09-2023', 'dd-mm-yyyy'), 661);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (229, 328, 'Elite Medical', to_date('21-03-2024', 'dd-mm-yyyy'), 546);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (55, 341, 'Navigator Syste', to_date('26-10-2023', 'dd-mm-yyyy'), 731);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (504, 96, 'Liners Direct', to_date('29-05-2024', 'dd-mm-yyyy'), 361);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (99, 120, 'Diageo', to_date('29-03-2022', 'dd-mm-yyyy'), 620);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (854, 340, 'General Electri', to_date('09-01-2023', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (998, 89, 'Max & Erma''s Re', to_date('14-09-2023', 'dd-mm-yyyy'), 125);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (352, 134, 'Morgan Stanley ', to_date('29-01-2023', 'dd-mm-yyyy'), 4);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (328, 308, 'Outta the Box D', to_date('23-10-2022', 'dd-mm-yyyy'), 727);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (713, 289, 'Bioanalytical S', to_date('06-01-2024', 'dd-mm-yyyy'), 887);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (935, 214, 'IPS Advisory', to_date('24-08-2023', 'dd-mm-yyyy'), 778);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (762, 243, 'Allegiant Banco', to_date('12-02-2024', 'dd-mm-yyyy'), 754);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (705, 91, 'Kingston', to_date('17-12-2023', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (105, 89, 'GulfMark Offsho', to_date('13-06-2023', 'dd-mm-yyyy'), 104);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (455, 179, 'Walt Disney Co.', to_date('04-12-2022', 'dd-mm-yyyy'), 404);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (989, 283, 'Hilton Hotels C', to_date('20-05-2022', 'dd-mm-yyyy'), 871);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (814, 208, 'ATA Services', to_date('02-07-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (926, 338, 'Kingston', to_date('21-01-2022', 'dd-mm-yyyy'), 573);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (79, 170, 'Service Link', to_date('03-02-2022', 'dd-mm-yyyy'), 674);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (128, 266, 'SafeHome Securi', to_date('03-10-2022', 'dd-mm-yyyy'), 37);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (878, 242, 'MidAmerica Auto', to_date('15-01-2023', 'dd-mm-yyyy'), 590);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (353, 77, 'American Megaco', to_date('06-02-2023', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (915, 241, 'Knightsbridge S', to_date('04-11-2022', 'dd-mm-yyyy'), 731);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (201, 189, 'Providence Serv', to_date('29-12-2023', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (841, 131, 'Integrated Deci', to_date('21-05-2024', 'dd-mm-yyyy'), 610);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (726, 293, 'ProSys Informat', to_date('18-04-2024', 'dd-mm-yyyy'), 993);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (532, 179, 'Team', to_date('11-09-2023', 'dd-mm-yyyy'), 587);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (265, 232, 'Lydian Trust', to_date('21-01-2023', 'dd-mm-yyyy'), 981);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (901, 84, 'VoiceLog', to_date('27-02-2022', 'dd-mm-yyyy'), 205);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (443, 256, 'Omega Insurance', to_date('23-02-2024', 'dd-mm-yyyy'), 449);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (45, 77, 'Caliber Collisi', to_date('17-05-2024', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (683, 167, 'Tastefully Simp', to_date('15-12-2022', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (953, 265, 'Active Services', to_date('07-03-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (826, 148, 'Socket Internet', to_date('07-02-2022', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (94, 69, 'NLX', to_date('05-03-2024', 'dd-mm-yyyy'), 494);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (766, 68, 'Scott Pipitone ', to_date('19-06-2023', 'dd-mm-yyyy'), 791);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (372, 237, 'Tarragon Realty', to_date('12-05-2023', 'dd-mm-yyyy'), 597);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (260, 223, 'MQ Software', to_date('15-04-2024', 'dd-mm-yyyy'), 703);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (69, 271, 'McKee Wallwork ', to_date('18-07-2022', 'dd-mm-yyyy'), 382);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (508, 171, 'Bigdough.com', to_date('23-02-2024', 'dd-mm-yyyy'), 10);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (686, 69, 'Coridian Techno', to_date('09-07-2022', 'dd-mm-yyyy'), 763);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (485, 157, 'Circuit City St', to_date('08-03-2022', 'dd-mm-yyyy'), 353);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (118, 216, 'Manhattan Assoc', to_date('23-03-2023', 'dd-mm-yyyy'), 47);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (530, 97, 'Pioneer Data Sy', to_date('10-04-2024', 'dd-mm-yyyy'), 506);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (336, 336, 'Hilton Hotels C', to_date('14-04-2024', 'dd-mm-yyyy'), 502);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (724, 255, 'Greene County B', to_date('28-03-2024', 'dd-mm-yyyy'), 541);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (401, 273, 'Deutsche Teleko', to_date('06-07-2023', 'dd-mm-yyyy'), 870);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (851, 88, 'Coadvantage Res', to_date('15-04-2023', 'dd-mm-yyyy'), 62);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (862, 290, 'Medical Action ', to_date('12-03-2024', 'dd-mm-yyyy'), 708);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (43, 199, 'Ford Motor Co.', to_date('02-04-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (810, 201, 'Multimedia Live', to_date('08-12-2022', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (621, 214, 'Unit', to_date('12-10-2022', 'dd-mm-yyyy'), 139);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (669, 318, 'Data Company', to_date('01-11-2022', 'dd-mm-yyyy'), 488);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (402, 325, 'Tilson Landscap', to_date('24-07-2022', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (991, 188, 'Maverick Techno', to_date('26-02-2022', 'dd-mm-yyyy'), 62);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (927, 135, 'Digital Visual ', to_date('19-05-2023', 'dd-mm-yyyy'), 39);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (211, 282, 'Loss Mitigation', to_date('25-07-2023', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (681, 294, 'MindIQ', to_date('09-02-2022', 'dd-mm-yyyy'), 835);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (506, 207, 'Dearborn Bancor', to_date('03-04-2022', 'dd-mm-yyyy'), 223);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (313, 68, 'Summit Energy', to_date('16-08-2023', 'dd-mm-yyyy'), 556);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (972, 205, 'Serentec', to_date('05-12-2023', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (707, 260, 'Sequoia System ', to_date('23-06-2023', 'dd-mm-yyyy'), 885);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (973, 83, 'PrivateBancorp', to_date('06-10-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (479, 141, 'GCI', to_date('17-02-2024', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (281, 209, 'Softworld', to_date('19-02-2023', 'dd-mm-yyyy'), 314);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (432, 308, 'North Highland', to_date('27-10-2022', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (745, 206, 'Savela & Associ', to_date('05-01-2023', 'dd-mm-yyyy'), 315);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (142, 173, 'Urstadt Biddle ', to_date('10-01-2022', 'dd-mm-yyyy'), 386);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (280, 138, 'Miller Systems', to_date('22-08-2023', 'dd-mm-yyyy'), 397);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (254, 86, 'Call Henry', to_date('09-09-2023', 'dd-mm-yyyy'), 818);
commit;
prompt 300 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (439, 130, 'TRX', to_date('01-08-2023', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (556, 99, 'Taycor Financia', to_date('07-08-2023', 'dd-mm-yyyy'), 653);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (888, 126, 'Myricom', to_date('20-01-2023', 'dd-mm-yyyy'), 740);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (785, 105, 'Mitsubishi Moto', to_date('22-02-2024', 'dd-mm-yyyy'), 76);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (152, 148, 'Wal-Mart Stores', to_date('31-12-2022', 'dd-mm-yyyy'), 214);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (315, 215, 'Universal Solut', to_date('29-04-2022', 'dd-mm-yyyy'), 26);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (13, 255, 'Texas Residenti', to_date('19-03-2024', 'dd-mm-yyyy'), 449);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (738, 155, 'Kelmoore Invest', to_date('02-02-2024', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (64, 73, 'Tropical Oasis', to_date('10-03-2022', 'dd-mm-yyyy'), 799);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (247, 83, 'Joe Lombardo Pl', to_date('02-06-2022', 'dd-mm-yyyy'), 835);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (509, 68, 'Enterprise Comp', to_date('17-05-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (753, 298, 'Navarro Researc', to_date('04-05-2024', 'dd-mm-yyyy'), 134);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (109, 98, 'Mathis, Earnest', to_date('18-04-2023', 'dd-mm-yyyy'), 315);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (77, 96, 'Spinnaker Explo', to_date('08-02-2024', 'dd-mm-yyyy'), 472);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (289, 207, 'Heartland Payme', to_date('31-07-2023', 'dd-mm-yyyy'), 838);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (773, 350, 'Bluff City Stee', to_date('17-08-2023', 'dd-mm-yyyy'), 972);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (187, 229, 'Tigris Consulti', to_date('31-03-2023', 'dd-mm-yyyy'), 439);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (48, 104, 'State Farm Mutu', to_date('15-04-2022', 'dd-mm-yyyy'), 750);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (754, 323, 'Dearborn Bancor', to_date('17-04-2023', 'dd-mm-yyyy'), 736);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (603, 289, 'Liners Direct', to_date('21-04-2024', 'dd-mm-yyyy'), 283);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (53, 343, 'Jewett-Cameron ', to_date('20-12-2023', 'dd-mm-yyyy'), 727);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (413, 209, 'Traffic Managem', to_date('29-07-2023', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (623, 327, 'Alogent', to_date('26-01-2024', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (175, 165, 'StoneTech Profe', to_date('03-07-2023', 'dd-mm-yyyy'), 806);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (818, 80, 'Staff Force', to_date('29-02-2024', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (947, 330, 'Teamstudio', to_date('10-08-2023', 'dd-mm-yyyy'), 290);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (882, 271, 'Zaiq Technologi', to_date('08-12-2022', 'dd-mm-yyyy'), 139);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (253, 347, 'Myricom', to_date('09-02-2024', 'dd-mm-yyyy'), 278);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (517, 191, 'School Technolo', to_date('18-06-2023', 'dd-mm-yyyy'), 622);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (939, 280, 'Neogen', to_date('05-03-2024', 'dd-mm-yyyy'), 513);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (36, 104, 'Priority Expres', to_date('10-12-2023', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (29, 95, 'Monitronics Int', to_date('06-06-2022', 'dd-mm-yyyy'), 959);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (885, 299, 'Consultants'' Ch', to_date('07-11-2022', 'dd-mm-yyyy'), 901);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (613, 205, 'TLS Service Bur', to_date('25-05-2022', 'dd-mm-yyyy'), 313);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (653, 235, 'Summit Energy', to_date('21-07-2023', 'dd-mm-yyyy'), 437);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (499, 341, 'Cima Consulting', to_date('22-10-2023', 'dd-mm-yyyy'), 868);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (905, 214, 'Microsoft Corp.', to_date('28-03-2022', 'dd-mm-yyyy'), 931);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (585, 317, 'V-Span', to_date('12-08-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (908, 240, 'American Megaco', to_date('04-05-2023', 'dd-mm-yyyy'), 587);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (218, 82, 'Medical Action ', to_date('07-04-2022', 'dd-mm-yyyy'), 530);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (31, 208, 'Technica', to_date('09-03-2023', 'dd-mm-yyyy'), 523);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (520, 108, 'Shirt Factory', to_date('17-01-2022', 'dd-mm-yyyy'), 942);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (586, 316, 'Hi-Tech Pharmac', to_date('22-08-2022', 'dd-mm-yyyy'), 29);
commit;
prompt 343 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (451, 757, 0, 68, 710);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (316, 684, 0, 151, 255);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (847, 220, 1, 165, 548);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (318, 499, 1, 165, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (345, 709, 0, 55, 512);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (341, 598, 0, 187, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (591, 931, 0, 172, 857);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (775, 213, 0, 112, 888);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (623, 869, 1, 104, 481);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (226, 259, 1, 68, 260);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (359, 847, 0, 159, 374);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (885, 146, 0, 93, 456);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (296, 896, 0, 68, 386);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (723, 706, 0, 5, 736);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (428, 406, 0, 54, 788);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (8, 590, 1, 33, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (811, 849, 0, 59, 219);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (78, 472, 0, 65, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (791, 683, 0, 13, 723);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (285, 707, 0, 102, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (802, 820, 1, 142, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (568, 182, 1, 94, 163);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (991, 114, 0, 87, 468);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (352, 771, 1, 140, 437);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (268, 545, 0, 56, 413);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (351, 483, 1, 186, 337);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (773, 312, 0, 20, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (578, 490, 1, 108, 567);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (747, 822, 1, 165, 46);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (371, 201, 0, 32, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (492, 830, 1, 35, 120);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (690, 868, 0, 22, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (47, 192, 0, 98, 472);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (298, 966, 1, 190, 806);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (416, 743, 1, 75, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (899, 210, 1, 109, 903);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (309, 375, 1, 20, 924);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (737, 453, 0, 93, 638);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (382, 842, 0, 91, 835);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (879, 272, 1, 183, 242);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (476, 863, 0, 76, 406);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (193, 720, 1, 157, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (458, 472, 0, 132, 867);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (216, 120, 1, 66, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (437, 219, 0, 61, 776);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (531, 744, 0, 98, 865);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (525, 354, 0, 111, 439);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (176, 438, 1, 131, 364);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (414, 223, 0, 165, 443);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (894, 995, 1, 103, 507);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (977, 473, 0, 131, 779);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (912, 806, 1, 118, 556);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (383, 278, 0, 131, 587);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (349, 390, 1, 92, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (935, 318, 1, 124, 310);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (464, 536, 0, 193, 946);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (566, 258, 0, 182, 531);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (710, 417, 1, 1, 139);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (661, 917, 1, 189, 337);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (166, 436, 0, 92, 40);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (307, 559, 0, 156, 562);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (295, 828, 0, 21, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (87, 193, 1, 99, 931);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (303, 349, 0, 36, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (867, 893, 0, 107, 466);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (593, 328, 1, 25, 417);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (640, 430, 0, 43, 625);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (160, 166, 1, 137, 278);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (938, 530, 1, 99, 367);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (74, 628, 1, 29, 424);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (782, 535, 1, 104, 439);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (926, 183, 0, 171, 231);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (633, 723, 1, 198, 160);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (92, 599, 0, 60, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (395, 914, 1, 164, 413);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (538, 652, 1, 165, 42);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (194, 239, 1, 167, 536);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (527, 195, 1, 96, 128);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (869, 299, 1, 54, 615);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (164, 247, 1, 141, 432);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (999, 105, 0, 187, 546);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (479, 174, 1, 26, 886);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (689, 485, 0, 98, 872);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (662, 798, 0, 85, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (513, 164, 1, 176, 560);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (204, 559, 1, 112, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (413, 608, 1, 119, 179);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (567, 772, 1, 97, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (400, 394, 0, 123, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (518, 747, 1, 165, 713);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (136, 453, 1, 65, 708);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (720, 620, 0, 5, 598);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (694, 301, 1, 42, 389);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (866, 410, 0, 121, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (882, 819, 1, 199, 686);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (589, 828, 0, 11, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (744, 447, 0, 36, 872);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (282, 837, 0, 172, 430);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (12, 375, 0, 197, 951);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (777, 408, 1, 122, 410);
commit;
prompt 100 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (494, 611, 1, 33, 572);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (151, 183, 1, 73, 234);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (673, 402, 1, 51, 819);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (459, 460, 1, 170, 894);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (338, 303, 0, 85, 915);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (651, 665, 1, 40, 0);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (895, 848, 0, 67, 573);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (411, 103, 0, 21, 374);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (928, 239, 1, 82, 934);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (103, 997, 1, 146, 540);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (587, 376, 0, 43, 641);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (982, 148, 1, 120, 590);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (579, 812, 0, 60, 242);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (523, 620, 1, 3, 885);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (542, 417, 1, 137, 620);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (886, 181, 0, 195, 355);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (108, 368, 1, 175, 364);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (159, 736, 1, 132, 627);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (269, 647, 1, 36, 488);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (207, 725, 0, 199, 369);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (150, 111, 1, 190, 506);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (355, 494, 1, 11, 932);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (798, 680, 0, 74, 967);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (848, 404, 0, 13, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (621, 807, 1, 197, 799);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (914, 313, 0, 175, 590);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (340, 293, 0, 199, 314);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (235, 548, 0, 36, 967);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (841, 960, 1, 26, 267);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (807, 156, 1, 196, 179);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (279, 635, 0, 26, 650);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (951, 270, 0, 116, 189);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (402, 530, 0, 68, 83);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (585, 714, 0, 24, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (814, 503, 1, 103, 64);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (901, 649, 1, 105, 116);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (880, 116, 1, 136, 460);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (363, 299, 0, 82, 748);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (109, 148, 1, 36, 180);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (592, 708, 0, 158, 793);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (789, 546, 1, 75, 530);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (975, 860, 1, 13, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (822, 386, 1, 172, 205);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (5, 247, 1, 126, 975);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (634, 343, 0, 180, 615);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (24, 420, 0, 120, 918);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (942, 489, 1, 129, 29);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (902, 286, 1, 64, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (132, 764, 1, 63, 693);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (540, 869, 0, 79, 156);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (291, 378, 0, 64, 531);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (929, 636, 0, 48, 842);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (516, 845, 1, 174, 317);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (90, 678, 1, 10, 285);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (844, 621, 1, 121, 867);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (173, 477, 0, 7, 426);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (606, 162, 0, 199, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (769, 678, 0, 29, 699);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (114, 135, 0, 102, 677);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (564, 904, 1, 31, 912);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (565, 362, 0, 20, 674);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (743, 123, 1, 58, 263);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (732, 883, 0, 87, 475);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (571, 947, 0, 56, 255);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (75, 802, 1, 163, 37);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (229, 206, 1, 103, 548);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (772, 954, 1, 114, 740);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (181, 424, 1, 61, 972);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (985, 320, 1, 194, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (482, 747, 1, 192, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (271, 779, 0, 64, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (678, 224, 0, 99, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (407, 137, 1, 103, 389);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (386, 115, 0, 167, 924);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (918, 992, 1, 40, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (308, 866, 0, 167, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (267, 376, 0, 184, 448);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (209, 760, 1, 107, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (964, 473, 1, 28, 815);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (919, 912, 1, 133, 868);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (415, 612, 1, 114, 838);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (221, 745, 0, 35, 263);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (36, 754, 1, 62, 978);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (812, 451, 0, 55, 530);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (698, 209, 0, 95, 865);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (986, 603, 0, 99, 160);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (909, 178, 0, 194, 443);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (569, 573, 0, 179, 681);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (804, 349, 1, 69, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (188, 839, 0, 32, 42);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (4, 790, 0, 192, 687);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (794, 854, 0, 20, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (392, 915, 1, 86, 981);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (622, 709, 1, 130, 254);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (874, 504, 0, 150, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (115, 139, 1, 79, 298);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (475, 748, 1, 166, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (750, 531, 0, 175, 430);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (833, 938, 0, 180, 114);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (198, 754, 0, 9, 458);
commit;
prompt 200 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (450, 908, 1, 52, 894);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (477, 994, 1, 160, 658);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (520, 986, 0, 86, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (945, 897, 0, 9, 703);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (59, 176, 0, 120, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (639, 461, 0, 183, 555);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (281, 973, 0, 154, 453);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (994, 185, 1, 71, 104);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (219, 500, 1, 64, 231);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (288, 599, 1, 80, 742);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (31, 404, 1, 7, 762);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (453, 207, 1, 137, 614);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (503, 353, 1, 194, 661);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (202, 342, 1, 151, 750);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (745, 731, 1, 90, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (304, 299, 0, 155, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (715, 107, 1, 151, 728);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (496, 436, 1, 103, 931);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (760, 904, 1, 131, 562);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (354, 474, 0, 113, 999);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (842, 405, 0, 28, 426);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (682, 139, 0, 117, 40);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (172, 447, 0, 141, 806);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (816, 895, 1, 104, 343);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (836, 756, 1, 48, 761);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (650, 246, 0, 18, 341);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (771, 702, 1, 127, 681);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (711, 541, 1, 7, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (957, 320, 0, 143, 541);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (825, 720, 0, 7, 956);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (388, 447, 1, 129, 993);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (851, 415, 0, 195, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (859, 439, 1, 52, 205);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (0, 551, 1, 14, 134);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (815, 792, 1, 81, 214);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (666, 893, 0, 70, 810);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (234, 506, 0, 126, 572);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (758, 309, 1, 37, 946);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (599, 125, 0, 28, 699);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (417, 352, 1, 62, 35);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (586, 747, 0, 62, 995);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (324, 408, 0, 44, 38);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (984, 168, 1, 148, 870);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (270, 569, 1, 43, 33);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (509, 711, 1, 177, 805);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (117, 979, 0, 173, 29);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (500, 769, 1, 160, 614);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (619, 502, 0, 158, 404);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (601, 385, 0, 6, 789);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (644, 925, 1, 62, 234);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (2, 654, 1, 192, 949);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (328, 224, 1, 58, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (343, 482, 0, 158, 386);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (387, 608, 1, 181, 355);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (764, 240, 1, 179, 475);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (892, 142, 0, 200, 629);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (923, 645, 0, 136, 232);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (261, 727, 0, 142, 810);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (955, 167, 0, 56, 271);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (384, 170, 0, 53, 211);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (412, 365, 0, 93, 782);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (821, 288, 0, 141, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (493, 248, 0, 112, 975);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (212, 920, 1, 25, 791);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (934, 815, 0, 20, 686);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (800, 882, 1, 19, 275);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (441, 652, 0, 14, 990);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (191, 656, 0, 15, 748);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (373, 394, 1, 168, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (562, 570, 1, 150, 979);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (11, 848, 1, 115, 561);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (707, 851, 1, 39, 46);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (287, 901, 0, 183, 495);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (301, 611, 1, 44, 513);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (905, 721, 0, 109, 999);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (52, 885, 0, 173, 482);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (736, 562, 0, 36, 265);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (953, 709, 0, 141, 802);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (425, 669, 1, 168, 266);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (50, 343, 0, 9, 39);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (62, 957, 0, 65, 494);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (614, 794, 0, 119, 290);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (315, 814, 1, 136, 903);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (675, 419, 0, 127, 659);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (305, 497, 0, 13, 183);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (419, 383, 1, 175, 147);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (959, 306, 1, 35, 750);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (444, 508, 0, 108, 556);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (823, 523, 1, 173, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (13, 150, 0, 6, 448);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (510, 155, 0, 111, 703);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (932, 623, 0, 79, 853);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (596, 608, 0, 24, 219);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (313, 988, 1, 168, 298);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (408, 669, 1, 95, 886);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (872, 119, 1, 200, 303);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (435, 722, 1, 37, 456);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (165, 398, 1, 0, 687);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (688, 821, 0, 45, 283);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (404, 750, 0, 190, 306);
commit;
prompt 300 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (697, 351, 0, 90, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (272, 602, 1, 10, 287);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (973, 296, 0, 11, 622);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (186, 300, 0, 183, 15);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (858, 607, 1, 39, 218);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (427, 221, 1, 78, 21);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (907, 991, 1, 133, 416);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (624, 140, 0, 182, 737);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (524, 279, 0, 141, 602);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (182, 514, 1, 35, 959);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (608, 927, 1, 59, 629);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (227, 233, 0, 13, 864);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (138, 209, 0, 190, 393);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (937, 355, 1, 24, 466);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (199, 767, 1, 175, 887);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (379, 643, 1, 155, 815);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (704, 622, 1, 70, 706);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (541, 138, 0, 196, 337);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (28, 269, 0, 173, 675);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (333, 174, 0, 9, 731);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (292, 771, 1, 114, 26);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (756, 598, 0, 149, 480);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (864, 904, 0, 40, 601);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (456, 873, 0, 150, 663);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (685, 680, 1, 55, 709);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (670, 364, 0, 33, 723);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (344, 214, 0, 68, 833);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (51, 908, 0, 98, 458);
insert into PAYMENT (pid, price, ispaid, fineprice, oid)
values (233, 337, 0, 44, 536);
commit;
prompt 329 records loaded
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C007038;
alter table ORDERS enable constraint SYS_C007039;
alter table ORDERS enable constraint SYS_C007040;
prompt Enabling foreign key constraints for LAUNDRY...
alter table LAUNDRY enable constraint SYS_C007054;
prompt Enabling foreign key constraints for PAYMENT...
alter table PAYMENT enable constraint SYS_C007048;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DRESS...
alter table DRESS enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for LAUNDRY...
alter table LAUNDRY enable all triggers;
prompt Enabling triggers for PAYMENT...
alter table PAYMENT enable all triggers;
set feedback on
set define on
prompt Done.
