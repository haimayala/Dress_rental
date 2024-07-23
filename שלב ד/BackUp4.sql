prompt PL/SQL Developer import file
prompt Created on יום שלישי 23 יולי 2024 by Tamar
set feedback off
set define off
prompt Creating CUSTOMER...
create table CUSTOMER
(
  cid           NUMBER(3) not null,
  cname         VARCHAR2(15),
  cemail        VARCHAR2(15) not null,
  cphone        VARCHAR2(15),
  loyaltypoints NUMBER(5) default 0,
  caddress      VARCHAR2(15)
)
;
alter table CUSTOMER
  add primary key (CID);

prompt Creating DRESS...
create table DRESS
(
  did         NUMBER(3) not null,
  length      NUMBER(3),
  color       VARCHAR2(15),
  price       NUMBER(3) not null,
  rentalcount NUMBER(5) default 0
)
;
alter table DRESS
  add primary key (DID);

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  eid               NUMBER(3) not null,
  ename             VARCHAR2(15),
  eemail            VARCHAR2(15) not null,
  ephone            VARCHAR2(15),
  performancerating NUMBER(2,1) default 5.0
)
;
alter table EMPLOYEE
  add primary key (EID);

prompt Creating PAYMENT...
create table PAYMENT
(
  pid       NUMBER(3) not null,
  price     NUMBER(3) not null,
  ispaid    NUMBER(3),
  fineprice NUMBER(3),
  ptype     VARCHAR2(15)
)
;
alter table PAYMENT
  add primary key (PID);
alter table PAYMENT
  add constraint IS_PAID
  check (ispaid = 0 or ispaid = 1);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);
alter table PAYMENT
  add check (IsPaid = 0 or IsPaid = 1);

prompt Creating PRODUCER...
create table PRODUCER
(
  producer_id   NUMBER(5) not null,
  producer_name VARCHAR2(15) not null,
  price         NUMBER(5) default 5000 not null
)
;
alter table PRODUCER
  add primary key (PRODUCER_ID);

prompt Creating SINGER...
create table SINGER
(
  sname     VARCHAR2(15) not null,
  singer_id NUMBER(5) not null,
  price     NUMBER(5) not null
)
;
alter table SINGER
  add primary key (SINGER_ID);
alter table SINGER
  add constraint MINIMUM_COST
  check (price>1000 and price<12000);

prompt Creating EVENT...
create table EVENT
(
  event_date  DATE not null,
  location    VARCHAR2(15) not null,
  event_id    NUMBER(5) not null,
  producer_id NUMBER(5) not null,
  singer_id   NUMBER(5) not null,
  cid         NUMBER(3),
  pid         NUMBER(3)
)
;
alter table EVENT
  add primary key (EVENT_ID);
alter table EVENT
  add constraint UNIQUE_SINGER_DATE unique (SINGER_ID, EVENT_DATE);
alter table EVENT
  add constraint EVENT_CID_FK foreign key (CID)
  references CUSTOMER (CID);
alter table EVENT
  add constraint EVENT_PID_FK foreign key (PID)
  references PAYMENT (PID);
alter table EVENT
  add foreign key (PRODUCER_ID)
  references PRODUCER (PRODUCER_ID) on delete cascade;
alter table EVENT
  add foreign key (SINGER_ID)
  references SINGER (SINGER_ID) on delete cascade;

prompt Creating INSTRUMENT...
create table INSTRUMENT
(
  instrument_name VARCHAR2(15) not null,
  price           NUMBER(5) not null,
  instrument_id   NUMBER(5) not null
)
;
alter table INSTRUMENT
  add primary key (INSTRUMENT_ID);

prompt Creating INSTRUMENT_EVENT...
create table INSTRUMENT_EVENT
(
  instrument_id NUMBER(5) not null,
  event_id      NUMBER(5) not null
)
;
alter table INSTRUMENT_EVENT
  add primary key (INSTRUMENT_ID, EVENT_ID);
alter table INSTRUMENT_EVENT
  add foreign key (INSTRUMENT_ID)
  references INSTRUMENT (INSTRUMENT_ID);
alter table INSTRUMENT_EVENT
  add foreign key (EVENT_ID)
  references EVENT (EVENT_ID) on delete cascade;

prompt Creating ORDERS...
create table ORDERS
(
  oid        NUMBER(3) not null,
  orderdate  DATE not null,
  returndate DATE not null,
  eid        NUMBER(3) not null,
  did        NUMBER(3) not null,
  cid        NUMBER(3) not null,
  salary     NUMBER(3),
  pid        NUMBER(3)
)
;
alter table ORDERS
  add primary key (OID);
alter table ORDERS
  add constraint ORDERS_PID_FK foreign key (PID)
  references PAYMENT (PID);
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

prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DRESS...
alter table DRESS disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for PAYMENT...
alter table PAYMENT disable all triggers;
prompt Disabling triggers for PRODUCER...
alter table PRODUCER disable all triggers;
prompt Disabling triggers for SINGER...
alter table SINGER disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for INSTRUMENT...
alter table INSTRUMENT disable all triggers;
prompt Disabling triggers for INSTRUMENT_EVENT...
alter table INSTRUMENT_EVENT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for LAUNDRY...
alter table LAUNDRY disable all triggers;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint EVENT_CID_FK;
alter table EVENT disable constraint EVENT_PID_FK;
alter table EVENT disable constraint SYS_C007487;
alter table EVENT disable constraint SYS_C007490;
prompt Disabling foreign key constraints for INSTRUMENT_EVENT...
alter table INSTRUMENT_EVENT disable constraint SYS_C007498;
alter table INSTRUMENT_EVENT disable constraint SYS_C007499;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint ORDERS_PID_FK;
alter table ORDERS disable constraint SYS_C007439;
alter table ORDERS disable constraint SYS_C007440;
alter table ORDERS disable constraint SYS_C007441;
prompt Disabling foreign key constraints for LAUNDRY...
alter table LAUNDRY disable constraint SYS_C007447;
prompt Deleting LAUNDRY...
delete from LAUNDRY;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting INSTRUMENT_EVENT...
delete from INSTRUMENT_EVENT;
commit;
prompt Deleting INSTRUMENT...
delete from INSTRUMENT;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting SINGER...
delete from SINGER;
commit;
prompt Deleting PRODUCER...
delete from PRODUCER;
commit;
prompt Deleting PAYMENT...
delete from PAYMENT;
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
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (119, 'Wayman-Baker', 'wayman.baker@so', '2270586717', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (256, 'Alicia-Creek', 'alicia.c@target', '3712472533', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (52, 'Martha-Whitwam', 'martha.whitwam@', '1441117242', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (756, 'Hope-Capshaw', 'hope.capshaw@ca', '28838152', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (63, 'Gavin-McCain', 'g.mccain@oriser', '2330652643', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (959, 'Joan-Guest', 'joan@generalmot', '3062052741', 40, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (420, 'Liquid-Marsden', 'l.marsden@taste', '850074985', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (575, 'Noah-Bugnon', 'noah.b@spinnake', '2451008547', 40, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (551, 'Julie-Horizon', 'julieh@insurmar', '3762714280', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (755, 'Kate-Magnuson', 'kate.m@logistic', '1029865395', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (428, 'Kate-Wine', 'kate.wine@nmr.c', '761048004', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (138, 'Amanda-Thewlis', 'amanda.thewlis@', '913752806', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (861, 'Philip-England', 'philip.england@', '782555660', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (121, 'Brian-Hudson', 'bhudson@catamou', '1757587950', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (84, 'Lindsay-Keener', 'lindsay.keener@', '2984494320', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (166, 'Lynette-Playboy', 'lynette.p@volks', '1224495102', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (791, 'Rebecca-Deejay', 'rebecca@viacom.', '2452463459', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (617, 'Madeline-Potter', 'madeline.potter', '624120968', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (11, 'Rascal-Withers', 'rascal.withers@', '3668236870', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (281, 'Kenny-Flack', 'kenny.f@ksj.com', '2320995528', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (770, 'Radney-Tinsley', 'radney.tinsley@', '2995648440', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (14, 'Kyle-Wincott', 'kyle@tilia.com', '3979541254', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (30, 'Eddie-Meniketti', 'eddie.meniketti', '2283995079', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (983, 'Christina-Whitm', 'christina.whitm', '2384598262', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (936, 'Armand-Singh', 'armand.singh@we', '1456514642', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (437, 'Boz-Rodriguez', 'boz@studiobprod', '2614273188', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (151, 'Gary-Young', 'gary.young@mast', '3666213741', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (806, 'Bridgette-Green', 'bridgetteg@dsp.', '2217515395', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (70, 'Philip-Braugher', 'philip.braugher', '3123074303', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (659, 'Herbie-Scheider', 'herbie.scheider', '3488135319', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (767, 'Lynn-LaSalle', 'llasalle@telech', '647181112', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (743, 'Shelby-Numan', 'shelby@electric', '824714998', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (919, 'Machine-Leachma', 'machine.leachma', '1639049548', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (268, 'William-Fiennes', 'william.fiennes', '2257265079', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (521, 'Busta-Wiest', 'busta.wiest@3ts', '1080789092', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (170, 'Temuera-Colton', 'temuerac@micros', '679560738', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (104, 'Leslie-Stamp', 'l.stamp@efcbanc', '3674894175', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (632, 'Kenny-Coburn', 'kennyc@nike.com', '3132640080', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (375, 'Lara-Ramirez', 'lramirez@epamsy', '545568228', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (53, 'Natacha-Collie', 'natacha.c@everg', '4226552235', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (399, 'Cledus-Phifer', 'cledus.phifer@m', '2840670431', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (292, 'Anthony-Shatner', 'anthony.shatner', '1391037383', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (895, 'Morgan-Bates', 'morgan.bates@sm', '4256551174', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (231, 'Charlie-Sedaka', 'csedaka@kiamoto', '3037903540', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (769, 'Cyndi-Latifah', 'cyndi.latifah@u', '2144330714', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (754, 'Naomi-Phifer', 'nphifer@gdi.ca', '4231482438', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (177, 'Julie-Karyo', 'julie.karyo@sys', '1434393075', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (402, 'Sean-Bello', 'seanb@adeasolut', '3374871786', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (783, 'Crispin-Estevez', 'cestevez@wci.co', '3809789055', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (69, 'Marianne-Lauper', 'marianne.l@albe', '1100855486', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (377, 'Catherine-Butle', 'catherine.butle', '3355041267', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (162, 'Danni-Herndon', 'danni.herndon@g', '2922015841', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (759, 'Cuba-Costner', 'cuba.costner@am', '3990670701', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (276, 'Jennifer-Krumho', 'jennifer.krumho', '2821483143', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (73, 'Clint-Steagall', 'csteagall@cmi.d', '1142929992', 40, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (693, 'Karon-Heston', 'karon.heston@as', '2943928219', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (491, 'Temuera-Liotta', 't.liotta@bioref', '1161826707', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (777, 'Loreena-Whitmor', 'loreenaw@anwort', '1434215247', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (989, 'Machine-Baez', 'machine.baez@ma', '3370642028', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (689, 'Holland-Bright', 'hbright@ccfhold', '1335265123', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (514, 'Talvin-Patton', 'talvin.patton@p', '1915267541', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (927, 'Sinead-Cervine', 'sinead@proclari', '3748430992', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (209, 'Mae-Nunn', 'mae@terrafirma.', '1148826746', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (224, 'Roberta-Joli', 'robertaj@electr', '1586687188', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (532, 'Vendetta-Marx', 'vendetta.marx@u', '3593280755', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (147, 'Clea-Lucien', 'clea.lucien@exi', '2470266446', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (990, 'Cary-Roy Parnel', 'croyparnell@ame', '3047620441', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (145, 'Emilio-Broza', 'emilio@abs.com', '3596336400', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (357, 'Ruth-Loggins', 'ruthl@cns.za', '3905561554', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (588, 'Clarence-Bates', 'clarence.bates@', '1269479430', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (751, 'Suzanne-Vinton', 'suzanne.vinton@', '1859455150', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (91, 'Glenn-Cash', 'glenn.cash@park', '2545224182', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (620, 'Lea-Palin', 'lea.palin@gener', '4225003621', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (393, 'Willem-Rollins', 'willem@officede', '1253456915', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (9, 'Elle-Levin', 'elle@berkshireh', '653182032', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (598, 'Emerson-Garcia', 'emerson@verizon', '1899343491', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (34, 'Stephanie-Parke', 'stephanie.parke', '1195200980', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (495, 'Maury-Farina', 'maury.farina@us', '1053374057', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (786, 'Tom-Hanks', 'tom.hanks@fetch', '810253289', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (480, 'Davy-Quatro', 'davy.quatro@nta', '923212137', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (198, 'Kenneth-Withers', 'k.witherspoon@k', '891751447', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (216, 'Colleen-Hutton', 'c.hutton@tlsser', '1610119815', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (600, 'Mitchell-Pride', 'mitchell.pride@', '2114553523', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (618, 'Richard-Dunst', 'richard.dunst@a', '3674768993', 50, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (732, 'Queen-Jamal', 'queen.jamal@ams', '3435370038', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (433, 'Miranda-Apple', 'miranda.apple@e', '2720952158', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (565, 'Vern-Cage', 'vern@dillards.d', '3300830969', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (586, 'Judi-Rhames', 'judi@pioneerdat', '1233172289', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (115, 'Emerson-Place', 'emerson@ezecast', '967376656', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (317, 'Chris-Hector', 'chris@greenmoun', '1274844879', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (536, 'Patti-Rea', 'patti.rea@visio', '1610052648', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (345, 'Boyd-Sharp', 'boyd@marlabs.jp', '3253618161', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (916, 'Miranda-Duvall', 'miranda.d@gtp.z', '599140118', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (863, 'Tilda-Fariq', 't.fariq@volkswa', '1192693271', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (71, 'Nelly-Ribisi', 'nelly.ribisi@pr', '3090862295', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (440, 'Luis-Flanagan', 'luis@venoco.com', '4058568726', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (678, 'Carla-Vai', 'carla@kis.uk', '1928840076', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (909, 'Neve-Reed', 'neve.reed@ccfho', '2387187814', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (795, 'Judi-Ramirez', 'judi.ramirez@he', '1570208231', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (867, 'Kurtwood-Madsen', 'kurtwood@bat.co', '2729851058', 0, null);
commit;
prompt 100 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (57, 'Holland-Arquett', 'holland.arquett', '2705307107', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (320, 'Rosanna-Tucker', 'rosanna.tucker@', '1784869904', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (796, 'Jean-Claude-McC', 'jeanclaude.mcca', '1947021888', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (872, 'Winona-White', 'wwhite@generale', '2889396583', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (395, 'Loretta-Rourke', 'lrourke@ataserv', '2642569898', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (301, 'Giancarlo-Tenni', 'giancarlot@flav', '964082871', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (318, 'Collective-Free', 'cfreeman@meridi', '3801500357', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (955, 'Hank-Strong', 'hank.strong@nsd', '3884423418', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (208, 'Nicole-Rucker', 'nicole.rucker@c', '2691197628', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (108, 'Ray-Kline', 'r.kline@grs.com', '1488086880', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (967, 'Alec-Boorem', 'alec.b@linacsys', '1839710812', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (509, 'Jose-Li', 'jli@ogiointerna', '846896267', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (484, 'Dionne-Lachey', 'dionne.lachey@f', '3754847089', 40, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (218, 'Rhona-Perry', 'rhonap@componen', '4005975737', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (772, 'Eileen-Haynes', 'eileen.haynes@n', '535308298', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (501, 'Sarah-Yorn', 'sarah.yorn@aris', '3801333002', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (945, 'Shawn-Renfro', 'shawn.renfro@ma', '3556961100', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (12, 'Garland-Oldman', 'g.oldman@provid', '1932113920', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (508, 'Maceo-Maxwell', 'maceo.maxwell@n', '1895614204', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (382, 'Rene-Dunaway', 'rene.dunaway@mo', '664528874', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (993, 'Yolanda-McDonne', 'ymcdonnell@tech', '3054679165', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (414, 'Casey-Travolta', 'casey.t@gltg.co', '2779830282', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (973, 'Parker-Molina', 'parker.molina@p', '1096686876', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (713, 'Gilbert-Burrows', 'gilbert@mathis.', '3331867031', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (876, 'Reese-Woodard', 'rwoodard@multim', '3048616589', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (76, 'Isaac-Tyson', 'isaac.tyson@spe', '2029994164', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (41, 'Fionnula-Sartai', 'fionnula.sartai', '2592918693', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (1, 'Crystal-Haynes', 'crystal.haynes@', '1492867790', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (545, 'Scott-El-Saher', 'scott.elsaher@c', '2428918053', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (596, 'Harry-Galecki', 'harry.g@horizon', '2373538644', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (18, 'Drew-Skaggs', 'drew@ccb.uk', '1065859559', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (879, 'Nick-Shelton', 'nick.s@target.c', '3194754490', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (481, 'Jill-Neill', 'jill.neill@swi.', '3703090924', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (29, 'Cledus-Vassar', 'cledus.vassar@t', '730734565', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (900, 'Kim-Clooney', 'kimc@virbac.jp', '669946732', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (187, 'Harvey-Bachman', 'harvey.bachman@', '616234840', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (640, 'Uma-Nivola', 'uma.nivola@wrgs', '4043810097', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (441, 'Boyd-Rucker', 'boyd.r@atxforms', '4166236316', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (567, 'Juliana-Snipes', 'julianas@carter', '3600542341', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (784, 'Hikaru-Cleary', 'hikaru.c@mattel', '2065879945', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (595, 'Bonnie-Mattea', 'bmattea@esoftso', '1622123213', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (152, 'Jackson-Coughla', 'jackson.coughla', '1339903322', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (341, 'Grant-Blaine', 'grant.blaine@em', '2152502955', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (352, 'Eileen-Shawn', 'eileen@trinityh', '2686836627', 60, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (842, 'Gaby-Ontiveros', 'gaby@topicsente', '1010850268', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (195, 'Goldie-Gugino', 'goldie.gugino@a', '3405205686', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (389, 'Michelle-Vince', 'mvince@allstar.', '2997357767', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (787, 'Sandra-Giraldo', 'sandra.giraldo@', '1017267070', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (845, 'Lin-MacPherson', 'lin.macpherson@', '18428028', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (485, 'Donal-Harary', 'donal.harary@am', '1226769376', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (38, 'Goran-Heald', 'goran.heald@bri', '3472645645', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (360, 'Nikka-Thurman', 'nikka.thurman@p', '2846927587', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (889, 'Mary-Louise-Man', 'marylouisem@den', '4224062640', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (902, 'Val-Steenburgen', 'val.steenburgen', '3058815776', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (928, 'Radney-Cruise', 'radney@y2market', '2166985774', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (848, 'Joaquim-Jane', 'jjane@netnumina', '2457612996', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (649, 'Grace-Brolin', 'grace.brolin@sp', '2631776471', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (857, 'Mika-Malkovich', 'm.malkovich@mat', '1759481672', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (645, 'Juan-Feore', 'j.feore@gha.com', '4126108396', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (511, 'Naomi-Mahoney', 'n.mahoney@kwraf', '2265481556', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (648, 'Beverley-Costa', 'beverley@author', '31213022', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (311, 'Juliet-Atlas', 'juliet.atlas@ss', '3211049956', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (988, 'Loren-Kapanka', 'loren.kapanka@m', '1159920677', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (765, 'Adrien-Thewlis', 'a.thewlis@hospi', '899719915', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (932, 'Carrie-Edmunds', 'c.edmunds@qls.d', '3756808272', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (303, 'Gary-Checker', 'gary.checker@bi', '1357333059', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (17, 'Chris-Connick', 'cconnick@medsou', '3210634331', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (68, 'Vertical-Belles', 'vertical.belles', '2388370667', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (279, 'Solomon-Uggams', 'solomon.uggams@', '2803639500', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (811, 'Bernard-Bryson', 'bernard.bryson@', '3029730528', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (215, 'Tommy-Aaron', 'tommy.aaron@big', '3469669115', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (942, 'King-Copeland', 'k.copeland@amer', '4083114705', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (302, 'Ted-Magnuson', 'ted@paintedword', '3720365951', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (535, 'Geoffrey-Playbo', 'geoffrey.playbo', '2072259994', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (269, 'Darius-Giannini', 'darius.g@youngi', '637064367', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (930, 'Ike-Forrest', 'ike.forrest@ahl', '1384427922', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (572, 'Treat-Dreyfuss', 'treat.dreyfuss@', '1059643543', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (549, 'Richie-Burke', 'richie@bashen.z', '2775887742', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (23, 'CeCe-Aaron', 'cece.aaron@swi.', '2832466084', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (234, 'Debi-Borden', 'debi.borden@nlx', '2761395904', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (253, 'Eileen-Adkins', 'eadkins@inzone.', '671518750', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (999, 'Dan-Cohen', 'bernie.keithba', '3002526439', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (85, 'Sydney-Bean', 'sydney.bean@ufs', '2731996739', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (469, 'Kitty-Kudrow', 'kitty.kudrow@se', '1472519275', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (964, 'Hope-LaSalle', 'hopel@generalmi', '1155589755', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (808, 'Javon-Deschanel', 'javon.deschanel', '1929539443', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (907, 'Rebeka-Cattrall', 'rebeka.cattrall', '2974964442', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (397, 'Oded-Tate', 'oded@capitolban', '1942705101', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (342, 'Ian-Sepulveda', 'ians@spotfireho', '55137777', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (938, 'Roberta-Roberts', 'robertar@ubp.za', '1768462700', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (738, 'Dabney-Perrinea', 'dabney.p@whitew', '1255527002', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (571, 'Tal-Romijn-Stam', 'tal.romijnstamo', '3684615271', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (677, 'Johnny-Branagh', 'j.branagh@nexxt', '2536970542', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (175, 'Geena-Whitman', 'geena.whitman@c', '1440475633', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (89, 'Freddie-Peet', 'freddie.peet@aq', '1243683319', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (482, 'Isaac-Dalley', 'isaac@gsat.com', '1621455800', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (746, 'Kyra-Garza', 'kyra@iss.ca', '4153835807', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (965, 'Gloria-Kier', 'gkier@smartroni', '4277127489', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (40, 'Juan-Lucas', 'j.lucas@tama.de', '506958119', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (985, 'Rosco-Frampton', 'rosco.frampton@', '1050257418', 10, null);
commit;
prompt 200 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (332, 'Marley-Numan', 'marley.numan@so', '2865209163', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (555, 'Brenda-Tyler', 'btyler@ciwservi', '1179663847', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (523, 'Juan-Connery', 'juan.c@data.fr', '2005505656', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (32, 'Lili-Singh', 'lili.singh@vms.', '3649629659', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (798, 'Loren-Peniston', 'loren.p@sfgo.ca', '1861052875', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (113, 'Keith-Pepper', 'keith.pepper@pr', '4069388170', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (701, 'Lionel-Union', 'lionel@dillards', '2030966712', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (194, 'Molly-Green', 'molly@clorox.fi', '3866383896', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (105, 'Mindy-Myers', 'mindy.myers@ari', '2536523912', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (298, 'Joely-Albright', 'joely.a@ubp.de', '2728929836', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (660, 'Geoff-Numan', 'geoff.numan@sta', '1847243041', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (265, 'Vern-Sarsgaard', 'vern.sarsgaard@', '2118659549', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (830, 'Mena-Kweller', 'mena.k@kitba.co', '2651355106', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (201, 'Jim-Schwarzeneg', 'jim.s@tama.ch', '1068780418', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (764, 'Ani-Sweet', 'ani.sweet@eastm', '3292937838', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (328, 'Dylan-Favreau', 'dylan.favreau@m', '3448773387', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (794, 'Christopher-Hol', 'christopher@aoe', '1937144760', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (72, 'Suzanne-William', 'swilliamson@ass', '1636716192', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (405, 'Michael-Holbroo', 'michaelh@faef.d', '707738883', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (120, 'Lauren-Short', 'lauren.short@ti', '4153236284', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (672, 'Mac-Clarkson', 'mac.clarkson@mc', '3412583186', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (557, 'Lisa-Humphrey', 'lisa.humphrey@g', '1190241922', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (914, 'Catherine-Voigh', 'catherine.voigh', '755017234', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (780, 'Jeffery-Jessee', 'jeffery@fpf.com', '1120525873', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (503, 'Victor-Copeland', 'victor.copeland', '2542669515', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (374, 'Albertina-Roth', 'albertina.roth@', '3814200202', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (828, 'Marley-Armatrad', 'marley.armatrad', '631747546', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (608, 'Moe-Weaver', 'm.weaver@tropic', '3123465756', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (486, 'Darius-Hector', 'darius.hector@w', '4048366738', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (858, 'Kylie-Hannah', 'khannah@nsd.uk', '686745645', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (984, 'Arturo-Lawrence', 'arturo@ataservi', '2412447104', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (935, 'Bobbi-Sawa', 'bobbi.sawa@univ', '551178982', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (949, 'Blair-Briscoe', 'blair.briscoe@s', '3656062995', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (498, 'Carole-Dillane', 'c.dillane@kello', '2808736567', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (434, 'Barry-Colon', 'barry.colon@ape', '2142183790', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (849, 'Matt-Stigers', 'm.stigers@cis.c', '1319605181', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (36, 'Pam-Deejay', 'pam.deejay@cata', '2564457421', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (367, 'Carrie-Anne-Rai', 'crain@accuship.', '890380862', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (390, 'Thin-Cattrall', 'thin.cattrall@k', '2383339312', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (21, 'Mel-Womack', 'mel.womack@worl', '2072319453', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (64, 'Jay-Lavigne', 'jay.lavigne@sm.', '1460552962', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (566, 'Lenny-Cook', 'lenny.cook@pra.', '1043731008', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (383, 'Roberta-Hobson', 'r.hobson@infini', '1697528263', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (534, 'Yolanda-Morriso', 'yolanda@telepoi', '2567153947', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (213, 'Raymond-Skarsga', 'rskarsgard@mont', '8163302', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (270, 'Juliette-Hayes', 'juliette.hayes@', '3131292085', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (444, 'Kevn-Warden', 'kevn.w@digitalm', '1369713939', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (236, 'Emma-Moraz', 'emma.moraz@staf', '1801105643', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (156, 'Brothers-Karyo', 'bkaryo@vspan.br', '582483459', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (472, 'Ivan-Fiorentino', 'i.fiorentino@pr', '786433786', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (622, 'Wes-Santana', 'wess@gagwear.pt', '706996003', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (854, 'Vince-Faithfull', 'vince@networkdi', '2669702203', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (908, 'Sal-Brandt', 'sal.brandt@well', '2679787434', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (797, 'Oded-McDowall', 'oded.mcdowall@h', '815587364', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (258, 'Michael-Lloyd', 'michael@entelli', '522887581', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (412, 'Leon-Gough', 'leon.gough@mult', '2818252113', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (97, 'Vincent-Bell', 'vincent.bell@nr', '3960003655', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (378, 'Terence-Davies', 'terenced@neogen', '616946868', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (283, 'George-Peterson', 'george.peterson', '2274427089', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (790, 'Ozzy-Getty', 'ozzy@myricom.za', '3176876736', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (656, 'Marlon-Emmett', 'marlon.emmett@d', '2283472457', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (291, 'Lois-Senior', 'lois.senior@anh', '2064143042', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (675, 'Dar-Mohr', 'dar.m@spenser.c', '2369182846', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (365, 'James-Merchant', 'james.merchant@', '2057738767', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (994, 'Mitchell-Crysta', 'm.crystal@colga', '2762008759', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (633, 'Bobby-Brosnan', 'bobby.brosnan@t', '1776018292', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (282, 'Caroline-Prinze', 'caroline.prinze', '2533825955', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (401, 'Juliet-Choice', 'juliet.choice@f', '3081377274', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (946, 'Ashton-Duke', 'ashton.duke@evi', '3473133526', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (139, 'Jean-Claude-Bel', 'j.bello@pib.com', '3316388122', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (488, 'Horace-Reid', 'horacer@saralee', '1413001920', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (178, 'Brad-Lipnicki', 'bradl@sds.fi', '719219685', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (293, 'Bruce-Gibbons', 'bruce@ceom.com', '3216342117', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (386, 'Chi-Hamilton', 'chi.hamilton@og', '592020105', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (846, 'William-Eldard', 'william@verizon', '3693554284', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (844, 'Liquid-Allen', 'liquida@nsd.com', '3373563180', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (836, 'Andrae-Short', 'andrae.short@sh', '3470207940', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (976, 'Demi-Cheadle', 'demi.cheadle@bi', '1858364832', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (839, 'Avril-Hingle', 'avril@priorityl', '566344697', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (589, 'Bridgette-Nelli', 'bridgette@fetch', '3353572319', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (408, 'Lila-Malone', 'lilam@studiobpr', '1636792009', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (100, 'Lonnie-Aiken', 'lonniea@kiamoto', '3289217596', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (533, 'Deborah-Cusack', 'deborah.cusack@', '982898859', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (316, 'Malcolm-Judd', 'malcolm.judd@ab', '714922900', 40, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (840, 'Charles-Loeb', 'charles.loeb@ds', '1486084953', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (747, 'Amanda-Phillips', 'amanda.phillips', '2006003891', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (99, 'Delroy-Curtis', 'delroy.curtis@i', '3819054809', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (631, 'Brittany-Curtis', 'brittany.curtis', '3075190623', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (740, 'Jesus-Skaggs', 'jesus.skaggs@ax', '3272970185', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (77, 'Nikka-Pfeiffer', 'nikka.pfeiffer@', '2298696546', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (757, 'Thomas-Eckhart', 'thomas.eckhart@', '3696969188', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (346, 'Keith-Leary', 'keith@randomwal', '2523510879', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (865, 'Rosco-Davies', 'rosco.davies@kn', '2700513590', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (330, 'Balthazar-Jonze', 'balthazar.jonze', '2030038165', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (705, 'Ned-Redford', 'nredford@consul', '4123302985', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (749, 'Rebecca-Gere', 'rebecca.gere@in', '1777909269', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (852, 'Bette-Schiff', 'bette.schiff@st', '2074778849', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (487, 'Rip-Hyde', 'rip.hyde@contra', '4260512493', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (275, 'Giovanni-Cherry', 'giovanni.cherry', '766562289', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (349, 'Joshua-Donelly', 'joshua.donelly@', '895025102', 0, null);
commit;
prompt 300 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (425, 'Gord-Monk', 'gord.monk@alter', '3195468446', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (528, 'Vickie-Fierstei', 'vickie.fierstei', '3949064355', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (972, 'Alec-Zappacosta', 'alec.zappacosta', '59116495', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (66, 'Clint-Gill', 'c.gill@globalwi', '835908787', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (635, 'Lily-Charles', 'l.charles@infov', '3656099963', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (975, 'Kelli-Evett', 'kelli.evett@ubp', '3789692440', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (299, 'Joanna-Cochran', 'joannac@priorit', '2481349511', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (117, 'Jeremy-Venora', 'jeremy@calence.', '2657913434', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (554, 'Ned-Manning', 'ned.manning@uni', '1995340926', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (824, 'Goran-Neville', 'goran.neville@m', '2374007156', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (939, 'Jeremy-Griffith', 'jeremy.griffith', '3647317442', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (26, 'Jay-Tyson', 'jayt@aoltimewar', '1483329094', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (499, 'Freda-Dillane', 'freda.dillane@t', '1676862361', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (599, 'Vickie-Lewin', 'vickie.lewin@as', '4030853967', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (368, 'Wally-Magnuson', 'wally.magnuson@', '1075591363', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (287, 'Lydia-Derringer', 'lderringer@bene', '1731560776', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (527, 'Freddy-Rucker', 'freddyr@timevis', '821845631', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (65, 'Sigourney-Phill', 'sphillips@summi', '1596348976', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (931, 'Chuck-Hiatt', 'chuck.hiatt@nor', '2124018733', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (462, 'Armin-Olin', 'armin.olin@joll', '2686232973', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (415, 'Olga-Goodall', 'olga.goodall@ar', '1174497826', 30, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (167, 'Andrew-Daniels', 'andrewd@gagwear', '971733588', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (603, 'Sigourney-Wooda', 'sigourney.w@sol', '4232171588', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (977, 'Joanna-Coverdal', 'joanna.c@team.c', '4113323463', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (729, 'Aida-Perlman', 'aida.perlman@ca', '1602615407', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (497, 'Lynette-McDonal', 'lynette.mcdonal', '3534369884', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (5, 'Nicolas-Keaton', 'nicolas.keaton@', '1929378273', 20, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (137, 'Kiefer-Lennox', 'kiefer.lennox@z', '1678542245', 10, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (15, 'Mike-McGriff', 'mikem@fetchlogi', '2654265182', 0, null);
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (803, ' Alice Brown', ' alice@ex.com', null, 0, ' 123 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (961, ' Bob Smith', ' bob@ex.com', null, 0, ' 456 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (347, ' Carol Johnson', ' carol@ex.com', null, 0, ' 789 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (793, ' David Wilson', ' david@ex.com', null, 0, ' 321 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (271, ' Eve Davis', ' eve@ex.com', null, 0, ' 654 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (124, ' Frank Miller', ' frank@ex.com', null, 0, ' 987 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (203, ' Grace Lee', ' grace@ex.com', null, 0, ' 111 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (788, ' Henry Clark', ' henry@ex.com', null, 0, ' 222 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (189, ' Irene Lewis', ' irene@ex.com', null, 0, ' 333 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (880, ' Jack Walker', ' jack@ex.com', null, 0, ' 444 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (956, 'Dan Smith', 'dan.s@email.com', null, 0, '85 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (385, 'Jane Wilson', 'jane.@mail.com', null, 0, '44 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (456, 'Carol Brown', 'carol@ex.com', null, 0, '64 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (446, 'Jane Johnson', 'jane.@ex.com', null, 0, '779 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (619, 'Eve Jones', 'eve.j@site.com', null, 0, '922 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (471, 'Alice Davis', 'alice@email.com', null, 0, '325 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (716, 'Alice Smith', 'alice@site.com', null, 0, '341 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (235, 'Alice Williams', 'alice@email.com', null, 0, '889 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (929, 'Carol Garcia', 'carol@ex.com', null, 0, '385 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (883, 'Alice Williams', 'alice@web.com', null, 0, '946 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (364, 'Bob Johnson', 'bob.j@email.com', null, 0, '862 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (190, 'Carol Smith', 'carol@mail.com', null, 0, '233 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (981, 'Frank Jones', 'frank@ex.com', null, 0, '509 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (430, 'Alice Miller', 'alice@site.com', null, 0, '126 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (597, 'Dan Smith', 'dan.s@ex.com', null, 0, '986 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (753, 'Jane Jones', 'jane.@email.com', null, 0, '926 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (870, 'John Wilson', 'john.@email.com', null, 0, '483 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (820, 'Eve Garcia', 'eve.g@ex.com', null, 0, '482 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (210, 'Dan Johnson', 'dan.j@ex.com', null, 0, '893 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (519, 'Eve Davis', 'eve.d@site.com', null, 0, '722 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (579, 'Frank Williams', 'frank@web.com', null, 0, '914 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (136, 'Alice Brown', 'alice@ex.com', null, 0, '893 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (432, 'Jane Brown', 'jane.@email.com', null, 0, '78 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (422, 'John Smith', 'john.@mail.com', null, 0, '382 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (877, 'Jane Davis', 'jane.@ex.com', null, 0, '268 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (997, 'John Wilson', 'john.@mail.com', null, 0, '945 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (715, 'Alice Doe', 'alice@mail.com', null, 0, '218 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (221, 'Grace Johnson', 'grace@email.com', null, 0, '646 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (779, 'Henry Davis', 'henry@mail.com', null, 0, '289 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (155, 'Dan Brown', 'dan.b@email.com', null, 0, '214 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (815, 'Carol Davis', 'carol@email.com', null, 0, '286 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (141, 'Frank Davis', 'frank@email.com', null, 0, '603 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (838, 'Jane Williams', 'jane.@web.com', null, 0, '135 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (606, 'Henry Garcia', 'henry@site.com', null, 0, '290 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (711, 'Frank Brown', 'frank@site.com', null, 0, '735 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (741, 'Carol Davis', 'carol@ex.com', null, 0, '3 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (835, 'Henry Williams', 'henry@ex.com', null, 0, '134 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (494, 'Carol Brown', 'carol@web.com', null, 0, '49 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (507, 'Dan Davis', 'dan.d@ex.com', null, 0, '91 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (833, 'Henry Williams', 'henry@mail.com', null, 0, '54 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (702, 'Alice Wilson', 'alice@site.com', null, 0, '580 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (409, 'Frank Jones', 'frank@email.com', null, 0, '704 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (102, 'Frank Garcia', 'frank@web.com', null, 0, '998 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (241, 'Dan Garcia', 'dan.g@email.com', null, 0, '81 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (906, 'Frank Garcia', 'frank@ex.com', null, 0, '408 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (202, 'John Williams', 'john.@mail.com', null, 0, '92 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (355, 'Grace Garcia', 'grace@ex.com', null, 0, '937 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (570, 'John Brown', 'john.@ex.com', null, 0, '814 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (894, 'Alice Davis', 'alice@ex.com', null, 0, '683 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (327, 'Eve Wilson', 'eve.w@web.com', null, 0, '769 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (957, 'John Johnson', 'john.@email.com', null, 0, '795 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (230, 'Frank Smith', 'frank@web.com', null, 0, '756 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (191, 'Carol Garcia', 'carol@mail.com', null, 0, '231 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (789, 'Dan Miller', 'dan.m@web.com', null, 0, '799 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (429, 'Grace Garcia', 'grace@email.com', null, 0, '22 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (560, 'Jane Doe', 'jane.@ex.com', null, 0, '868 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (372, 'Alice Williams', 'alice@mail.com', null, 0, '408 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (923, 'Henry Smith', 'henry@web.com', null, 0, '156 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (500, 'Eve Miller', 'eve.m@mail.com', null, 0, '860 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (745, 'Bob Davis', 'bob.d@mail.com', null, 0, '199 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (614, 'Alice Garcia', 'alice@email.com', null, 0, '370 Willow St');
commit;
prompt 400 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (714, 'Henry Miller', 'henry@mail.com', null, 0, '849 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (814, 'Henry Smith', 'henry@web.com', null, 0, '190 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (297, 'Carol Jones', 'carol@ex.com', null, 0, '377 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (267, 'Grace Smith', 'grace@mail.com', null, 0, '609 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (132, 'Henry Jones', 'henry@web.com', null, 0, '530 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (969, 'Frank Johnson', 'frank@mail.com', null, 0, '244 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (613, 'Eve Miller', 'eve.m@site.com', null, 0, '188 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (727, 'Jane Brown', 'jane.@email.com', null, 0, '8 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (126, 'Bob Smith', 'bob.s@site.com', null, 0, '908 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (86, 'Alice Smith', 'alice@email.com', null, 0, '570 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (264, 'Eve Davis', 'eve.d@web.com', null, 0, '573 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (396, 'Henry Williams', 'henry@mail.com', null, 0, '61 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (62, 'Jane Brown', 'jane.@web.com', null, 0, '859 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (512, 'Alice Doe', 'alice@ex.com', null, 0, '461 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (225, 'Bob Miller', 'bob.m@ex.com', null, 0, '168 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (587, 'John Miller', 'john.@web.com', null, 0, '591 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (254, 'Carol Johnson', 'carol@ex.com', null, 0, '514 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (44, 'Frank Smith', 'frank@web.com', null, 0, '75 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (2, 'Frank Garcia', 'frank@web.com', null, 0, '832 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (228, 'Grace Wilson', 'grace@web.com', null, 0, '404 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (816, 'Frank Wilson', 'frank@site.com', null, 0, '625 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (56, 'Bob Williams', 'bob.w@mail.com', null, 0, '469 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (159, 'Carol Williams', 'carol@ex.com', null, 0, '428 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (343, 'Eve Williams', 'eve.w@web.com', null, 0, '718 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (421, 'John Jones', 'john.@web.com', null, 0, '525 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (229, 'Carol Smith', 'carol@ex.com', null, 0, '418 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (371, 'Carol Garcia', 'carol@email.com', null, 0, '323 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (546, 'Carol Williams', 'carol@ex.com', null, 0, '726 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (416, 'Jane Johnson', 'jane.@web.com', null, 0, '4 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (676, 'John Brown', 'john.@web.com', null, 0, '761 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (204, 'John Williams', 'john.@ex.com', null, 0, '635 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (884, 'Jane Davis', 'jane.@email.com', null, 0, '997 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (176, 'Grace Smith', 'grace@email.com', null, 0, '181 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (899, 'Frank Jones', 'frank@site.com', null, 0, '899 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (800, 'Bob Jones', 'bob.j@web.com', null, 0, '427 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (273, 'Grace Smith', 'grace@email.com', null, 0, '200 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (182, 'John Johnson', 'john.@ex.com', null, 0, '791 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (558, 'Frank Garcia', 'frank@email.com', null, 0, '841 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (685, 'Carol Williams', 'carol@ex.com', null, 0, '586 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (188, 'Carol Brown', 'carol@site.com', null, 0, '630 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (274, 'Frank Brown', 'frank@email.com', null, 0, '771 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (712, 'Grace Davis', 'grace@web.com', null, 0, '757 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (251, 'Bob Wilson', 'bob.w@mail.com', null, 0, '59 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (59, 'Eve Brown', 'eve.b@email.com', null, 0, '260 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (654, 'Alice Davis', 'alice@web.com', null, 0, '400 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (530, 'John Garcia', 'john.@web.com', null, 0, '354 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (518, 'Bob Smith', 'bob.s@web.com', null, 0, '341 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (655, 'Carol Jones', 'carol@mail.com', null, 0, '114 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (720, 'John Miller', 'john.@ex.com', null, 0, '863 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (810, 'Alice Smith', 'alice@mail.com', null, 0, '777 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (391, 'Henry Brown', 'henry@ex.com', null, 0, '383 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (255, 'Alice Brown', 'alice@site.com', null, 0, '951 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (338, 'Dan Davis', 'dan.d@email.com', null, 0, '258 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (58, 'John Miller', 'john.@ex.com', null, 0, '895 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (403, 'John Brown', 'john.@mail.com', null, 0, '662 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (144, 'Grace Garcia', 'grace@web.com', null, 0, '142 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (474, 'Carol Garcia', 'carol@site.com', null, 0, '873 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (232, 'Jane Miller', 'jane.@site.com', null, 0, '150 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (129, 'Eve Garcia', 'eve.g@ex.com', null, 0, '473 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (569, 'Eve Williams', 'eve.w@mail.com', null, 0, '171 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (882, 'Carol Johnson', 'carol@web.com', null, 0, '700 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (594, 'Carol Davis', 'carol@mail.com', null, 0, '192 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (734, 'Jane Jones', 'jane.@web.com', null, 0, '694 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (540, 'Bob Miller', 'bob.m@ex.com', null, 0, '258 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (941, 'Eve Doe', 'eve.d@mail.com', null, 0, '989 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (710, 'Alice Brown', 'alice@web.com', null, 0, '704 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (697, 'Jane Garcia', 'jane.@ex.com', null, 0, '917 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (192, 'Jane Davis', 'jane.@web.com', null, 0, '252 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (611, 'Grace Jones', 'grace@web.com', null, 0, '186 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (413, 'Eve Miller', 'eve.m@mail.com', null, 0, '215 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (616, 'Dan Davis', 'dan.d@mail.com', null, 0, '678 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (517, 'Frank Smith', 'frank@email.com', null, 0, '279 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (573, 'Eve Johnson', 'eve.j@site.com', null, 0, '160 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (837, 'Grace Jones', 'grace@web.com', null, 0, '41 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (748, 'Grace Jones', 'grace@mail.com', null, 0, '331 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (992, 'Dan Johnson', 'dan.j@site.com', null, 0, '415 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (288, 'Henry Miller', 'henry@ex.com', null, 0, '149 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (272, 'Bob Davis', 'bob.d@mail.com', null, 0, '944 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (304, 'John Miller', 'john.@site.com', null, 0, '516 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (750, 'Carol Jones', 'carol@mail.com', null, 0, '26 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (125, 'Henry Davis', 'henry@site.com', null, 0, '509 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (28, 'Grace Miller', 'grace@mail.com', null, 0, '156 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (653, 'Eve Miller', 'eve.m@email.com', null, 0, '642 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (280, 'Grace Brown', 'grace@web.com', null, 0, '146 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (127, 'Alice Brown', 'alice@web.com', null, 0, '681 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (768, 'Alice Doe', 'alice@mail.com', null, 0, '664 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (101, 'Dan Wilson', 'dan.w@site.com', null, 0, '89 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (336, 'Bob Williams', 'bob.w@mail.com', null, 0, '247 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (694, 'Henry Miller', 'henry@ex.com', null, 0, '583 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (404, 'Frank Smith', 'frank@ex.com', null, 0, '387 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (164, 'Grace Williams', 'grace@ex.com', null, 0, '787 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (122, 'Bob Miller', 'bob.m@web.com', null, 0, '400 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (866, 'Henry Smith', 'henry@mail.com', null, 0, '28 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (679, 'Henry Miller', 'henry@mail.com', null, 0, '821 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (246, 'John Garcia', 'john.@ex.com', null, 0, '362 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (544, 'Eve Doe', 'eve.d@mail.com', null, 0, '484 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (460, 'John Doe', 'john.@mail.com', null, 0, '202 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (687, 'Eve Johnson', 'eve.j@mail.com', null, 0, '70 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (13, 'Jane Smith', 'jane.@web.com', null, 0, '373 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (285, 'Eve Jones', 'eve.j@mail.com', null, 0, '193 Maple St');
commit;
prompt 500 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (891, 'Eve Brown', 'eve.b@mail.com', null, 0, '652 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (442, 'Grace Brown', 'grace@web.com', null, 0, '402 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (834, 'Dan Doe', 'dan.d@site.com', null, 0, '506 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (692, 'Henry Wilson', 'henry@web.com', null, 0, '451 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (361, 'Eve Doe', 'eve.d@mail.com', null, 0, '434 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (110, 'Grace Johnson', 'grace@site.com', null, 0, '208 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (83, 'Frank Miller', 'frank@email.com', null, 0, '554 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (388, 'Carol Davis', 'carol@ex.com', null, 0, '781 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (980, 'Eve Garcia', 'eve.g@email.com', null, 0, '688 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (856, 'Carol Johnson', 'carol@email.com', null, 0, '283 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (805, 'Dan Wilson', 'dan.w@email.com', null, 0, '478 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (448, 'Bob Doe', 'bob.d@site.com', null, 0, '434 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (419, 'Bob Williams', 'bob.w@email.com', null, 0, '311 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (526, 'Henry Miller', 'henry@web.com', null, 0, '539 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (671, 'Frank Jones', 'frank@web.com', null, 0, '499 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (149, 'Henry Johnson', 'henry@ex.com', null, 0, '305 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (809, 'Eve Brown', 'eve.b@ex.com', null, 0, '13 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (550, 'Jane Williams', 'jane.@ex.com', null, 0, '627 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (860, 'Alice Johnson', 'alice@email.com', null, 0, '665 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (591, 'Bob Davis', 'bob.d@mail.com', null, 0, '921 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (634, 'John Smith', 'john.@mail.com', null, 0, '444 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (123, 'Dan Brown', 'dan.b@site.com', null, 0, '719 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (461, 'Henry Garcia', 'henry@mail.com', null, 0, '605 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (704, 'Grace Doe', 'grace@site.com', null, 0, '415 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (407, 'Jane Williams', 'jane.@web.com', null, 0, '791 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (562, 'Carol Miller', 'carol@email.com', null, 0, '649 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (670, 'John Wilson', 'john.@site.com', null, 0, '432 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (812, 'John Miller', 'john.@web.com', null, 0, '257 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (922, 'Dan Brown', 'dan.b@email.com', null, 0, '525 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (823, 'Henry Wilson', 'henry@email.com', null, 0, '947 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (947, 'Grace Wilson', 'grace@ex.com', null, 0, '361 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (580, 'Carol Smith', 'carol@site.com', null, 0, '689 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (308, 'Henry Johnson', 'henry@web.com', null, 0, '514 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (161, 'John Brown', 'john.@ex.com', null, 0, '931 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (662, 'Carol Garcia', 'carol@ex.com', null, 0, '885 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (334, 'John Wilson', 'john.@web.com', null, 0, '711 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (776, 'Jane Doe', 'jane.@site.com', null, 0, '363 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (610, 'Grace Brown', 'grace@web.com', null, 0, '536 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (664, 'Alice Doe', 'alice@email.com', null, 0, '589 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (33, 'Jane Wilson', 'jane.@mail.com', null, 0, '813 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (111, 'Carol Doe', 'carol@site.com', null, 0, '383 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (25, 'Dan Doe', 'dan.d@site.com', null, 0, '459 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (996, 'Frank Davis', 'frank@ex.com', null, 0, '463 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (310, 'Frank Doe', 'frank@email.com', null, 0, '856 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (658, 'Bob Smith', 'bob.s@mail.com', null, 0, '15 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (718, 'Eve Smith', 'eve.s@email.com', null, 0, '34 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (875, 'Bob Jones', 'bob.j@web.com', null, 0, '333 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (286, 'Grace Williams', 'grace@email.com', null, 0, '378 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (339, 'John Davis', 'john.@mail.com', null, 0, '242 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (885, 'Henry Garcia', 'henry@site.com', null, 0, '299 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (851, 'Henry Smith', 'henry@web.com', null, 0, '911 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (827, 'Eve Johnson', 'eve.j@mail.com', null, 0, '638 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (314, 'Carol Williams', 'carol@web.com', null, 0, '710 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (666, 'Dan Smith', 'dan.s@email.com', null, 0, '168 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (333, 'John Wilson', 'john.@mail.com', null, 0, '88 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (496, 'Eve Jones', 'eve.j@web.com', null, 0, '560 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (686, 'Frank Smith', 'frank@email.com', null, 0, '645 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (905, 'Carol Miller', 'carol@site.com', null, 0, '576 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (324, 'John Jones', 'john.@web.com', null, 0, '208 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (4, 'Dan Johnson', 'dan.j@site.com', null, 0, '571 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (832, 'Frank Brown', 'frank@web.com', null, 0, '300 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (918, 'Henry Garcia', 'henry@mail.com', null, 0, '613 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (853, 'Carol Williams', 'carol@ex.com', null, 0, '636 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (568, 'Henry Williams', 'henry@site.com', null, 0, '249 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (87, 'Alice Doe', 'alice@web.com', null, 0, '924 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (585, 'Dan Miller', 'dan.m@mail.com', null, 0, '723 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (723, 'Dan Johnson', 'dan.j@mail.com', null, 0, '638 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (695, 'Dan Brown', 'dan.b@site.com', null, 0, '635 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (576, 'Dan Johnson', 'dan.j@ex.com', null, 0, '618 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (831, 'Alice Smith', 'alice@mail.com', null, 0, '30 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (10, 'John Davis', 'john.@site.com', null, 0, '875 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (418, 'Eve Williams', 'eve.w@web.com', null, 0, '456 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (186, 'Dan Smith', 'dan.s@mail.com', null, 0, '216 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (699, 'Jane Smith', 'jane.@email.com', null, 0, '932 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (226, 'Frank Wilson', 'frank@email.com', null, 0, '252 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (628, 'Dan Davis', 'dan.d@site.com', null, 0, '486 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (163, 'Carol Brown', 'carol@mail.com', null, 0, '683 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (504, 'Grace Miller', 'grace@ex.com', null, 0, '25 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (344, 'Henry Williams', 'henry@mail.com', null, 0, '785 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (211, 'John Garcia', 'john.@ex.com', null, 0, '22 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (799, 'Grace Doe', 'grace@mail.com', null, 0, '524 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (583, 'John Williams', 'john.@ex.com', null, 0, '574 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (392, 'Grace Miller', 'grace@web.com', null, 0, '93 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (505, 'Carol Johnson', 'carol@ex.com', null, 0, '359 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (818, 'Alice Wilson', 'alice@ex.com', null, 0, '509 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (724, 'Grace Smith', 'grace@email.com', null, 0, '200 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (623, 'Frank Doe', 'frank@email.com', null, 0, '431 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (245, 'Bob Miller', 'bob.m@email.com', null, 0, '757 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (239, 'Eve Wilson', 'eve.w@email.com', null, 0, '649 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (351, 'Alice Jones', 'alice@web.com', null, 0, '850 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (158, 'John Miller', 'john.@mail.com', null, 0, '654 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (80, 'Alice Williams', 'alice@site.com', null, 0, '656 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (871, 'Carol Johnson', 'carol@email.com', null, 0, '633 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (179, 'Jane Wilson', 'jane.@web.com', null, 0, '118 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (92, 'Jane Doe', 'jane.@mail.com', null, 0, '96 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (646, 'John Jones', 'john.@email.com', null, 0, '247 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (247, 'Carol Jones', 'carol@site.com', null, 0, '2 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (240, 'Carol Davis', 'carol@email.com', null, 0, '995 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (252, 'Jane Jones', 'jane.@site.com', null, 0, '752 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (652, 'John Brown', 'john.@site.com', null, 0, '785 Willow St');
commit;
prompt 600 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (479, 'Grace Brown', 'grace@site.com', null, 0, '861 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (733, 'Grace Doe', 'grace@ex.com', null, 0, '94 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (708, 'Grace Jones', 'grace@mail.com', null, 0, '682 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (356, 'Dan Davis', 'dan.d@site.com', null, 0, '145 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (690, 'Carol Brown', 'carol@web.com', null, 0, '259 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (903, 'Carol Williams', 'carol@mail.com', null, 0, '461 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (626, 'Frank Davis', 'frank@ex.com', null, 0, '788 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (243, 'John Smith', 'john.@ex.com', null, 0, '405 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (350, 'Alice Smith', 'alice@mail.com', null, 0, '50 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (910, 'Grace Garcia', 'grace@ex.com', null, 0, '288 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (453, 'Dan Miller', 'dan.m@ex.com', null, 0, '501 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (20, 'Henry Williams', 'henry@ex.com', null, 0, '887 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (450, 'Alice Williams', 'alice@site.com', null, 0, '3 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (873, 'Alice Johnson', 'alice@mail.com', null, 0, '491 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (510, 'Frank Smith', 'frank@site.com', null, 0, '90 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (559, 'Carol Miller', 'carol@site.com', null, 0, '429 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (925, 'Dan Garcia', 'dan.g@email.com', null, 0, '933 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (868, 'Dan Davis', 'dan.d@site.com', null, 0, '915 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (112, 'Carol Wilson', 'carol@email.com', null, 0, '281 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (881, 'Eve Williams', 'eve.w@site.com', null, 0, '513 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (43, 'Eve Jones', 'eve.j@web.com', null, 0, '905 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (574, 'Alice Wilson', 'alice@site.com', null, 0, '826 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (629, 'Bob Johnson', 'bob.j@web.com', null, 0, '337 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (220, 'Jane Brown', 'jane.@email.com', null, 0, '259 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (937, 'John Johnson', 'john.@site.com', null, 0, '553 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (604, 'Carol Doe', 'carol@ex.com', null, 0, '629 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (667, 'Henry Smith', 'henry@email.com', null, 0, '444 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (169, 'Dan Brown', 'dan.b@site.com', null, 0, '714 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (893, 'Carol Smith', 'carol@ex.com', null, 0, '39 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (888, 'Bob Johnson', 'bob.j@site.com', null, 0, '215 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (987, 'John Davis', 'john.@ex.com', null, 0, '139 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (719, 'Alice Davis', 'alice@web.com', null, 0, '982 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (410, 'John Brown', 'john.@ex.com', null, 0, '294 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (19, 'Henry Miller', 'henry@site.com', null, 0, '567 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (295, 'Carol Brown', 'carol@mail.com', null, 0, '55 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (325, 'Dan Brown', 'dan.b@ex.com', null, 0, '161 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (95, 'Frank Garcia', 'frank@ex.com', null, 0, '258 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (862, 'Carol Wilson', 'carol@web.com', null, 0, '763 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (6, 'Alice Jones', 'alice@web.com', null, 0, '54 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (181, 'John Smith', 'john.@ex.com', null, 0, '729 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (443, 'Frank Davis', 'frank@email.com', null, 0, '107 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (406, 'Jane Smith', 'jane.@ex.com', null, 0, '940 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (305, 'Alice Brown', 'alice@site.com', null, 0, '331 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (657, 'Frank Wilson', 'frank@ex.com', null, 0, '763 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (183, 'Henry Johnson', 'henry@ex.com', null, 0, '329 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (74, 'John Davis', 'john.@mail.com', null, 0, '418 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (449, 'Alice Jones', 'alice@email.com', null, 0, '337 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (174, 'Grace Brown', 'grace@mail.com', null, 0, '438 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (118, 'Alice Doe', 'alice@web.com', null, 0, '745 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (886, 'Alice Smith', 'alice@email.com', null, 0, '270 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (219, 'Jane Davis', 'jane.@email.com', null, 0, '13 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (468, 'Frank Smith', 'frank@ex.com', null, 0, '147 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (752, 'Carol Garcia', 'carol@web.com', null, 0, '814 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (915, 'Bob Williams', 'bob.w@site.com', null, 0, '88 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (582, 'Grace Davis', 'grace@email.com', null, 0, '455 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (78, 'Dan Davis', 'dan.d@ex.com', null, 0, '173 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (773, 'Alice Garcia', 'alice@site.com', null, 0, '323 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (363, 'Henry Jones', 'henry@site.com', null, 0, '26 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (277, 'Dan Garcia', 'dan.g@web.com', null, 0, '388 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (774, 'Carol Brown', 'carol@site.com', null, 0, '699 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (726, 'Bob Miller', 'bob.m@web.com', null, 0, '45 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (296, 'Frank Davis', 'frank@ex.com', null, 0, '57 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (326, 'Alice Miller', 'alice@site.com', null, 0, '392 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (700, 'Carol Wilson', 'carol@email.com', null, 0, '865 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (193, 'John Miller', 'john.@web.com', null, 0, '308 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (478, 'Henry Brown', 'henry@ex.com', null, 0, '61 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (819, 'Carol Davis', 'carol@mail.com', null, 0, '917 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (502, 'Jane Davis', 'jane.@site.com', null, 0, '635 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (651, 'Dan Smith', 'dan.s@mail.com', null, 0, '741 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (459, 'Grace Williams', 'grace@email.com', null, 0, '655 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (607, 'Frank Smith', 'frank@ex.com', null, 0, '930 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (200, 'Carol Miller', 'carol@email.com', null, 0, '116 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (940, 'Eve Johnson', 'eve.j@email.com', null, 0, '463 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (647, 'Frank Johnson', 'frank@mail.com', null, 0, '649 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (661, 'Dan Davis', 'dan.d@site.com', null, 0, '766 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (869, 'Carol Jones', 'carol@mail.com', null, 0, '890 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (859, 'Grace Brown', 'grace@web.com', null, 0, '616 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (130, 'Eve Wilson', 'eve.w@site.com', null, 0, '22 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (801, 'Frank Davis', 'frank@email.com', null, 0, '607 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (319, 'Alice Brown', 'alice@email.com', null, 0, '437 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (627, 'Henry Garcia', 'henry@ex.com', null, 0, '279 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (260, 'Dan Johnson', 'dan.j@ex.com', null, 0, '872 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (37, 'Carol Doe', 'carol@ex.com', null, 0, '172 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (643, 'Eve Wilson', 'eve.w@email.com', null, 0, '336 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (912, 'Jane Johnson', 'jane.@mail.com', null, 0, '785 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (663, 'Henry Wilson', 'henry@web.com', null, 0, '261 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (529, 'Frank Wilson', 'frank@email.com', null, 0, '254 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (763, 'Alice Jones', 'alice@email.com', null, 0, '13 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (952, 'Bob Johnson', 'bob.j@web.com', null, 0, '721 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (864, 'Eve Johnson', 'eve.j@site.com', null, 0, '374 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (642, 'Dan Davis', 'dan.d@web.com', null, 0, '234 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (98, 'Frank Doe', 'frank@ex.com', null, 0, '360 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (154, 'Jane Johnson', 'jane.@mail.com', null, 0, '787 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (168, 'Frank Brown', 'frank@web.com', null, 0, '196 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (991, 'Dan Brown', 'dan.b@mail.com', null, 0, '391 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (855, 'Eve Johnson', 'eve.j@site.com', null, 0, '270 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (970, 'Dan Miller', 'dan.m@site.com', null, 0, '567 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (874, 'Grace Brown', 'grace@mail.com', null, 0, '431 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (369, 'Alice Doe', 'alice@web.com', null, 0, '18 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (329, 'Frank Johnson', 'frank@web.com', null, 0, '570 Maple St');
commit;
prompt 700 records committed...
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (730, 'Eve Doe', 'eve.d@ex.com', null, 0, '265 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (465, 'Carol Doe', 'carol@site.com', null, 0, '845 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (50, 'Dan Garcia', 'dan.g@web.com', null, 0, '544 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (411, 'Eve Garcia', 'eve.g@email.com', null, 0, '571 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (335, 'Eve Doe', 'eve.d@email.com', null, 0, '54 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (943, 'Dan Johnson', 'dan.j@mail.com', null, 0, '873 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (904, 'Bob Garcia', 'bob.g@site.com', null, 0, '707 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (785, 'Bob Doe', 'bob.d@web.com', null, 0, '595 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (982, 'Jane Smith', 'jane.@email.com', null, 0, '362 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (454, 'Frank Williams', 'frank@email.com', null, 0, '219 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (556, 'Bob Smith', 'bob.s@email.com', null, 0, '238 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (728, 'Dan Williams', 'dan.w@ex.com', null, 0, '748 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (578, 'Alice Wilson', 'alice@mail.com', null, 0, '871 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (331, 'Bob Doe', 'bob.d@mail.com', null, 0, '30 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (322, 'Bob Wilson', 'bob.w@mail.com', null, 0, '906 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (826, 'Carol Williams', 'carol@ex.com', null, 0, '822 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (590, 'Carol Johnson', 'carol@ex.com', null, 0, '327 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (172, 'Henry Brown', 'henry@web.com', null, 0, '947 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (445, 'Jane Williams', 'jane.@email.com', null, 0, '978 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (180, 'Eve Wilson', 'eve.w@web.com', null, 0, '641 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (381, 'Dan Smith', 'dan.s@site.com', null, 0, '122 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (427, 'Eve Brown', 'eve.b@site.com', null, 0, '158 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (94, 'Dan Johnson', 'dan.j@site.com', null, 0, '251 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (847, 'John Brown', 'john.@email.com', null, 0, '643 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (3, 'Frank Williams', 'frank@mail.com', null, 0, '799 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (490, 'John Miller', 'john.@web.com', null, 0, '86 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (577, 'John Jones', 'john.@ex.com', null, 0, '866 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (142, 'Frank Brown', 'frank@ex.com', null, 0, '68 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (541, 'Carol Garcia', 'carol@ex.com', null, 0, '246 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (731, 'Dan Smith', 'dan.s@web.com', null, 0, '662 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (792, 'Eve Brown', 'eve.b@site.com', null, 0, '283 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (735, 'Alice Doe', 'alice@email.com', null, 0, '58 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (217, 'Bob Miller', 'bob.m@email.com', null, 0, '685 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (621, 'Grace Brown', 'grace@email.com', null, 0, '821 Pine St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (605, 'Jane Wilson', 'jane.@mail.com', null, 0, '727 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (353, 'Dan Garcia', 'dan.g@email.com', null, 0, '318 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (263, 'Dan Jones', 'dan.j@mail.com', null, 0, '230 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (103, 'Frank Doe', 'frank@web.com', null, 0, '648 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (455, 'Jane Williams', 'jane.@ex.com', null, 0, '415 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (24, 'Henry Davis', 'henry@email.com', null, 0, '577 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (639, 'John Smith', 'john.@email.com', null, 0, '800 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (625, 'Dan Doe', 'dan.d@mail.com', null, 0, '944 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (525, 'Jane Brown', 'jane.@mail.com', null, 0, '447 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (674, 'Eve Miller', 'eve.m@mail.com', null, 0, '234 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (542, 'Frank Smith', 'frank@email.com', null, 0, '214 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (483, 'Carol Brown', 'carol@ex.com', null, 0, '456 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (897, 'Alice Johnson', 'alice@web.com', null, 0, '177 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (133, 'Jane Williams', 'jane.@ex.com', null, 0, '562 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (107, 'Grace Johnson', 'grace@email.com', null, 0, '809 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (227, 'Jane Davis', 'jane.@site.com', null, 0, '661 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (683, 'Bob Miller', 'bob.m@web.com', null, 0, '621 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (944, 'Bob Miller', 'bob.m@site.com', null, 0, '902 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (706, 'Eve Wilson', 'eve.w@web.com', null, 0, '796 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (67, 'Grace Davis', 'grace@site.com', null, 0, '878 Aspen St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (538, 'Grace Brown', 'grace@web.com', null, 0, '675 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (96, 'Eve Jones', 'eve.j@email.com', null, 0, '205 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (998, 'Frank Brown', 'frank@ex.com', null, 0, '992 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (109, 'Alice Garcia', 'alice@site.com', null, 0, '412 Maple St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (766, 'Bob Garcia', 'bob.g@ex.com', null, 0, '663 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (995, 'Carol Williams', 'carol@email.com', null, 0, '949 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (681, 'Jane Williams', 'jane.@web.com', null, 0, '14 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (684, 'Frank Doe', 'frank@mail.com', null, 0, '871 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (358, 'Carol Doe', 'carol@email.com', null, 0, '305 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (248, 'Eve Garcia', 'eve.g@ex.com', null, 0, '890 Oak St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (817, 'Frank Doe', 'frank@email.com', null, 0, '412 Willow St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (520, 'Bob Smith', 'bob.s@web.com', null, 0, '992 Birch St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (222, 'Jane Davis', 'jane.@ex.com', null, 0, '380 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (278, 'Eve Brown', 'eve.b@email.com', null, 0, '620 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (0, 'Henry Garcia', 'henry@mail.com', null, 0, '107 Cedar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (366, 'Bob Doe', 'bob.d@web.com', null, 0, '124 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (354, 'John Williams', 'john.@mail.com', null, 0, '402 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (470, 'Bob Williams', 'bob.w@web.com', null, 0, '364 Elm St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (16, 'Alice Wilson', 'alice@ex.com', null, 0, '736 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (313, 'Eve Davis', 'eve.d@email.com', null, 0, '1 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (153, 'Carol Wilson', 'carol@email.com', null, 0, '195 Poplar St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (362, 'Eve Davis', 'eve.d@email.com', null, 0, '716 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (250, 'Dan Davis', 'dan.d@web.com', null, 0, '841 Cherry St');
insert into CUSTOMER (cid, cname, cemail, cphone, loyaltypoints, caddress)
values (473, 'Carol Williams', 'carol@web.com', null, 0, '61 Maple St');
commit;
prompt 778 records loaded
prompt Loading DRESS...
insert into DRESS (did, length, color, price, rentalcount)
values (280, 173, 'Khaki', 571, 6);
insert into DRESS (did, length, color, price, rentalcount)
values (336, 186, 'Orange', 701, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (523, 106, 'Khaki', 570, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (705, 171, 'Red', 980, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (617, 172, 'Indigo', 961, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (769, 101, 'Crimson', 270, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (396, 141, 'Purple', 181, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (384, 151, 'Red', 896, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (697, 133, 'Aquamarine', 719, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (137, 108, 'Khaki', 731, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (200, 178, 'Aquamarine', 895, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (64, 106, 'Maroon', 800, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (9, 118, 'Aquamarine', 808, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (195, 120, 'Red', 990, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (58, 169, 'Red', 555, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (513, 114, 'Maroon', 436, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (914, 141, 'Mauv', 836, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (912, 141, 'Purple', 747, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (576, 149, 'Orange', 329, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (284, 170, 'Purple', 864, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (629, 178, 'Indigo', 364, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (642, 138, 'Blue', 899, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (817, 182, 'Blue', 646, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (383, 187, 'Orange', 506, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (39, 100, 'Puce', 559, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (501, 153, 'Violet', 809, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (424, 155, 'Fuscia', 579, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (73, 186, 'Crimson', 308, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (552, 130, 'Violet', 742, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (335, 181, 'Yellow', 660, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (468, 167, 'Turquoise', 758, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (489, 178, 'Purple', 370, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (988, 122, 'Mauv', 705, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (564, 181, 'Yellow', 968, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (451, 187, 'Orange', 767, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (743, 153, 'Teal', 258, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (690, 178, 'Khaki', 904, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (437, 135, 'Khaki', 500, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (422, 140, 'Green', 792, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (135, 110, 'Fuscia', 189, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (571, 171, 'Red', 808, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (281, 109, 'Crimson', 731, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (677, 115, 'Teal', 940, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (215, 153, 'Orange', 468, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (725, 177, 'Aquamarine', 943, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (487, 162, 'Turquoise', 518, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (744, 124, 'Turquoise', 700, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (859, 112, 'Teal', 992, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (943, 128, 'Pink', 495, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (49, 120, 'Orange', 523, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (638, 189, 'Blue', 759, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (86, 117, 'Goldenrod', 647, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (586, 128, 'Red', 108, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (428, 172, 'Teal', 158, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (993, 168, 'Blue', 126, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (406, 128, 'Orange', 938, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (555, 123, 'Pink', 277, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (950, 161, 'Turquoise', 601, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (843, 187, 'Fuscia', 568, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (680, 132, 'Pink', 805, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (894, 158, 'Red', 282, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (890, 188, 'Orange', 162, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (621, 179, 'Khaki', 608, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (865, 121, 'Pink', 331, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (896, 115, 'Goldenrod', 552, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (855, 156, 'Green', 815, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (301, 131, 'Mauv', 446, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (936, 128, 'Yellow', 650, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (197, 144, 'Turquoise', 614, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (27, 157, 'Purple', 210, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (246, 167, 'Orange', 658, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (57, 137, 'Violet', 843, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (937, 106, 'Puce', 985, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (902, 118, 'Crimson', 638, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (84, 180, 'Blue', 377, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (771, 179, 'Khaki', 235, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (544, 142, 'Maroon', 381, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (401, 128, 'Indigo', 584, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (279, 167, 'Green', 410, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (626, 155, 'Green', 317, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (818, 103, 'Purple', 956, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (90, 175, 'Indigo', 703, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (436, 117, 'Orange', 118, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (867, 122, 'Blue', 878, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (125, 138, 'Goldenrod', 631, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (565, 111, 'Blue', 350, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (444, 185, 'Purple', 991, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (927, 132, 'Green', 210, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (342, 101, 'Indigo', 106, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (211, 175, 'Mauv', 454, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (87, 181, 'Fuscia', 490, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (553, 105, 'Blue', 908, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (456, 182, 'Red', 103, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (334, 125, 'Turquoise', 489, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (820, 112, 'Crimson', 890, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (567, 184, 'Goldenrod', 493, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (149, 129, 'Pink', 257, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (356, 180, 'Puce', 194, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (533, 122, 'Aquamarine', 733, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (952, 135, 'Crimson', 943, 1);
commit;
prompt 100 records committed...
insert into DRESS (did, length, color, price, rentalcount)
values (599, 174, 'Puce', 246, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (634, 159, 'Orange', 735, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (525, 122, 'Green', 185, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (373, 120, 'Aquamarine', 212, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (318, 139, 'Violet', 538, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (806, 116, 'Fuscia', 372, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (538, 158, 'Red', 683, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (395, 173, 'Yellow', 169, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (409, 148, 'Violet', 789, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (919, 108, 'Khaki', 114, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (61, 180, 'Goldenrod', 591, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (473, 129, 'Turquoise', 114, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (602, 118, 'Yellow', 627, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (415, 144, 'Violet', 300, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (147, 182, 'Mauv', 105, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (416, 149, 'Teal', 582, 5);
insert into DRESS (did, length, color, price, rentalcount)
values (107, 114, 'Red', 461, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (443, 187, 'Green', 527, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (263, 177, 'Aquamarine', 441, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (296, 121, 'Puce', 254, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (209, 125, 'Pink', 782, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (106, 176, 'Purple', 401, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (288, 144, 'Indigo', 899, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (257, 158, 'Khaki', 613, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (397, 164, 'Crimson', 825, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (458, 142, 'Yellow', 876, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (640, 119, 'Indigo', 151, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (371, 182, 'Aquamarine', 769, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (734, 186, 'Pink', 205, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (591, 113, 'Puce', 422, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (143, 123, 'Crimson', 238, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (506, 178, 'Khaki', 924, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (970, 120, 'Purple', 962, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (823, 143, 'Fuscia', 274, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (98, 132, 'Green', 746, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (340, 106, 'Teal', 151, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (333, 140, 'Maroon', 213, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (266, 180, 'Green', 170, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (853, 161, 'Violet', 924, 5);
insert into DRESS (did, length, color, price, rentalcount)
values (979, 159, 'Yellow', 481, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (685, 153, 'Pink', 336, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (733, 119, 'Puce', 357, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (368, 185, 'Mauv', 742, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (394, 138, 'Aquamarine', 377, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (838, 184, 'Orange', 291, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (156, 138, 'Maroon', 785, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (819, 128, 'Crimson', 831, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (541, 145, 'Blue', 802, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (228, 176, 'Red', 629, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (72, 102, 'Yellow', 960, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (783, 168, 'Fuscia', 434, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (382, 124, 'Teal', 889, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (996, 160, 'Green', 729, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (747, 132, 'Green', 798, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (773, 102, 'Maroon', 747, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (414, 148, 'Puce', 557, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (995, 135, 'Maroon', 763, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (223, 120, 'Indigo', 187, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (459, 162, 'Yellow', 918, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (204, 138, 'Fuscia', 401, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (870, 178, 'Goldenrod', 368, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (438, 176, 'Mauv', 229, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (944, 152, 'Yellow', 107, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (955, 150, 'Teal', 869, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (457, 160, 'Puce', 160, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (732, 138, 'Crimson', 114, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (449, 189, 'Indigo', 533, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (269, 101, 'Red', 768, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (10, 171, 'Red', 559, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (134, 168, 'Fuscia', 815, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (230, 150, 'Turquoise', 723, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (51, 165, 'Red', 249, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (19, 129, 'Khaki', 277, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (231, 162, 'Orange', 699, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (155, 144, 'Aquamarine', 775, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (174, 151, 'Goldenrod', 481, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (387, 130, 'Turquoise', 930, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (980, 189, 'Red', 446, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (623, 118, 'Blue', 760, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (173, 105, 'Puce', 367, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (1, 107, 'Indigo', 596, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (517, 100, 'Turquoise', 361, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (210, 130, 'Aquamarine', 508, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (213, 177, 'Khaki', 149, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (562, 168, 'Green', 321, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (270, 117, 'Teal', 215, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (997, 190, 'Orange', 111, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (846, 111, 'Indigo', 664, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (949, 152, 'Khaki', 445, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (16, 126, 'Violet', 532, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (829, 161, 'Fuscia', 356, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (784, 112, 'Purple', 665, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (326, 147, 'Purple', 295, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (88, 158, 'Green', 118, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (347, 182, 'Mauv', 917, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (399, 179, 'Crimson', 806, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (133, 132, 'Orange', 289, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (717, 107, 'Teal', 561, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (169, 117, 'Khaki', 558, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (895, 158, 'Yellow', 297, 0);
commit;
prompt 200 records committed...
insert into DRESS (did, length, color, price, rentalcount)
values (749, 181, 'Turquoise', 575, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (947, 126, 'Yellow', 343, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (302, 108, 'Red', 153, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (167, 102, 'Green', 505, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (736, 118, 'Pink', 847, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (946, 139, 'Blue', 536, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (256, 132, 'Pink', 800, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (431, 112, 'Turquoise', 882, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (573, 182, 'Turquoise', 475, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (32, 134, 'Indigo', 308, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (875, 138, 'Turquoise', 783, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (647, 100, 'Crimson', 322, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (4, 112, 'Green', 210, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (45, 116, 'Blue', 129, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (754, 136, 'Blue', 332, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (942, 143, 'Mauv', 485, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (466, 128, 'Red', 242, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (82, 104, 'Aquamarine', 573, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (227, 120, 'Mauv', 563, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (989, 113, 'Fuscia', 225, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (303, 164, 'Goldenrod', 624, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (153, 149, 'Maroon', 586, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (366, 169, 'Aquamarine', 141, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (50, 185, 'Crimson', 536, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (275, 104, 'Yellow', 565, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (140, 179, 'Khaki', 286, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (328, 143, 'Turquoise', 749, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (268, 178, 'Crimson', 161, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (25, 122, 'Red', 869, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (528, 133, 'Purple', 339, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (879, 169, 'Yellow', 845, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (845, 129, 'Turquoise', 168, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (402, 146, 'Puce', 669, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (329, 116, 'Yellow', 706, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (112, 114, 'Puce', 579, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (620, 182, 'Purple', 112, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (657, 183, 'Orange', 351, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (13, 139, 'Yellow', 593, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (80, 189, 'Green', 535, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (886, 168, 'Puce', 174, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (188, 140, 'Blue', 674, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (247, 187, 'Green', 835, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (376, 166, 'Pink', 927, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (63, 165, 'Aquamarine', 210, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (372, 103, 'Aquamarine', 751, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (226, 102, 'Maroon', 367, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (665, 118, 'Puce', 284, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (14, 135, 'Aquamarine', 465, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (240, 151, 'Mauv', 112, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (994, 108, 'Red', 866, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (312, 174, 'Teal', 566, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (718, 134, 'Yellow', 850, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (96, 174, 'Yellow', 547, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (866, 165, 'Maroon', 136, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (959, 166, 'Goldenrod', 172, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (559, 105, 'Purple', 224, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (826, 154, 'Green', 348, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (159, 167, 'Blue', 263, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (47, 130, 'Crimson', 361, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (187, 166, 'Aquamarine', 677, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (877, 117, 'Maroon', 567, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (574, 179, 'Fuscia', 366, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (67, 155, 'Goldenrod', 912, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (479, 137, 'Maroon', 147, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (419, 133, 'Violet', 700, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (292, 143, 'Purple', 565, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (526, 126, 'Violet', 944, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (508, 122, 'Khaki', 617, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (476, 156, 'Khaki', 602, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (671, 155, 'Orange', 471, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (713, 187, 'Maroon', 963, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (921, 179, 'Orange', 551, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (824, 175, 'Mauv', 902, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (848, 103, 'Violet', 913, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (928, 100, 'Crimson', 463, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (926, 107, 'Violet', 499, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (761, 136, 'Aquamarine', 907, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (309, 177, 'Goldenrod', 519, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (219, 148, 'Pink', 981, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (532, 111, 'Puce', 484, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (563, 181, 'Red', 575, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (635, 144, 'Puce', 333, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (507, 163, 'Yellow', 440, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (898, 133, 'Maroon', 941, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (658, 130, 'Goldenrod', 775, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (756, 187, 'Puce', 726, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (369, 190, 'Maroon', 999, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (798, 151, 'Blue', 490, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (362, 129, 'Teal', 222, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (693, 161, 'Crimson', 745, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (596, 109, 'Blue', 313, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (675, 180, 'Goldenrod', 413, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (365, 140, 'Fuscia', 304, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (453, 142, 'Aquamarine', 299, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (277, 119, 'Crimson', 300, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (447, 125, 'Orange', 295, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (276, 104, 'Crimson', 751, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (920, 113, 'Pink', 334, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (297, 100, 'Mauv', 355, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (662, 170, 'Fuscia', 813, 0);
commit;
prompt 300 records committed...
insert into DRESS (did, length, color, price, rentalcount)
values (885, 176, 'Aquamarine', 800, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (199, 160, 'Orange', 999, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (352, 105, 'Mauv', 966, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (619, 133, 'Teal', 269, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (184, 121, 'Aquamarine', 344, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (847, 129, 'Maroon', 587, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (308, 132, 'Crimson', 839, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (482, 102, 'Aquamarine', 856, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (282, 114, 'Indigo', 836, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (698, 163, 'Purple', 384, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (750, 133, 'Turquoise', 130, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (361, 143, 'Maroon', 450, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (956, 169, 'Turquoise', 315, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (499, 148, 'Puce', 887, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (510, 106, 'Puce', 740, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (460, 116, 'Puce', 653, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (320, 158, 'Orange', 766, 3);
insert into DRESS (did, length, color, price, rentalcount)
values (589, 108, 'Purple', 835, 0);
insert into DRESS (did, length, color, price, rentalcount)
values (95, 143, 'Violet', 510, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (321, 130, 'Teal', 829, 2);
insert into DRESS (did, length, color, price, rentalcount)
values (922, 190, 'Teal', 440, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (953, 185, 'Purple', 774, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (161, 104, 'Puce', 538, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (289, 113, 'Turquoise', 841, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (446, 101, 'Maroon', 116, 4);
insert into DRESS (did, length, color, price, rentalcount)
values (529, 123, 'Violet', 181, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (425, 162, 'Purple', 640, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (102, 169, 'Pink', 343, 1);
insert into DRESS (did, length, color, price, rentalcount)
values (130, 120, 'Indigo', 423, 0);
commit;
prompt 329 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (101, ' ''Alice Smith''', ' ''alice@ex.com''', ' ''050-123-0101''', 4);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (102, ' ''Bob Johnson''', ' ''bob@ex.com''', ' ''050-123-0102''', 4.8);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (104, ' ''Diana King''', ' ''diana@ex.com''', ' ''050-123-0104''', 4);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (106, ' ''Fiona Brown''', ' ''fiona@ex.com''', ' ''050-123-0106''', 3.8);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (109, ' ''Ian Clark''', ' ''ian@ex.com''', ' ''050-123-0109''', 3.6);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (110, ' ''Julia Lewis''', ' ''julia@ex.com''', ' ''050-123-0110''', 4.2);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (113, ' ''Noah Baker''', ' ''noah@ex.com''', ' ''050-123-0113''', 3.2);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (115, ' ''Paul Adams''', ' ''paul@ex.com''', ' ''050-123-0115''', 3);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (116, ' ''Quinn Allen''', ' ''quinn@ex.com''', ' ''050-123-0116''', 3.8);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (117, ' ''Ryan Perez''', ' ''ryan@ex.com''', ' ''050-123-0117''', 3);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (119, ' ''Tom Clark''', ' ''tom@ex.com''', ' ''050-123-0119''', 3);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (120, ' ''Uma Wright''', ' ''uma@ex.com''', ' ''050-123-0120''', 3.2);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (122, ' ''Tom Clark''', ' ''tom@ex.com''', ' ''050-123-0119''', 3);
insert into EMPLOYEE (eid, ename, eemail, ephone, performancerating)
values (123, ' ''Uma Wright''', ' ''uma@ex.com''', ' ''050-123-0120''', 3.2);
commit;
prompt 14 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (789, 650, 1, 75, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (822, 468, 1, 172, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (5, 151, 1, 126, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (634, 769, 1, 180, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (24, 866, 1, 120, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (132, 161, 1, 63, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (540, 229, 1, 79, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (291, 845, 1, 64, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (929, 896, 1, 48, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (516, 174, 1, 174, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (90, 162, 1, 10, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (173, 593, 1, 7, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (114, 130, 1, 102, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (564, 147, 1, 31, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (565, 631, 1, 20, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (732, 763, 1, 87, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (75, 454, 1, 163, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (229, 235, 1, 103, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (772, 985, 1, 114, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (181, 726, 1, 61, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (271, 506, 1, 64, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (407, 112, 1, 103, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (308, 586, 1, 167, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (919, 111, 1, 133, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (415, 274, 1, 114, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (221, 370, 1, 35, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (36, 381, 1, 62, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (569, 105, 1, 179, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (188, 899, 1, 32, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (4, 593, 1, 192, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (392, 768, 1, 86, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (622, 300, 1, 130, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (115, 454, 1, 79, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (833, 339, 1, 180, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (450, 992, 1, 52, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (477, 561, 1, 160, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (59, 558, 1, 120, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (639, 800, 1, 183, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (281, 640, 1, 154, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (994, 943, 1, 71, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (219, 130, 1, 64, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (288, 508, 1, 80, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (31, 887, 1, 7, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (453, 103, 1, 137, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (503, 571, 1, 194, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (202, 505, 1, 151, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (304, 189, 1, 155, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (715, 181, 1, 151, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (354, 116, 1, 113, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (172, 836, 1, 141, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (816, 751, 1, 104, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (836, 587, 1, 48, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (957, 149, 1, 143, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (825, 856, 1, 7, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (388, 116, 1, 129, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (0, 617, 1, 14, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (815, 315, 1, 81, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (234, 835, 1, 126, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (599, 566, 1, 28, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (417, 563, 1, 62, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (586, 130, 1, 62, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (324, 114, 1, 44, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (270, 454, 1, 43, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (509, 653, 1, 177, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (117, 446, 1, 173, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (619, 170, 1, 158, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (601, 706, 1, 6, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (2, 650, 1, 192, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (387, 924, 1, 181, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (923, 107, 1, 136, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (261, 377, 1, 142, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (384, 856, 1, 53, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (412, 963, 1, 93, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (800, 924, 1, 19, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (441, 705, 1, 14, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (191, 783, 1, 15, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (562, 440, 1, 150, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (11, 551, 1, 115, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (707, 573, 1, 39, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (287, 800, 1, 183, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (52, 627, 1, 173, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (736, 899, 1, 36, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (953, 658, 1, 141, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (425, 238, 1, 168, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (50, 270, 1, 9, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (62, 468, 1, 65, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (614, 631, 1, 119, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (315, 683, 1, 136, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (675, 475, 1, 127, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (305, 481, 1, 13, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (419, 441, 1, 175, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (444, 370, 1, 108, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (13, 465, 1, 6, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (510, 582, 1, 111, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (932, 557, 1, 79, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (596, 481, 1, 24, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (408, 856, 1, 95, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (435, 769, 1, 37, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (688, 836, 1, 45, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (404, 836, 1, 190, null);
commit;
prompt 100 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (272, 896, 1, 10, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (973, 614, 1, 11, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (186, 356, 1, 183, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (427, 284, 1, 78, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (907, 527, 1, 133, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (624, 930, 1, 182, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (524, 332, 1, 141, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (182, 463, 1, 35, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (608, 908, 1, 59, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (227, 805, 1, 13, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (138, 798, 1, 190, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (199, 270, 1, 175, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (379, 740, 1, 155, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (28, 745, 1, 173, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (292, 313, 1, 114, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (756, 116, 1, 149, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (685, 343, 1, 55, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (670, 481, 1, 33, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (344, 454, 1, 68, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (51, 839, 1, 98, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (99, 315, 1, 126, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (100, 887, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (101, 766, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (102, 766, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (162, 924, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (655, 924, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (858, 924, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (213, 924, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (230, 864, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (85, 894, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (635, 171, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (770, 276, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (273, 999, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (676, 268, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (612, 999, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (515, 580, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (302, 720, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (431, 720, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (385, 817, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (962, 950, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (748, 991, 0, 0, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (451, 999, 1, 68, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (316, 169, 1, 151, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (318, 300, 1, 165, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (345, 300, 1, 55, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (591, 800, 1, 172, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (775, 847, 1, 112, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (623, 913, 1, 104, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (226, 805, 1, 68, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (359, 829, 1, 159, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (296, 282, 1, 68, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (723, 500, 1, 5, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (428, 336, 1, 54, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (8, 187, 1, 33, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (78, 565, 1, 65, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (285, 751, 1, 102, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (568, 141, 1, 94, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (991, 308, 1, 87, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (352, 118, 1, 140, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (268, 141, 1, 56, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (351, 941, 1, 186, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (578, 835, 1, 108, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (492, 112, 1, 35, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (47, 924, 1, 98, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (416, 747, 1, 75, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (309, 669, 1, 20, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (737, 847, 1, 93, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (382, 766, 1, 91, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (476, 112, 1, 76, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (193, 210, 1, 157, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (458, 322, 1, 132, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (437, 769, 1, 61, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (531, 878, 1, 98, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (525, 269, 1, 111, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (414, 172, 1, 165, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (894, 869, 1, 103, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (977, 956, 1, 131, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (383, 999, 1, 131, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (935, 839, 1, 124, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (464, 658, 1, 193, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (710, 980, 1, 1, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (166, 571, 1, 92, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (307, 918, 1, 156, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (295, 907, 1, 21, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (87, 731, 1, 99, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (867, 242, 1, 107, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (593, 700, 1, 25, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (640, 505, 1, 43, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (160, 505, 1, 137, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (938, 194, 1, 99, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (74, 355, 1, 29, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (633, 377, 1, 198, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (194, 961, 1, 167, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (527, 798, 1, 96, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (164, 601, 1, 141, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (999, 731, 1, 187, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (689, 277, 1, 98, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (513, 924, 1, 176, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (204, 153, 1, 112, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (413, 160, 1, 119, null);
commit;
prompt 200 records committed...
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (518, 908, 1, 165, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (136, 809, 1, 65, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (720, 683, 1, 5, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (882, 510, 1, 199, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (282, 210, 1, 172, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (12, 185, 1, 197, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (777, 631, 1, 122, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (151, 372, 1, 73, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (673, 768, 1, 51, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (338, 703, 1, 85, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (651, 751, 1, 40, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (895, 105, 1, 67, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (928, 582, 1, 82, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (103, 815, 1, 146, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (587, 963, 1, 43, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (579, 740, 1, 60, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (523, 350, 1, 3, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (542, 669, 1, 137, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (108, 990, 1, 175, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (159, 162, 1, 132, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (269, 856, 1, 36, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (207, 829, 1, 199, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (150, 746, 1, 190, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (355, 161, 1, 11, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (621, 322, 1, 197, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (914, 555, 1, 175, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (340, 111, 1, 199, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (235, 552, 1, 36, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (841, 538, 1, 26, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (279, 308, 1, 26, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (402, 563, 1, 68, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (814, 187, 1, 103, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (901, 809, 1, 105, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (880, 118, 1, 136, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (109, 368, 1, 36, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (592, 277, 1, 158, null);
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (472, 999, null, null, ' Cash');
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (968, 999, null, null, ' Credit Card');
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (163, 999, null, null, ' Check');
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (130, 999, null, null, ' PayPal');
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (799, 999, null, null, ' Bank Transfer');
insert into PAYMENT (pid, price, ispaid, fineprice, ptype)
values (839, 999, null, null, ' Bit');
commit;
prompt 242 records loaded
prompt Loading PRODUCER...
insert into PRODUCER (producer_id, producer_name, price)
values (201, ' Jon Doe', 3000);
insert into PRODUCER (producer_id, producer_name, price)
values (202, ' Jane Roe', 3200);
insert into PRODUCER (producer_id, producer_name, price)
values (203, ' Alice Li', 3400);
insert into PRODUCER (producer_id, producer_name, price)
values (204, ' Bob Lin', 3100);
insert into PRODUCER (producer_id, producer_name, price)
values (205, ' Carol Yu', 3300);
insert into PRODUCER (producer_id, producer_name, price)
values (206, ' Dan Kim', 3500);
insert into PRODUCER (producer_id, producer_name, price)
values (207, ' Eve Wu', 3600);
insert into PRODUCER (producer_id, producer_name, price)
values (208, ' Frank Ho', 3700);
insert into PRODUCER (producer_id, producer_name, price)
values (209, ' Grace Ma', 3800);
insert into PRODUCER (producer_id, producer_name, price)
values (210, ' Henry Xu', 3900);
insert into PRODUCER (producer_id, producer_name, price)
values (211, 'Bob Brown', 9094);
insert into PRODUCER (producer_id, producer_name, price)
values (212, 'John Davis', 7793);
insert into PRODUCER (producer_id, producer_name, price)
values (213, 'Dan Garcia', 9069);
insert into PRODUCER (producer_id, producer_name, price)
values (214, 'Alice Wilson', 6092);
insert into PRODUCER (producer_id, producer_name, price)
values (215, 'Carol Jones', 1590);
insert into PRODUCER (producer_id, producer_name, price)
values (216, 'John Garcia', 3999);
insert into PRODUCER (producer_id, producer_name, price)
values (217, 'John Williams', 7314);
insert into PRODUCER (producer_id, producer_name, price)
values (218, 'Jane Davis', 5922);
insert into PRODUCER (producer_id, producer_name, price)
values (219, 'Jane Brown', 7800);
insert into PRODUCER (producer_id, producer_name, price)
values (220, 'Carol Smith', 4346);
insert into PRODUCER (producer_id, producer_name, price)
values (221, 'Henry Williams', 9817);
insert into PRODUCER (producer_id, producer_name, price)
values (222, 'Jane Wilson', 5523);
insert into PRODUCER (producer_id, producer_name, price)
values (223, 'John Brown', 3830);
insert into PRODUCER (producer_id, producer_name, price)
values (224, 'Alice Miller', 8357);
insert into PRODUCER (producer_id, producer_name, price)
values (225, 'Eve Williams', 4617);
insert into PRODUCER (producer_id, producer_name, price)
values (226, 'Bob Jones', 7566);
insert into PRODUCER (producer_id, producer_name, price)
values (227, 'Grace Williams', 2408);
insert into PRODUCER (producer_id, producer_name, price)
values (228, 'Jane Davis', 1506);
insert into PRODUCER (producer_id, producer_name, price)
values (229, 'Bob Johnson', 3309);
insert into PRODUCER (producer_id, producer_name, price)
values (230, 'Jane Miller', 1497);
insert into PRODUCER (producer_id, producer_name, price)
values (231, 'Frank Johnson', 5558);
insert into PRODUCER (producer_id, producer_name, price)
values (232, 'Carol Brown', 2787);
insert into PRODUCER (producer_id, producer_name, price)
values (233, 'Bob Brown', 7994);
insert into PRODUCER (producer_id, producer_name, price)
values (234, 'Dan Smith', 8764);
insert into PRODUCER (producer_id, producer_name, price)
values (235, 'Jane Brown', 2903);
insert into PRODUCER (producer_id, producer_name, price)
values (236, 'Grace Brown', 1453);
insert into PRODUCER (producer_id, producer_name, price)
values (237, 'Dan Miller', 5473);
insert into PRODUCER (producer_id, producer_name, price)
values (238, 'Dan Smith', 5750);
insert into PRODUCER (producer_id, producer_name, price)
values (239, 'Carol Johnson', 1156);
insert into PRODUCER (producer_id, producer_name, price)
values (240, 'John Jones', 3956);
insert into PRODUCER (producer_id, producer_name, price)
values (241, 'Dan Wilson', 7102);
insert into PRODUCER (producer_id, producer_name, price)
values (242, 'Alice Brown', 2994);
insert into PRODUCER (producer_id, producer_name, price)
values (243, 'Henry Wilson', 8036);
insert into PRODUCER (producer_id, producer_name, price)
values (244, 'Eve Garcia', 1381);
insert into PRODUCER (producer_id, producer_name, price)
values (245, 'Bob Smith', 3876);
insert into PRODUCER (producer_id, producer_name, price)
values (246, 'Frank Garcia', 2093);
insert into PRODUCER (producer_id, producer_name, price)
values (247, 'Dan Smith', 9328);
insert into PRODUCER (producer_id, producer_name, price)
values (248, 'Frank Garcia', 2604);
insert into PRODUCER (producer_id, producer_name, price)
values (249, 'Frank Wilson', 7283);
insert into PRODUCER (producer_id, producer_name, price)
values (250, 'Dan Wilson', 5582);
insert into PRODUCER (producer_id, producer_name, price)
values (251, 'Jane Wilson', 2715);
insert into PRODUCER (producer_id, producer_name, price)
values (252, 'John Johnson', 4596);
insert into PRODUCER (producer_id, producer_name, price)
values (253, 'Frank Williams', 1560);
insert into PRODUCER (producer_id, producer_name, price)
values (254, 'Grace Wilson', 5140);
insert into PRODUCER (producer_id, producer_name, price)
values (255, 'Henry Doe', 7468);
insert into PRODUCER (producer_id, producer_name, price)
values (256, 'Henry Doe', 9651);
insert into PRODUCER (producer_id, producer_name, price)
values (257, 'Eve Doe', 8464);
insert into PRODUCER (producer_id, producer_name, price)
values (258, 'Jane Davis', 2395);
insert into PRODUCER (producer_id, producer_name, price)
values (259, 'Frank Jones', 8352);
insert into PRODUCER (producer_id, producer_name, price)
values (260, 'Jane Wilson', 9550);
insert into PRODUCER (producer_id, producer_name, price)
values (261, 'Bob Doe', 7813);
insert into PRODUCER (producer_id, producer_name, price)
values (262, 'Dan Miller', 6966);
insert into PRODUCER (producer_id, producer_name, price)
values (263, 'John Jones', 2739);
insert into PRODUCER (producer_id, producer_name, price)
values (264, 'Alice Jones', 6272);
insert into PRODUCER (producer_id, producer_name, price)
values (265, 'John Brown', 2217);
insert into PRODUCER (producer_id, producer_name, price)
values (266, 'Alice Miller', 6870);
insert into PRODUCER (producer_id, producer_name, price)
values (267, 'Dan Wilson', 2710);
insert into PRODUCER (producer_id, producer_name, price)
values (268, 'Carol Smith', 5676);
insert into PRODUCER (producer_id, producer_name, price)
values (269, 'Grace Brown', 7572);
insert into PRODUCER (producer_id, producer_name, price)
values (270, 'Eve Johnson', 5262);
insert into PRODUCER (producer_id, producer_name, price)
values (271, 'Alice Johnson', 4147);
insert into PRODUCER (producer_id, producer_name, price)
values (272, 'John Davis', 8931);
insert into PRODUCER (producer_id, producer_name, price)
values (273, 'Grace Jones', 1326);
insert into PRODUCER (producer_id, producer_name, price)
values (274, 'Frank Garcia', 2725);
insert into PRODUCER (producer_id, producer_name, price)
values (275, 'Eve Wilson', 9089);
insert into PRODUCER (producer_id, producer_name, price)
values (276, 'Frank Miller', 7440);
insert into PRODUCER (producer_id, producer_name, price)
values (277, 'Dan Johnson', 8583);
insert into PRODUCER (producer_id, producer_name, price)
values (278, 'Eve Wilson', 3166);
insert into PRODUCER (producer_id, producer_name, price)
values (279, 'Bob Miller', 5168);
insert into PRODUCER (producer_id, producer_name, price)
values (280, 'Eve Smith', 7388);
insert into PRODUCER (producer_id, producer_name, price)
values (281, 'John Brown', 6224);
insert into PRODUCER (producer_id, producer_name, price)
values (282, 'Grace Williams', 2480);
insert into PRODUCER (producer_id, producer_name, price)
values (283, 'Henry Doe', 6497);
insert into PRODUCER (producer_id, producer_name, price)
values (284, 'Frank Davis', 6667);
insert into PRODUCER (producer_id, producer_name, price)
values (285, 'Carol Williams', 9062);
insert into PRODUCER (producer_id, producer_name, price)
values (286, 'Eve Garcia', 5664);
insert into PRODUCER (producer_id, producer_name, price)
values (287, 'Eve Davis', 5821);
insert into PRODUCER (producer_id, producer_name, price)
values (288, 'Henry Doe', 3042);
insert into PRODUCER (producer_id, producer_name, price)
values (289, 'Alice Williams', 7016);
insert into PRODUCER (producer_id, producer_name, price)
values (290, 'Eve Garcia', 2652);
insert into PRODUCER (producer_id, producer_name, price)
values (291, 'John Williams', 3430);
insert into PRODUCER (producer_id, producer_name, price)
values (292, 'Carol Williams', 8904);
insert into PRODUCER (producer_id, producer_name, price)
values (293, 'Dan Williams', 8027);
insert into PRODUCER (producer_id, producer_name, price)
values (294, 'Carol Williams', 3073);
insert into PRODUCER (producer_id, producer_name, price)
values (295, 'Henry Doe', 3606);
insert into PRODUCER (producer_id, producer_name, price)
values (296, 'Alice Davis', 6928);
insert into PRODUCER (producer_id, producer_name, price)
values (297, 'John Garcia', 9985);
insert into PRODUCER (producer_id, producer_name, price)
values (298, 'Eve Jones', 3590);
insert into PRODUCER (producer_id, producer_name, price)
values (299, 'John Brown', 6188);
insert into PRODUCER (producer_id, producer_name, price)
values (300, 'Grace Jones', 5254);
commit;
prompt 100 records committed...
insert into PRODUCER (producer_id, producer_name, price)
values (301, 'Jane Jones', 2315);
insert into PRODUCER (producer_id, producer_name, price)
values (302, 'Grace Brown', 9838);
insert into PRODUCER (producer_id, producer_name, price)
values (303, 'Eve Smith', 3416);
insert into PRODUCER (producer_id, producer_name, price)
values (304, 'Alice Williams', 5403);
insert into PRODUCER (producer_id, producer_name, price)
values (305, 'Eve Davis', 4204);
insert into PRODUCER (producer_id, producer_name, price)
values (306, 'Frank Garcia', 2709);
insert into PRODUCER (producer_id, producer_name, price)
values (307, 'Alice Smith', 1513);
insert into PRODUCER (producer_id, producer_name, price)
values (308, 'Frank Wilson', 9558);
insert into PRODUCER (producer_id, producer_name, price)
values (309, 'Eve Brown', 6083);
insert into PRODUCER (producer_id, producer_name, price)
values (310, 'Henry Miller', 5778);
insert into PRODUCER (producer_id, producer_name, price)
values (311, 'Carol Garcia', 5449);
insert into PRODUCER (producer_id, producer_name, price)
values (312, 'Frank Brown', 1725);
insert into PRODUCER (producer_id, producer_name, price)
values (313, 'Grace Jones', 6921);
insert into PRODUCER (producer_id, producer_name, price)
values (314, 'Henry Williams', 7909);
insert into PRODUCER (producer_id, producer_name, price)
values (315, 'Grace Johnson', 8895);
insert into PRODUCER (producer_id, producer_name, price)
values (316, 'John Miller', 4450);
insert into PRODUCER (producer_id, producer_name, price)
values (317, 'Bob Brown', 3158);
insert into PRODUCER (producer_id, producer_name, price)
values (318, 'Dan Davis', 2126);
insert into PRODUCER (producer_id, producer_name, price)
values (319, 'Henry Davis', 3851);
insert into PRODUCER (producer_id, producer_name, price)
values (320, 'Eve Miller', 6458);
insert into PRODUCER (producer_id, producer_name, price)
values (321, 'John Miller', 8987);
insert into PRODUCER (producer_id, producer_name, price)
values (322, 'Frank Wilson', 5547);
insert into PRODUCER (producer_id, producer_name, price)
values (323, 'Frank Garcia', 2039);
insert into PRODUCER (producer_id, producer_name, price)
values (324, 'Eve Williams', 5819);
insert into PRODUCER (producer_id, producer_name, price)
values (325, 'John Brown', 8434);
insert into PRODUCER (producer_id, producer_name, price)
values (326, 'Eve Williams', 2442);
insert into PRODUCER (producer_id, producer_name, price)
values (327, 'Grace Jones', 1675);
insert into PRODUCER (producer_id, producer_name, price)
values (328, 'Eve Doe', 6458);
insert into PRODUCER (producer_id, producer_name, price)
values (329, 'Henry Smith', 7125);
insert into PRODUCER (producer_id, producer_name, price)
values (330, 'Alice Johnson', 3854);
insert into PRODUCER (producer_id, producer_name, price)
values (331, 'Dan Garcia', 8063);
insert into PRODUCER (producer_id, producer_name, price)
values (332, 'Eve Williams', 2338);
insert into PRODUCER (producer_id, producer_name, price)
values (333, 'Jane Johnson', 8452);
insert into PRODUCER (producer_id, producer_name, price)
values (334, 'Frank Jones', 6214);
insert into PRODUCER (producer_id, producer_name, price)
values (335, 'Eve Smith', 9814);
insert into PRODUCER (producer_id, producer_name, price)
values (336, 'Alice Johnson', 8851);
insert into PRODUCER (producer_id, producer_name, price)
values (337, 'Carol Brown', 1605);
insert into PRODUCER (producer_id, producer_name, price)
values (338, 'Bob Johnson', 7079);
insert into PRODUCER (producer_id, producer_name, price)
values (339, 'Grace Doe', 3136);
insert into PRODUCER (producer_id, producer_name, price)
values (340, 'Bob Brown', 6773);
insert into PRODUCER (producer_id, producer_name, price)
values (341, 'Henry Garcia', 3371);
insert into PRODUCER (producer_id, producer_name, price)
values (342, 'Alice Davis', 8657);
insert into PRODUCER (producer_id, producer_name, price)
values (343, 'Jane Johnson', 5940);
insert into PRODUCER (producer_id, producer_name, price)
values (344, 'Alice Miller', 5444);
insert into PRODUCER (producer_id, producer_name, price)
values (345, 'Grace Johnson', 1657);
insert into PRODUCER (producer_id, producer_name, price)
values (346, 'Eve Davis', 3869);
insert into PRODUCER (producer_id, producer_name, price)
values (347, 'Henry Wilson', 3615);
insert into PRODUCER (producer_id, producer_name, price)
values (348, 'Grace Garcia', 2399);
insert into PRODUCER (producer_id, producer_name, price)
values (349, 'Jane Doe', 1323);
insert into PRODUCER (producer_id, producer_name, price)
values (350, 'Henry Davis', 2393);
insert into PRODUCER (producer_id, producer_name, price)
values (351, 'Eve Brown', 7890);
insert into PRODUCER (producer_id, producer_name, price)
values (352, 'Carol Miller', 5282);
insert into PRODUCER (producer_id, producer_name, price)
values (353, 'Frank Smith', 3230);
insert into PRODUCER (producer_id, producer_name, price)
values (354, 'Jane Davis', 1663);
insert into PRODUCER (producer_id, producer_name, price)
values (355, 'Dan Miller', 4737);
insert into PRODUCER (producer_id, producer_name, price)
values (356, 'Alice Jones', 5476);
insert into PRODUCER (producer_id, producer_name, price)
values (357, 'Grace Davis', 3570);
insert into PRODUCER (producer_id, producer_name, price)
values (358, 'Carol Miller', 3366);
insert into PRODUCER (producer_id, producer_name, price)
values (359, 'John Doe', 9220);
insert into PRODUCER (producer_id, producer_name, price)
values (360, 'Jane Brown', 9720);
insert into PRODUCER (producer_id, producer_name, price)
values (361, 'Frank Smith', 1596);
insert into PRODUCER (producer_id, producer_name, price)
values (362, 'Jane Doe', 2975);
insert into PRODUCER (producer_id, producer_name, price)
values (363, 'Alice Johnson', 9580);
insert into PRODUCER (producer_id, producer_name, price)
values (364, 'Alice Doe', 5897);
insert into PRODUCER (producer_id, producer_name, price)
values (365, 'John Johnson', 8654);
insert into PRODUCER (producer_id, producer_name, price)
values (366, 'Dan Smith', 2954);
insert into PRODUCER (producer_id, producer_name, price)
values (367, 'Carol Smith', 1275);
insert into PRODUCER (producer_id, producer_name, price)
values (368, 'Jane Jones', 1170);
insert into PRODUCER (producer_id, producer_name, price)
values (369, 'Henry Brown', 2681);
insert into PRODUCER (producer_id, producer_name, price)
values (370, 'John Miller', 9986);
insert into PRODUCER (producer_id, producer_name, price)
values (371, 'Henry Doe', 3203);
insert into PRODUCER (producer_id, producer_name, price)
values (372, 'Eve Smith', 2674);
insert into PRODUCER (producer_id, producer_name, price)
values (373, 'Jane Jones', 1964);
insert into PRODUCER (producer_id, producer_name, price)
values (374, 'Bob Smith', 7664);
insert into PRODUCER (producer_id, producer_name, price)
values (375, 'Dan Garcia', 5372);
insert into PRODUCER (producer_id, producer_name, price)
values (376, 'Dan Smith', 5086);
insert into PRODUCER (producer_id, producer_name, price)
values (377, 'Eve Doe', 2118);
insert into PRODUCER (producer_id, producer_name, price)
values (378, 'Bob Smith', 7318);
insert into PRODUCER (producer_id, producer_name, price)
values (379, 'Grace Garcia', 1116);
insert into PRODUCER (producer_id, producer_name, price)
values (380, 'Frank Doe', 3142);
insert into PRODUCER (producer_id, producer_name, price)
values (381, 'Alice Jones', 9959);
insert into PRODUCER (producer_id, producer_name, price)
values (382, 'Henry Williams', 8440);
insert into PRODUCER (producer_id, producer_name, price)
values (383, 'Frank Wilson', 2343);
insert into PRODUCER (producer_id, producer_name, price)
values (384, 'Eve Smith', 8737);
insert into PRODUCER (producer_id, producer_name, price)
values (385, 'Bob Williams', 8417);
insert into PRODUCER (producer_id, producer_name, price)
values (386, 'Grace Garcia', 6479);
insert into PRODUCER (producer_id, producer_name, price)
values (387, 'Dan Williams', 1807);
insert into PRODUCER (producer_id, producer_name, price)
values (388, 'Carol Doe', 3191);
insert into PRODUCER (producer_id, producer_name, price)
values (389, 'Bob Miller', 2441);
insert into PRODUCER (producer_id, producer_name, price)
values (390, 'Grace Wilson', 8633);
insert into PRODUCER (producer_id, producer_name, price)
values (391, 'Eve Brown', 4533);
insert into PRODUCER (producer_id, producer_name, price)
values (392, 'Dan Brown', 8193);
insert into PRODUCER (producer_id, producer_name, price)
values (393, 'Eve Wilson', 6174);
insert into PRODUCER (producer_id, producer_name, price)
values (394, 'Carol Doe', 5329);
insert into PRODUCER (producer_id, producer_name, price)
values (395, 'Eve Davis', 5384);
insert into PRODUCER (producer_id, producer_name, price)
values (396, 'Bob Wilson', 4266);
insert into PRODUCER (producer_id, producer_name, price)
values (397, 'Dan Johnson', 6922);
insert into PRODUCER (producer_id, producer_name, price)
values (398, 'Jane Brown', 1638);
insert into PRODUCER (producer_id, producer_name, price)
values (399, 'Carol Williams', 9349);
insert into PRODUCER (producer_id, producer_name, price)
values (400, 'Dan Davis', 6428);
commit;
prompt 200 records committed...
insert into PRODUCER (producer_id, producer_name, price)
values (401, 'Eve Miller', 8166);
insert into PRODUCER (producer_id, producer_name, price)
values (402, 'Dan Johnson', 1302);
insert into PRODUCER (producer_id, producer_name, price)
values (403, 'Alice Jones', 6918);
insert into PRODUCER (producer_id, producer_name, price)
values (404, 'Eve Williams', 6007);
insert into PRODUCER (producer_id, producer_name, price)
values (405, 'Jane Brown', 3023);
insert into PRODUCER (producer_id, producer_name, price)
values (406, 'Jane Wilson', 8053);
insert into PRODUCER (producer_id, producer_name, price)
values (407, 'Alice Smith', 5025);
insert into PRODUCER (producer_id, producer_name, price)
values (408, 'Jane Davis', 9473);
insert into PRODUCER (producer_id, producer_name, price)
values (409, 'Henry Smith', 6957);
insert into PRODUCER (producer_id, producer_name, price)
values (410, 'John Doe', 6398);
insert into PRODUCER (producer_id, producer_name, price)
values (411, 'Eve Johnson', 2181);
insert into PRODUCER (producer_id, producer_name, price)
values (412, 'Eve Williams', 5174);
insert into PRODUCER (producer_id, producer_name, price)
values (413, 'Bob Miller', 3319);
insert into PRODUCER (producer_id, producer_name, price)
values (414, 'Frank Jones', 1222);
insert into PRODUCER (producer_id, producer_name, price)
values (415, 'Frank Wilson', 6173);
insert into PRODUCER (producer_id, producer_name, price)
values (416, 'Bob Wilson', 4282);
insert into PRODUCER (producer_id, producer_name, price)
values (417, 'Carol Miller', 2071);
insert into PRODUCER (producer_id, producer_name, price)
values (418, 'Grace Smith', 9465);
insert into PRODUCER (producer_id, producer_name, price)
values (419, 'Bob Williams', 1432);
insert into PRODUCER (producer_id, producer_name, price)
values (420, 'Dan Williams', 2572);
insert into PRODUCER (producer_id, producer_name, price)
values (421, 'Frank Johnson', 2032);
insert into PRODUCER (producer_id, producer_name, price)
values (422, 'Alice Garcia', 6437);
insert into PRODUCER (producer_id, producer_name, price)
values (423, 'Grace Jones', 8390);
insert into PRODUCER (producer_id, producer_name, price)
values (424, 'Eve Jones', 5036);
insert into PRODUCER (producer_id, producer_name, price)
values (425, 'John Garcia', 6999);
insert into PRODUCER (producer_id, producer_name, price)
values (426, 'Henry Davis', 1766);
insert into PRODUCER (producer_id, producer_name, price)
values (427, 'John Brown', 1310);
insert into PRODUCER (producer_id, producer_name, price)
values (428, 'Bob Brown', 9926);
insert into PRODUCER (producer_id, producer_name, price)
values (429, 'Alice Williams', 8251);
insert into PRODUCER (producer_id, producer_name, price)
values (430, 'Carol Doe', 8024);
insert into PRODUCER (producer_id, producer_name, price)
values (431, 'Jane Garcia', 7917);
insert into PRODUCER (producer_id, producer_name, price)
values (432, 'Jane Jones', 9283);
insert into PRODUCER (producer_id, producer_name, price)
values (433, 'Grace Brown', 5932);
insert into PRODUCER (producer_id, producer_name, price)
values (434, 'Dan Garcia', 3647);
insert into PRODUCER (producer_id, producer_name, price)
values (435, 'Carol Garcia', 4070);
insert into PRODUCER (producer_id, producer_name, price)
values (436, 'Eve Garcia', 6362);
insert into PRODUCER (producer_id, producer_name, price)
values (437, 'John Johnson', 6695);
insert into PRODUCER (producer_id, producer_name, price)
values (438, 'Bob Wilson', 2098);
insert into PRODUCER (producer_id, producer_name, price)
values (439, 'Bob Doe', 6995);
insert into PRODUCER (producer_id, producer_name, price)
values (440, 'Jane Williams', 2670);
insert into PRODUCER (producer_id, producer_name, price)
values (441, 'Grace Wilson', 2770);
insert into PRODUCER (producer_id, producer_name, price)
values (442, 'Carol Davis', 1889);
insert into PRODUCER (producer_id, producer_name, price)
values (443, 'John Johnson', 4622);
insert into PRODUCER (producer_id, producer_name, price)
values (444, 'Grace Doe', 7645);
insert into PRODUCER (producer_id, producer_name, price)
values (445, 'Dan Doe', 7122);
insert into PRODUCER (producer_id, producer_name, price)
values (446, 'Henry Jones', 1753);
insert into PRODUCER (producer_id, producer_name, price)
values (447, 'Eve Wilson', 5546);
insert into PRODUCER (producer_id, producer_name, price)
values (448, 'Henry Wilson', 5503);
insert into PRODUCER (producer_id, producer_name, price)
values (449, 'Carol Wilson', 9835);
insert into PRODUCER (producer_id, producer_name, price)
values (450, 'Jane Doe', 7825);
insert into PRODUCER (producer_id, producer_name, price)
values (451, 'Carol Wilson', 3108);
insert into PRODUCER (producer_id, producer_name, price)
values (452, 'Alice Williams', 8578);
insert into PRODUCER (producer_id, producer_name, price)
values (453, 'John Wilson', 1039);
insert into PRODUCER (producer_id, producer_name, price)
values (454, 'Eve Miller', 1179);
insert into PRODUCER (producer_id, producer_name, price)
values (455, 'Carol Williams', 9752);
insert into PRODUCER (producer_id, producer_name, price)
values (456, 'Carol Davis', 3763);
insert into PRODUCER (producer_id, producer_name, price)
values (457, 'Grace Miller', 7029);
insert into PRODUCER (producer_id, producer_name, price)
values (458, 'Frank Williams', 8754);
insert into PRODUCER (producer_id, producer_name, price)
values (459, 'Grace Garcia', 2439);
insert into PRODUCER (producer_id, producer_name, price)
values (460, 'Grace Doe', 9445);
insert into PRODUCER (producer_id, producer_name, price)
values (461, 'Grace Jones', 6787);
insert into PRODUCER (producer_id, producer_name, price)
values (462, 'Carol Miller', 8704);
insert into PRODUCER (producer_id, producer_name, price)
values (463, 'Dan Jones', 4894);
insert into PRODUCER (producer_id, producer_name, price)
values (464, 'Alice Brown', 2515);
insert into PRODUCER (producer_id, producer_name, price)
values (465, 'Carol Johnson', 6642);
insert into PRODUCER (producer_id, producer_name, price)
values (466, 'Eve Brown', 4594);
insert into PRODUCER (producer_id, producer_name, price)
values (467, 'Dan Brown', 2788);
insert into PRODUCER (producer_id, producer_name, price)
values (468, 'Alice Davis', 8991);
insert into PRODUCER (producer_id, producer_name, price)
values (469, 'Dan Smith', 1238);
insert into PRODUCER (producer_id, producer_name, price)
values (470, 'Grace Williams', 6666);
insert into PRODUCER (producer_id, producer_name, price)
values (471, 'Henry Johnson', 8073);
insert into PRODUCER (producer_id, producer_name, price)
values (472, 'Bob Miller', 5359);
insert into PRODUCER (producer_id, producer_name, price)
values (473, 'John Brown', 2352);
insert into PRODUCER (producer_id, producer_name, price)
values (474, 'Dan Williams', 3484);
insert into PRODUCER (producer_id, producer_name, price)
values (475, 'Grace Doe', 6677);
insert into PRODUCER (producer_id, producer_name, price)
values (476, 'Alice Jones', 5090);
insert into PRODUCER (producer_id, producer_name, price)
values (477, 'Carol Garcia', 9394);
insert into PRODUCER (producer_id, producer_name, price)
values (478, 'Alice Davis', 4835);
insert into PRODUCER (producer_id, producer_name, price)
values (479, 'Frank Doe', 4706);
insert into PRODUCER (producer_id, producer_name, price)
values (480, 'Eve Davis', 8015);
insert into PRODUCER (producer_id, producer_name, price)
values (481, 'Grace Smith', 8593);
insert into PRODUCER (producer_id, producer_name, price)
values (482, 'Bob Johnson', 6255);
insert into PRODUCER (producer_id, producer_name, price)
values (483, 'Eve Garcia', 7009);
insert into PRODUCER (producer_id, producer_name, price)
values (484, 'Dan Doe', 3979);
insert into PRODUCER (producer_id, producer_name, price)
values (485, 'Carol Jones', 4319);
insert into PRODUCER (producer_id, producer_name, price)
values (486, 'Bob Jones', 6616);
insert into PRODUCER (producer_id, producer_name, price)
values (487, 'Dan Garcia', 4272);
insert into PRODUCER (producer_id, producer_name, price)
values (488, 'Jane Brown', 7581);
insert into PRODUCER (producer_id, producer_name, price)
values (489, 'Eve Miller', 2283);
insert into PRODUCER (producer_id, producer_name, price)
values (490, 'John Smith', 6612);
insert into PRODUCER (producer_id, producer_name, price)
values (491, 'Jane Jones', 4837);
insert into PRODUCER (producer_id, producer_name, price)
values (492, 'Carol Brown', 8696);
insert into PRODUCER (producer_id, producer_name, price)
values (493, 'Dan Johnson', 8598);
insert into PRODUCER (producer_id, producer_name, price)
values (494, 'Henry Wilson', 1417);
insert into PRODUCER (producer_id, producer_name, price)
values (495, 'Henry Williams', 5278);
insert into PRODUCER (producer_id, producer_name, price)
values (496, 'Eve Davis', 4175);
insert into PRODUCER (producer_id, producer_name, price)
values (497, 'Bob Jones', 7978);
insert into PRODUCER (producer_id, producer_name, price)
values (498, 'Alice Johnson', 2453);
insert into PRODUCER (producer_id, producer_name, price)
values (499, 'Eve Garcia', 3976);
insert into PRODUCER (producer_id, producer_name, price)
values (500, 'John Miller', 1372);
commit;
prompt 300 records committed...
insert into PRODUCER (producer_id, producer_name, price)
values (501, 'Carol Miller', 1065);
insert into PRODUCER (producer_id, producer_name, price)
values (502, 'Henry Garcia', 1237);
insert into PRODUCER (producer_id, producer_name, price)
values (503, 'Frank Jones', 5528);
insert into PRODUCER (producer_id, producer_name, price)
values (504, 'Dan Miller', 6148);
insert into PRODUCER (producer_id, producer_name, price)
values (505, 'Jane Williams', 3500);
insert into PRODUCER (producer_id, producer_name, price)
values (506, 'John Johnson', 5044);
insert into PRODUCER (producer_id, producer_name, price)
values (507, 'Grace Davis', 5799);
insert into PRODUCER (producer_id, producer_name, price)
values (508, 'Carol Davis', 7743);
insert into PRODUCER (producer_id, producer_name, price)
values (509, 'Frank Johnson', 3375);
insert into PRODUCER (producer_id, producer_name, price)
values (510, 'Carol Wilson', 6881);
insert into PRODUCER (producer_id, producer_name, price)
values (511, 'Henry Wilson', 6828);
insert into PRODUCER (producer_id, producer_name, price)
values (512, 'Dan Miller', 4725);
insert into PRODUCER (producer_id, producer_name, price)
values (513, 'Jane Johnson', 6645);
insert into PRODUCER (producer_id, producer_name, price)
values (514, 'Bob Davis', 6001);
insert into PRODUCER (producer_id, producer_name, price)
values (515, 'Jane Wilson', 4183);
insert into PRODUCER (producer_id, producer_name, price)
values (516, 'Eve Miller', 5224);
insert into PRODUCER (producer_id, producer_name, price)
values (517, 'Carol Davis', 3305);
insert into PRODUCER (producer_id, producer_name, price)
values (518, 'Henry Johnson', 4580);
insert into PRODUCER (producer_id, producer_name, price)
values (519, 'Jane Davis', 2504);
insert into PRODUCER (producer_id, producer_name, price)
values (520, 'Carol Miller', 3819);
insert into PRODUCER (producer_id, producer_name, price)
values (521, 'Carol Davis', 9309);
insert into PRODUCER (producer_id, producer_name, price)
values (522, 'Frank Brown', 2221);
insert into PRODUCER (producer_id, producer_name, price)
values (523, 'Dan Brown', 1798);
insert into PRODUCER (producer_id, producer_name, price)
values (524, 'Bob Smith', 2127);
insert into PRODUCER (producer_id, producer_name, price)
values (525, 'Frank Williams', 2511);
insert into PRODUCER (producer_id, producer_name, price)
values (526, 'Dan Williams', 5092);
insert into PRODUCER (producer_id, producer_name, price)
values (527, 'Bob Jones', 6147);
insert into PRODUCER (producer_id, producer_name, price)
values (528, 'Frank Brown', 3545);
insert into PRODUCER (producer_id, producer_name, price)
values (529, 'Jane Davis', 9030);
insert into PRODUCER (producer_id, producer_name, price)
values (530, 'Frank Johnson', 7483);
insert into PRODUCER (producer_id, producer_name, price)
values (531, 'Alice Johnson', 7668);
insert into PRODUCER (producer_id, producer_name, price)
values (532, 'Alice Garcia', 5113);
insert into PRODUCER (producer_id, producer_name, price)
values (533, 'Carol Jones', 2785);
insert into PRODUCER (producer_id, producer_name, price)
values (534, 'Henry Smith', 6552);
insert into PRODUCER (producer_id, producer_name, price)
values (535, 'Dan Doe', 5310);
insert into PRODUCER (producer_id, producer_name, price)
values (536, 'Jane Miller', 5968);
insert into PRODUCER (producer_id, producer_name, price)
values (537, 'Frank Johnson', 9779);
insert into PRODUCER (producer_id, producer_name, price)
values (538, 'John Miller', 6294);
insert into PRODUCER (producer_id, producer_name, price)
values (539, 'Dan Doe', 2487);
insert into PRODUCER (producer_id, producer_name, price)
values (540, 'John Williams', 2649);
insert into PRODUCER (producer_id, producer_name, price)
values (541, 'Eve Williams', 1523);
insert into PRODUCER (producer_id, producer_name, price)
values (542, 'Frank Doe', 2638);
insert into PRODUCER (producer_id, producer_name, price)
values (543, 'Eve Garcia', 8528);
insert into PRODUCER (producer_id, producer_name, price)
values (544, 'Henry Wilson', 3205);
insert into PRODUCER (producer_id, producer_name, price)
values (545, 'Henry Jones', 4834);
insert into PRODUCER (producer_id, producer_name, price)
values (546, 'John Miller', 6855);
insert into PRODUCER (producer_id, producer_name, price)
values (547, 'Eve Brown', 4192);
insert into PRODUCER (producer_id, producer_name, price)
values (548, 'Grace Smith', 9601);
insert into PRODUCER (producer_id, producer_name, price)
values (549, 'Eve Johnson', 3231);
insert into PRODUCER (producer_id, producer_name, price)
values (550, 'Bob Jones', 7836);
insert into PRODUCER (producer_id, producer_name, price)
values (551, 'Alice Garcia', 4102);
insert into PRODUCER (producer_id, producer_name, price)
values (552, 'Alice Garcia', 5068);
insert into PRODUCER (producer_id, producer_name, price)
values (553, 'Alice Brown', 6185);
insert into PRODUCER (producer_id, producer_name, price)
values (554, 'Eve Davis', 4691);
insert into PRODUCER (producer_id, producer_name, price)
values (555, 'Henry Jones', 5103);
insert into PRODUCER (producer_id, producer_name, price)
values (556, 'Eve Johnson', 8648);
insert into PRODUCER (producer_id, producer_name, price)
values (557, 'Alice Davis', 7094);
insert into PRODUCER (producer_id, producer_name, price)
values (558, 'Carol Brown', 7350);
insert into PRODUCER (producer_id, producer_name, price)
values (559, 'Henry Doe', 4919);
insert into PRODUCER (producer_id, producer_name, price)
values (560, 'Alice Johnson', 2911);
insert into PRODUCER (producer_id, producer_name, price)
values (561, 'Henry Miller', 1907);
insert into PRODUCER (producer_id, producer_name, price)
values (562, 'John Garcia', 6834);
insert into PRODUCER (producer_id, producer_name, price)
values (563, 'Alice Smith', 8701);
insert into PRODUCER (producer_id, producer_name, price)
values (564, 'Dan Johnson', 4116);
insert into PRODUCER (producer_id, producer_name, price)
values (565, 'Henry Garcia', 8824);
insert into PRODUCER (producer_id, producer_name, price)
values (566, 'Carol Wilson', 4265);
insert into PRODUCER (producer_id, producer_name, price)
values (567, 'Frank Smith', 2695);
insert into PRODUCER (producer_id, producer_name, price)
values (568, 'Frank Miller', 4861);
insert into PRODUCER (producer_id, producer_name, price)
values (569, 'Dan Williams', 1483);
insert into PRODUCER (producer_id, producer_name, price)
values (570, 'Jane Williams', 3934);
insert into PRODUCER (producer_id, producer_name, price)
values (571, 'Grace Doe', 6703);
insert into PRODUCER (producer_id, producer_name, price)
values (572, 'John Wilson', 4282);
insert into PRODUCER (producer_id, producer_name, price)
values (573, 'Henry Garcia', 8036);
insert into PRODUCER (producer_id, producer_name, price)
values (574, 'Grace Davis', 1167);
insert into PRODUCER (producer_id, producer_name, price)
values (575, 'Dan Williams', 2835);
insert into PRODUCER (producer_id, producer_name, price)
values (576, 'John Johnson', 3227);
insert into PRODUCER (producer_id, producer_name, price)
values (577, 'Eve Williams', 5579);
insert into PRODUCER (producer_id, producer_name, price)
values (578, 'Grace Garcia', 5883);
insert into PRODUCER (producer_id, producer_name, price)
values (579, 'Alice Johnson', 6250);
insert into PRODUCER (producer_id, producer_name, price)
values (580, 'John Wilson', 8805);
insert into PRODUCER (producer_id, producer_name, price)
values (581, 'Jane Williams', 4986);
insert into PRODUCER (producer_id, producer_name, price)
values (582, 'Grace Smith', 2809);
insert into PRODUCER (producer_id, producer_name, price)
values (583, 'Dan Doe', 3172);
insert into PRODUCER (producer_id, producer_name, price)
values (584, 'John Doe', 6436);
insert into PRODUCER (producer_id, producer_name, price)
values (585, 'Bob Garcia', 9456);
insert into PRODUCER (producer_id, producer_name, price)
values (586, 'Jane Johnson', 2353);
insert into PRODUCER (producer_id, producer_name, price)
values (587, 'Eve Miller', 6962);
insert into PRODUCER (producer_id, producer_name, price)
values (588, 'Frank Garcia', 3883);
insert into PRODUCER (producer_id, producer_name, price)
values (589, 'Bob Miller', 9390);
insert into PRODUCER (producer_id, producer_name, price)
values (590, 'Alice Miller', 9642);
insert into PRODUCER (producer_id, producer_name, price)
values (591, 'Henry Smith', 7738);
insert into PRODUCER (producer_id, producer_name, price)
values (592, 'Grace Williams', 4112);
insert into PRODUCER (producer_id, producer_name, price)
values (593, 'Bob Wilson', 9917);
insert into PRODUCER (producer_id, producer_name, price)
values (594, 'Frank Jones', 8817);
insert into PRODUCER (producer_id, producer_name, price)
values (595, 'Carol Williams', 2084);
insert into PRODUCER (producer_id, producer_name, price)
values (596, 'Grace Williams', 2153);
insert into PRODUCER (producer_id, producer_name, price)
values (597, 'Eve Johnson', 4166);
insert into PRODUCER (producer_id, producer_name, price)
values (598, 'Alice Johnson', 5948);
insert into PRODUCER (producer_id, producer_name, price)
values (599, 'Grace Williams', 4924);
insert into PRODUCER (producer_id, producer_name, price)
values (600, 'Carol Jones', 1713);
commit;
prompt 400 records committed...
insert into PRODUCER (producer_id, producer_name, price)
values (601, 'Grace Will', 5000);
commit;
prompt 401 records loaded
prompt Loading SINGER...
insert into SINGER (sname, singer_id, price)
values (' Alice Johnson', 3, 4800);
insert into SINGER (sname, singer_id, price)
values (' Michael Wilson', 6, 4900);
insert into SINGER (sname, singer_id, price)
values (' David White', 8, 4600);
insert into SINGER (sname, singer_id, price)
values (' Laura Harris', 9, 5100);
insert into SINGER (sname, singer_id, price)
values (' James Clark', 10, 5400);
insert into SINGER (sname, singer_id, price)
values ('Frank Garcia', 11, 4911);
insert into SINGER (sname, singer_id, price)
values ('Dan Smith', 13, 6473);
insert into SINGER (sname, singer_id, price)
values ('Dan Smith', 21, 9381);
insert into SINGER (sname, singer_id, price)
values ('Jane Williams', 23, 5408);
insert into SINGER (sname, singer_id, price)
values ('Carol Williams', 25, 4508);
insert into SINGER (sname, singer_id, price)
values ('Frank Miller', 26, 1487);
insert into SINGER (sname, singer_id, price)
values ('Henry Garcia', 27, 1747);
insert into SINGER (sname, singer_id, price)
values ('Carol Garcia', 29, 4544);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 30, 1894);
insert into SINGER (sname, singer_id, price)
values ('Alice Miller', 32, 1996);
insert into SINGER (sname, singer_id, price)
values ('Jane Garcia', 33, 8475);
insert into SINGER (sname, singer_id, price)
values ('Jane Miller', 34, 1051);
insert into SINGER (sname, singer_id, price)
values ('Jane Miller', 36, 5556);
insert into SINGER (sname, singer_id, price)
values ('Frank Jones', 37, 3422);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 38, 6343);
insert into SINGER (sname, singer_id, price)
values ('Carol Johnson', 40, 1961);
insert into SINGER (sname, singer_id, price)
values ('Alice Garcia', 41, 2756);
insert into SINGER (sname, singer_id, price)
values ('Grace Doe', 42, 6231);
insert into SINGER (sname, singer_id, price)
values ('Frank Smith', 43, 8439);
insert into SINGER (sname, singer_id, price)
values ('Frank Davis', 44, 3239);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 46, 8936);
insert into SINGER (sname, singer_id, price)
values ('Frank Johnson', 50, 9606);
insert into SINGER (sname, singer_id, price)
values ('Alice Brown', 52, 6884);
insert into SINGER (sname, singer_id, price)
values ('Eve Miller', 54, 8006);
insert into SINGER (sname, singer_id, price)
values ('Grace Miller', 58, 3766);
insert into SINGER (sname, singer_id, price)
values ('Henry Doe', 60, 2894);
insert into SINGER (sname, singer_id, price)
values ('Jane Davis', 62, 7855);
insert into SINGER (sname, singer_id, price)
values ('Alice Davis', 63, 1979);
insert into SINGER (sname, singer_id, price)
values ('Dan Johnson', 65, 9696);
insert into SINGER (sname, singer_id, price)
values ('Dan Wilson', 68, 6812);
insert into SINGER (sname, singer_id, price)
values ('Bob Jones', 69, 9008);
insert into SINGER (sname, singer_id, price)
values ('Dan Garcia', 70, 8952);
insert into SINGER (sname, singer_id, price)
values ('John Miller', 72, 1709);
insert into SINGER (sname, singer_id, price)
values ('Frank Doe', 73, 5552);
insert into SINGER (sname, singer_id, price)
values ('John Doe', 74, 9101);
insert into SINGER (sname, singer_id, price)
values ('Eve Smith', 76, 1374);
insert into SINGER (sname, singer_id, price)
values ('Frank Johnson', 77, 8904);
insert into SINGER (sname, singer_id, price)
values ('Frank Brown', 81, 2765);
insert into SINGER (sname, singer_id, price)
values ('Alice Garcia', 86, 6870);
insert into SINGER (sname, singer_id, price)
values ('Henry Johnson', 87, 2101);
insert into SINGER (sname, singer_id, price)
values ('Frank Davis', 88, 8177);
insert into SINGER (sname, singer_id, price)
values ('Henry Smith', 89, 8483);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 92, 4337);
insert into SINGER (sname, singer_id, price)
values ('Eve Brown', 93, 5219);
insert into SINGER (sname, singer_id, price)
values ('Eve Williams', 94, 6317);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 95, 5195);
insert into SINGER (sname, singer_id, price)
values ('Henry Jones', 96, 8406);
insert into SINGER (sname, singer_id, price)
values ('Carol Smith', 97, 3389);
insert into SINGER (sname, singer_id, price)
values ('Jane Davis', 99, 8329);
insert into SINGER (sname, singer_id, price)
values ('Bob Johnson', 101, 4788);
insert into SINGER (sname, singer_id, price)
values ('Grace Jones', 103, 6921);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 107, 1642);
insert into SINGER (sname, singer_id, price)
values ('John Smith', 108, 5671);
insert into SINGER (sname, singer_id, price)
values ('Jane Jones', 109, 9317);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 111, 5510);
insert into SINGER (sname, singer_id, price)
values ('Jane Doe', 112, 7325);
insert into SINGER (sname, singer_id, price)
values ('Eve Williams', 119, 8967);
insert into SINGER (sname, singer_id, price)
values ('Frank Garcia', 124, 8758);
insert into SINGER (sname, singer_id, price)
values ('Henry Doe', 128, 9130);
insert into SINGER (sname, singer_id, price)
values ('Dan Davis', 130, 5813);
insert into SINGER (sname, singer_id, price)
values ('Frank Johnson', 131, 9328);
insert into SINGER (sname, singer_id, price)
values ('Alice Brown', 135, 7191);
insert into SINGER (sname, singer_id, price)
values ('Frank Doe', 136, 9247);
insert into SINGER (sname, singer_id, price)
values ('Alice Doe', 137, 7481);
insert into SINGER (sname, singer_id, price)
values ('Henry Smith', 138, 8995);
insert into SINGER (sname, singer_id, price)
values ('Carol Doe', 139, 7859);
insert into SINGER (sname, singer_id, price)
values ('Jane Williams', 140, 9882);
insert into SINGER (sname, singer_id, price)
values ('Jane Brown', 141, 3015);
insert into SINGER (sname, singer_id, price)
values ('Bob Smith', 142, 6290);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 143, 6775);
insert into SINGER (sname, singer_id, price)
values ('Jane Doe', 148, 5772);
insert into SINGER (sname, singer_id, price)
values ('Bob Jones', 149, 6595);
insert into SINGER (sname, singer_id, price)
values ('Jane Miller', 150, 5120);
insert into SINGER (sname, singer_id, price)
values ('Dan Davis', 151, 2840);
insert into SINGER (sname, singer_id, price)
values ('Jane Doe', 152, 1971);
insert into SINGER (sname, singer_id, price)
values ('Carol Smith', 153, 6071);
insert into SINGER (sname, singer_id, price)
values ('Dan Brown', 156, 4315);
insert into SINGER (sname, singer_id, price)
values ('Dan Wilson', 159, 6653);
insert into SINGER (sname, singer_id, price)
values ('Grace Johnson', 160, 2750);
insert into SINGER (sname, singer_id, price)
values ('Grace Doe', 162, 5267);
insert into SINGER (sname, singer_id, price)
values ('Carol Williams', 165, 5003);
insert into SINGER (sname, singer_id, price)
values ('Frank Williams', 166, 4022);
insert into SINGER (sname, singer_id, price)
values ('Dan Garcia', 168, 5921);
insert into SINGER (sname, singer_id, price)
values ('Bob Davis', 170, 4651);
insert into SINGER (sname, singer_id, price)
values ('Eve Garcia', 171, 7444);
insert into SINGER (sname, singer_id, price)
values ('Grace Wilson', 174, 7080);
insert into SINGER (sname, singer_id, price)
values ('Grace Doe', 175, 10617);
insert into SINGER (sname, singer_id, price)
values ('Bob Davis', 176, 2685);
insert into SINGER (sname, singer_id, price)
values ('Eve Doe', 178, 2860);
insert into SINGER (sname, singer_id, price)
values ('Henry Garcia', 179, 8801);
insert into SINGER (sname, singer_id, price)
values ('Alice Smith', 180, 4993);
insert into SINGER (sname, singer_id, price)
values ('Dan Johnson', 181, 7258);
insert into SINGER (sname, singer_id, price)
values ('Dan Garcia', 182, 8518);
insert into SINGER (sname, singer_id, price)
values ('Bob Garcia', 183, 7961);
insert into SINGER (sname, singer_id, price)
values ('Henry Wilson', 185, 3811);
commit;
prompt 100 records committed...
insert into SINGER (sname, singer_id, price)
values ('Eve Wilson', 186, 6683);
insert into SINGER (sname, singer_id, price)
values ('Eve Brown', 187, 5344);
insert into SINGER (sname, singer_id, price)
values ('Eve Smith', 188, 2533);
insert into SINGER (sname, singer_id, price)
values ('John Brown', 189, 9274);
insert into SINGER (sname, singer_id, price)
values ('Carol Miller', 191, 8541);
insert into SINGER (sname, singer_id, price)
values ('Carol Brown', 192, 6786);
insert into SINGER (sname, singer_id, price)
values ('Jane Miller', 193, 2285);
insert into SINGER (sname, singer_id, price)
values ('John Johnson', 195, 2657);
insert into SINGER (sname, singer_id, price)
values ('Carol Johnson', 196, 6316);
insert into SINGER (sname, singer_id, price)
values ('Alice Johnson', 197, 5346);
insert into SINGER (sname, singer_id, price)
values ('Alice Johnson', 200, 9521);
insert into SINGER (sname, singer_id, price)
values ('Carol Williams', 201, 1514);
insert into SINGER (sname, singer_id, price)
values ('Grace Williams', 202, 9853);
insert into SINGER (sname, singer_id, price)
values ('Alice Davis', 205, 4682);
insert into SINGER (sname, singer_id, price)
values ('Dan Jones', 206, 1841);
insert into SINGER (sname, singer_id, price)
values ('John Garcia', 207, 8454);
insert into SINGER (sname, singer_id, price)
values ('Eve Jones', 208, 8508);
insert into SINGER (sname, singer_id, price)
values ('Dan Johnson', 209, 5624);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 211, 7543);
insert into SINGER (sname, singer_id, price)
values ('Bob Garcia', 212, 9114);
insert into SINGER (sname, singer_id, price)
values ('Bob Doe', 213, 1060);
insert into SINGER (sname, singer_id, price)
values ('Dan Brown', 214, 1089);
insert into SINGER (sname, singer_id, price)
values ('Frank Wilson', 215, 3133);
insert into SINGER (sname, singer_id, price)
values ('Grace Johnson', 216, 4285);
insert into SINGER (sname, singer_id, price)
values ('Eve Smith', 218, 3546);
insert into SINGER (sname, singer_id, price)
values ('Jane Doe', 219, 8569);
insert into SINGER (sname, singer_id, price)
values ('Dan Davis', 223, 4905);
insert into SINGER (sname, singer_id, price)
values ('Jane Garcia', 224, 8437);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 226, 9306);
insert into SINGER (sname, singer_id, price)
values ('Frank Brown', 227, 5417);
insert into SINGER (sname, singer_id, price)
values ('John Williams', 230, 9358);
insert into SINGER (sname, singer_id, price)
values ('Eve Doe', 235, 7117);
insert into SINGER (sname, singer_id, price)
values ('Carol Wilson', 236, 4989);
insert into SINGER (sname, singer_id, price)
values ('Jane Garcia', 237, 1931);
insert into SINGER (sname, singer_id, price)
values ('Alice Smith', 238, 2273);
insert into SINGER (sname, singer_id, price)
values ('Henry Doe', 239, 5838);
insert into SINGER (sname, singer_id, price)
values ('Henry Doe', 240, 1344);
insert into SINGER (sname, singer_id, price)
values ('Alice Smith', 241, 3260);
insert into SINGER (sname, singer_id, price)
values ('Grace Wilson', 242, 9747);
insert into SINGER (sname, singer_id, price)
values ('Henry Miller', 243, 9973);
insert into SINGER (sname, singer_id, price)
values ('Grace Brown', 246, 6930);
insert into SINGER (sname, singer_id, price)
values ('John Miller', 247, 3423);
insert into SINGER (sname, singer_id, price)
values ('Grace Davis', 248, 1006);
insert into SINGER (sname, singer_id, price)
values ('Frank Garcia', 249, 1231);
insert into SINGER (sname, singer_id, price)
values ('Grace Miller', 250, 4259);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 252, 5535);
insert into SINGER (sname, singer_id, price)
values ('Jane Wilson', 253, 7360);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 255, 2300);
insert into SINGER (sname, singer_id, price)
values ('Henry Smith', 256, 6797);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 257, 7852);
insert into SINGER (sname, singer_id, price)
values ('Grace Doe', 259, 9827);
insert into SINGER (sname, singer_id, price)
values ('Carol Doe', 261, 2674);
insert into SINGER (sname, singer_id, price)
values ('Carol Miller', 264, 4056);
insert into SINGER (sname, singer_id, price)
values ('Frank Garcia', 266, 2288);
insert into SINGER (sname, singer_id, price)
values ('Frank Jones', 267, 9448);
insert into SINGER (sname, singer_id, price)
values ('Alice Garcia', 268, 5910);
insert into SINGER (sname, singer_id, price)
values ('Bob Wilson', 269, 2032);
insert into SINGER (sname, singer_id, price)
values ('John Doe', 272, 2936);
insert into SINGER (sname, singer_id, price)
values ('Frank Miller', 278, 6756);
insert into SINGER (sname, singer_id, price)
values ('John Davis', 279, 5176);
insert into SINGER (sname, singer_id, price)
values ('Frank Garcia', 280, 4762);
insert into SINGER (sname, singer_id, price)
values ('Grace Johnson', 282, 7763);
insert into SINGER (sname, singer_id, price)
values ('John Johnson', 286, 9032);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 287, 1420);
insert into SINGER (sname, singer_id, price)
values ('Dan Miller', 288, 4275);
insert into SINGER (sname, singer_id, price)
values ('Bob Davis', 290, 6350);
insert into SINGER (sname, singer_id, price)
values ('Dan Wilson', 292, 1171);
insert into SINGER (sname, singer_id, price)
values ('Dan Jones', 293, 5010);
insert into SINGER (sname, singer_id, price)
values ('Henry Williams', 297, 8226);
insert into SINGER (sname, singer_id, price)
values ('Dan Garcia', 299, 5313);
insert into SINGER (sname, singer_id, price)
values ('Eve Miller', 302, 7175);
insert into SINGER (sname, singer_id, price)
values ('Grace Miller', 303, 5713);
insert into SINGER (sname, singer_id, price)
values ('Carol Jones', 305, 6722);
insert into SINGER (sname, singer_id, price)
values ('John Jones', 306, 2679);
insert into SINGER (sname, singer_id, price)
values ('Dan Johnson', 307, 8218);
insert into SINGER (sname, singer_id, price)
values ('John Smith', 309, 9391);
insert into SINGER (sname, singer_id, price)
values ('Bob Johnson', 310, 7078);
insert into SINGER (sname, singer_id, price)
values ('Henry Williams', 311, 9599);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 313, 4142);
insert into SINGER (sname, singer_id, price)
values ('Jane Wilson', 315, 2052);
insert into SINGER (sname, singer_id, price)
values ('Grace Brown', 318, 7149);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 320, 2601);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 321, 9848);
insert into SINGER (sname, singer_id, price)
values ('John Miller', 322, 7475);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 324, 1112);
insert into SINGER (sname, singer_id, price)
values ('Henry Johnson', 325, 7968);
insert into SINGER (sname, singer_id, price)
values ('Eve Johnson', 326, 4723);
insert into SINGER (sname, singer_id, price)
values ('Carol Doe', 327, 6292);
insert into SINGER (sname, singer_id, price)
values ('Bob Davis', 332, 4615);
insert into SINGER (sname, singer_id, price)
values ('Bob Garcia', 333, 7044);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 335, 1479);
insert into SINGER (sname, singer_id, price)
values ('Eve Doe', 336, 6932);
insert into SINGER (sname, singer_id, price)
values ('Frank Johnson', 339, 9913);
insert into SINGER (sname, singer_id, price)
values ('Dan Doe', 340, 1521);
insert into SINGER (sname, singer_id, price)
values ('Dan Brown', 343, 3623);
insert into SINGER (sname, singer_id, price)
values ('Dan Doe', 344, 1152);
insert into SINGER (sname, singer_id, price)
values ('Grace Davis', 345, 1577);
insert into SINGER (sname, singer_id, price)
values ('Jane Miller', 346, 5071);
insert into SINGER (sname, singer_id, price)
values ('Frank Brown', 350, 6772);
insert into SINGER (sname, singer_id, price)
values ('Dan Williams', 351, 9403);
commit;
prompt 200 records committed...
insert into SINGER (sname, singer_id, price)
values ('Bob Wilson', 352, 2552);
insert into SINGER (sname, singer_id, price)
values ('Jane Garcia', 353, 1256);
insert into SINGER (sname, singer_id, price)
values ('Jane Davis', 354, 1139);
insert into SINGER (sname, singer_id, price)
values ('John Doe', 358, 7654);
insert into SINGER (sname, singer_id, price)
values ('Frank Davis', 359, 6232);
insert into SINGER (sname, singer_id, price)
values ('Bob Williams', 360, 6824);
insert into SINGER (sname, singer_id, price)
values ('Carol Wilson', 362, 7785);
insert into SINGER (sname, singer_id, price)
values ('Jane Doe', 363, 7762);
insert into SINGER (sname, singer_id, price)
values ('John Garcia', 364, 5405);
insert into SINGER (sname, singer_id, price)
values ('John Garcia', 365, 5028);
insert into SINGER (sname, singer_id, price)
values ('Henry Davis', 367, 9531);
insert into SINGER (sname, singer_id, price)
values ('Alice Williams', 368, 1648);
insert into SINGER (sname, singer_id, price)
values ('Dan Doe', 371, 6228);
insert into SINGER (sname, singer_id, price)
values ('Grace Brown', 375, 6711);
insert into SINGER (sname, singer_id, price)
values ('Henry Brown', 379, 10369);
insert into SINGER (sname, singer_id, price)
values ('Dan Williams', 380, 9221);
insert into SINGER (sname, singer_id, price)
values ('John Johnson', 381, 8902);
insert into SINGER (sname, singer_id, price)
values ('Grace Brown', 383, 8719);
insert into SINGER (sname, singer_id, price)
values ('Grace Smith', 385, 2092);
insert into SINGER (sname, singer_id, price)
values ('Bob Brown', 388, 4198);
insert into SINGER (sname, singer_id, price)
values ('John Smith', 392, 7403);
insert into SINGER (sname, singer_id, price)
values ('Eve Doe', 393, 7976);
insert into SINGER (sname, singer_id, price)
values ('Carol Johnson', 395, 7841);
insert into SINGER (sname, singer_id, price)
values ('Eve Doe', 396, 1095);
insert into SINGER (sname, singer_id, price)
values ('Alice Johnson', 397, 2216);
insert into SINGER (sname, singer_id, price)
values ('Jane Smith', 398, 5935);
insert into SINGER (sname, singer_id, price)
values ('Henry Williams', 399, 7749);
insert into SINGER (sname, singer_id, price)
values ('Grace Wilson', 401, 3074);
insert into SINGER (sname, singer_id, price)
values ('Grace Garcia', 403, 8497);
insert into SINGER (sname, singer_id, price)
values ('Jane Johnson', 406, 6179);
insert into SINGER (sname, singer_id, price)
values ('Bob Brown', 411, 5791);
insert into SINGER (sname, singer_id, price)
values ('Eve Garcia', 412, 7730);
insert into SINGER (sname, singer_id, price)
values ('Grace Williams', 413, 9251);
insert into SINGER (sname, singer_id, price)
values ('Alice Miller', 414, 3593);
insert into SINGER (sname, singer_id, price)
values ('Dan Jones', 415, 7873);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 417, 8345);
insert into SINGER (sname, singer_id, price)
values ('Alice Wilson', 418, 2743);
insert into SINGER (sname, singer_id, price)
values ('Dan Davis', 420, 2593);
insert into SINGER (sname, singer_id, price)
values ('John Miller', 421, 4932);
insert into SINGER (sname, singer_id, price)
values ('Dan Brown', 425, 2018);
insert into SINGER (sname, singer_id, price)
values ('Alice Brown', 427, 5503);
insert into SINGER (sname, singer_id, price)
values ('Carol Jones', 428, 6808);
insert into SINGER (sname, singer_id, price)
values ('Dan Garcia', 429, 6472);
insert into SINGER (sname, singer_id, price)
values ('Jane Wilson', 430, 7223);
insert into SINGER (sname, singer_id, price)
values ('Jane Johnson', 431, 3719);
insert into SINGER (sname, singer_id, price)
values ('Jane Wilson', 432, 1909);
insert into SINGER (sname, singer_id, price)
values ('Jane Williams', 433, 9548);
insert into SINGER (sname, singer_id, price)
values ('Frank Johnson', 434, 8140);
insert into SINGER (sname, singer_id, price)
values ('John Doe', 435, 6832);
insert into SINGER (sname, singer_id, price)
values ('John Wilson', 437, 6013);
insert into SINGER (sname, singer_id, price)
values ('Grace Williams', 438, 9293);
insert into SINGER (sname, singer_id, price)
values ('Alice Garcia', 443, 2060);
insert into SINGER (sname, singer_id, price)
values ('Bob Miller', 444, 2546);
insert into SINGER (sname, singer_id, price)
values ('Frank Davis', 445, 4712);
insert into SINGER (sname, singer_id, price)
values ('Carol Smith', 446, 1868);
insert into SINGER (sname, singer_id, price)
values ('Henry Davis', 447, 6088);
insert into SINGER (sname, singer_id, price)
values ('John Doe', 448, 7215);
insert into SINGER (sname, singer_id, price)
values ('Bob Brown', 449, 1548);
commit;
prompt 258 records loaded
prompt Loading EVENT...
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-11-2022', 'dd-mm-yyyy'), 'Ruby Gardens', 1, 482, 151, 67, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-12-2020', 'dd-mm-yyyy'), 'Ethereal Ballro', 2, 265, 246, 585, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-02-2028', 'dd-mm-yyyy'), 'Whispering Gard', 3, 456, 447, 810, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-03-2028', 'dd-mm-yyyy'), 'Grandeur Hall', 4, 238, 430, 768, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-01-2021', 'dd-mm-yyyy'), 'Pearl Pavilion', 5, 278, 62, 366, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-11-2020', 'dd-mm-yyyy'), 'Pearl Pavilion', 6, 431, 411, 221, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-11-2027', 'dd-mm-yyyy'), 'Gilded Palace', 7, 406, 143, 62, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-08-2022', 'dd-mm-yyyy'), 'Topaz Terrace', 8, 480, 166, 422, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-05-2025', 'dd-mm-yyyy'), 'Moonbeam Hall', 9, 529, 392, 690, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-02-2024', 'dd-mm-yyyy'), 'Tranquil Garden', 10, 504, 208, 643, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 'Whispering Gard', 11, 515, 32, 925, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-08-2022', 'dd-mm-yyyy'), 'Mystic Terrace', 12, 446, 339, 263, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2020', 'dd-mm-yyyy'), 'Noble Hall', 13, 259, 367, 176, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-07-2022', 'dd-mm-yyyy'), 'Grand Oasis Hal', 14, 308, 383, 812, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-10-2022', 'dd-mm-yyyy'), 'Luxury Pavilion', 16, 291, 33, 221, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-04-2027', 'dd-mm-yyyy'), 'Silver Springs ', 17, 326, 303, 95, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-11-2025', 'dd-mm-yyyy'), 'Noble Hall', 18, 209, 226, 181, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-03-2027', 'dd-mm-yyyy'), 'Harmony Hall', 19, 348, 375, 663, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-02-2026', 'dd-mm-yyyy'), 'Victory Pavilio', 20, 386, 415, 628, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-03-2027', 'dd-mm-yyyy'), 'Regal Ballroom', 21, 350, 432, 220, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 'Silver Springs ', 22, 377, 213, 893, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-06-2024', 'dd-mm-yyyy'), 'Whispering Gard', 23, 328, 302, 251, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-02-2024', 'dd-mm-yyyy'), 'Noble Hall', 24, 409, 315, 20, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-01-2024', 'dd-mm-yyyy'), 'Grand Oasis Hal', 25, 289, 326, 490, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2023', 'dd-mm-yyyy'), 'Noble Hall', 26, 416, 379, 232, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-02-2021', 'dd-mm-yyyy'), 'Harmony Hall', 27, 539, 321, 226, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-01-2022', 'dd-mm-yyyy'), 'Dreamy Manor', 28, 289, 427, 723, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-03-2028', 'dd-mm-yyyy'), 'Dreamy Manor', 29, 203, 68, 604, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2025', 'dd-mm-yyyy'), 'Sapphire Hall', 30, 555, 333, 112, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-12-2027', 'dd-mm-yyyy'), 'Pearl Pavilion', 31, 241, 193, 826, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-04-2023', 'dd-mm-yyyy'), 'Royal Garden Ha', 32, 453, 23, 325, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-05-2026', 'dd-mm-yyyy'), 'Radiant Hall', 33, 441, 60, 192, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-06-2026', 'dd-mm-yyyy'), 'Dreamy Manor', 34, 526, 130, 835, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-03-2021', 'dd-mm-yyyy'), 'Harmony Hall', 35, 407, 63, 154, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 'Grand Oasis Hal', 36, 544, 354, 518, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-10-2024', 'dd-mm-yyyy'), 'Glamorous Ballr', 37, 271, 108, 344, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-10-2028', 'dd-mm-yyyy'), 'Glamorous Ballr', 38, 310, 42, 16, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 'Glamorous Ballr', 39, 300, 6, 285, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-02-2028', 'dd-mm-yyyy'), 'Ruby Gardens', 40, 268, 168, 144, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-05-2025', 'dd-mm-yyyy'), 'Luxury Pavilion', 42, 286, 26, 456, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-10-2022', 'dd-mm-yyyy'), 'Tranquil Garden', 43, 598, 429, 226, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-09-2024', 'dd-mm-yyyy'), 'Heavenly Terrac', 44, 503, 13, 745, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-11-2021', 'dd-mm-yyyy'), 'Diamond Palace', 45, 598, 142, 860, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-06-2026', 'dd-mm-yyyy'), 'Pearl Pavilion', 46, 359, 288, 107, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-01-2028', 'dd-mm-yyyy'), 'Platinum Plaza', 47, 558, 443, 396, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 'Grandeur Hall', 48, 559, 86, 868, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-04-2022', 'dd-mm-yyyy'), 'Aurora Ballroom', 49, 521, 185, 295, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-06-2024', 'dd-mm-yyyy'), 'Elegant Terrace', 50, 201, 388, 326, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-07-2025', 'dd-mm-yyyy'), 'Glamorous Ballr', 51, 401, 375, 597, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-03-2027', 'dd-mm-yyyy'), 'Moonbeam Hall', 52, 320, 398, 333, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-06-2021', 'dd-mm-yyyy'), 'Silver Springs ', 53, 547, 109, 661, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-02-2021', 'dd-mm-yyyy'), 'Diamond Palace', 54, 387, 290, 329, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('22-05-2028', 'dd-mm-yyyy'), 'Enchanted Garde', 55, 588, 339, 354, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-04-2026', 'dd-mm-yyyy'), 'Tranquil Garden', 56, 537, 420, 125, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-10-2021', 'dd-mm-yyyy'), 'Platinum Plaza', 57, 373, 224, 356, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-10-2024', 'dd-mm-yyyy'), 'Whispering Gard', 58, 359, 139, 752, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-10-2024', 'dd-mm-yyyy'), 'Topaz Terrace', 59, 589, 379, 699, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-08-2027', 'dd-mm-yyyy'), 'Eclipse Ballroo', 60, 221, 432, 634, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-10-2021', 'dd-mm-yyyy'), 'Pearl Pavilion', 61, 244, 340, 189, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 'Jade Hall', 62, 391, 148, 957, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-09-2022', 'dd-mm-yyyy'), 'Jade Hall', 63, 594, 175, 991, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-12-2028', 'dd-mm-yyyy'), 'Eclipse Ballroo', 64, 599, 174, 568, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-11-2022', 'dd-mm-yyyy'), 'Tranquil Garden', 65, 250, 36, 44, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-03-2027', 'dd-mm-yyyy'), 'Ruby Gardens', 66, 494, 279, 952, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('05-02-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo', 67, 588, 445, 981, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-02-2027', 'dd-mm-yyyy'), 'Luxury Pavilion', 68, 385, 395, 455, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-04-2021', 'dd-mm-yyyy'), 'Noble Hall', 69, 553, 52, 529, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-12-2026', 'dd-mm-yyyy'), 'Dreamy Manor', 70, 448, 3, 210, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-03-2025', 'dd-mm-yyyy'), 'Whispering Gard', 71, 433, 211, 336, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-08-2024', 'dd-mm-yyyy'), 'Elegant Terrace', 72, 423, 429, 685, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-08-2027', 'dd-mm-yyyy'), 'Sapphire Hall', 73, 258, 152, 657, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-12-2025', 'dd-mm-yyyy'), 'Sapphire Hall', 75, 365, 393, 559, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-12-2025', 'dd-mm-yyyy'), 'Topaz Terrace', 76, 260, 307, 847, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-06-2027', 'dd-mm-yyyy'), 'Aurora Ballroom', 77, 373, 150, 619, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 'Glamorous Ballr', 78, 514, 227, 657, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-06-2021', 'dd-mm-yyyy'), 'Eclipse Ballroo', 79, 573, 8, 87, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-10-2028', 'dd-mm-yyyy'), 'Victory Pavilio', 80, 499, 324, 952, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-08-2027', 'dd-mm-yyyy'), 'Gilded Palace', 81, 382, 124, 883, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-02-2028', 'dd-mm-yyyy'), 'Serene Pavilion', 82, 368, 97, 819, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-10-2027', 'dd-mm-yyyy'), 'Serene Pavilion', 83, 246, 181, 542, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-12-2024', 'dd-mm-yyyy'), 'Silver Springs ', 84, 501, 32, 748, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-01-2026', 'dd-mm-yyyy'), 'Dazzle Pavilion', 85, 460, 428, 94, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-11-2020', 'dd-mm-yyyy'), 'Radiant Hall', 86, 239, 406, 700, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-03-2022', 'dd-mm-yyyy'), 'Royal Garden Ha', 87, 571, 215, 947, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2028', 'dd-mm-yyyy'), 'Ruby Gardens', 88, 277, 156, 614, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-06-2027', 'dd-mm-yyyy'), 'Aurora Ballroom', 89, 431, 13, 285, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-09-2025', 'dd-mm-yyyy'), 'Sapphire Hall', 90, 387, 350, 430, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-11-2021', 'dd-mm-yyyy'), 'Diamond Palace', 91, 259, 243, 897, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-12-2024', 'dd-mm-yyyy'), 'Starlight Pavil', 92, 335, 195, 723, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-02-2027', 'dd-mm-yyyy'), 'Glamorous Ballr', 93, 576, 176, 461, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 'Gilded Palace', 94, 414, 272, 260, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-06-2028', 'dd-mm-yyyy'), 'Blissful Palace', 95, 279, 344, 888, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-01-2027', 'dd-mm-yyyy'), 'Dreamy Manor', 96, 543, 345, 922, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-02-2028', 'dd-mm-yyyy'), 'Grand Oasis Hal', 97, 360, 336, 875, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-01-2023', 'dd-mm-yyyy'), 'Heavenly Terrac', 98, 308, 166, 83, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-02-2027', 'dd-mm-yyyy'), 'Jade Hall', 99, 596, 69, 343, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), 'Grandeur Hall', 100, 348, 320, 837, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-04-2026', 'dd-mm-yyyy'), 'Blissful Palace', 101, 361, 385, 129, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 'Amethyst Ballro', 102, 438, 313, 560, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-10-2023', 'dd-mm-yyyy'), 'Radiant Hall', 103, 568, 174, 915, 839);
commit;
prompt 100 records committed...
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-01-2027', 'dd-mm-yyyy'), 'Whispering Gard', 104, 423, 309, 314, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-10-2024', 'dd-mm-yyyy'), 'Moonbeam Hall', 105, 280, 13, 998, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-06-2025', 'dd-mm-yyyy'), 'Radiant Hall', 106, 208, 399, 724, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('17-09-2027', 'dd-mm-yyyy'), 'Topaz Terrace', 107, 409, 403, 125, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-10-2024', 'dd-mm-yyyy'), 'Topaz Terrace', 108, 295, 25, 809, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-03-2025', 'dd-mm-yyyy'), 'Aurora Ballroom', 109, 329, 363, 490, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-06-2022', 'dd-mm-yyyy'), 'Sunset Ballroom', 110, 217, 282, 540, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-05-2026', 'dd-mm-yyyy'), 'Onyx Mansion', 112, 202, 413, 111, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-10-2026', 'dd-mm-yyyy'), 'Sapphire Hall', 113, 243, 417, 2, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-10-2026', 'dd-mm-yyyy'), 'Opal Palace', 114, 551, 307, 227, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-07-2022', 'dd-mm-yyyy'), 'Harmony Hall', 115, 525, 74, 169, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-02-2025', 'dd-mm-yyyy'), 'Cherished Garde', 116, 344, 141, 763, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-05-2020', 'dd-mm-yyyy'), 'Jade Hall', 117, 593, 449, 169, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-11-2026', 'dd-mm-yyyy'), 'Sunset Ballroom', 118, 480, 93, 50, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-11-2027', 'dd-mm-yyyy'), 'Royal Garden Ha', 119, 534, 303, 897, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 'Opal Palace', 120, 382, 227, 832, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 'Blissful Palace', 121, 515, 230, 569, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-05-2024', 'dd-mm-yyyy'), 'Pearl Pavilion', 122, 272, 201, 24, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 'Dazzle Pavilion', 124, 537, 140, 264, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-12-2024', 'dd-mm-yyyy'), 'Enchanted Garde', 125, 512, 30, 136, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 'Platinum Plaza', 126, 322, 414, 0, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-02-2025', 'dd-mm-yyyy'), 'Amethyst Ballro', 127, 574, 65, 25, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-05-2022', 'dd-mm-yyyy'), 'Noble Hall', 128, 554, 305, 496, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-06-2028', 'dd-mm-yyyy'), 'Tranquil Garden', 129, 229, 446, 623, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-01-2026', 'dd-mm-yyyy'), 'Majestic Manor', 130, 509, 200, 364, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-05-2021', 'dd-mm-yyyy'), 'Jade Hall', 131, 313, 346, 715, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-03-2026', 'dd-mm-yyyy'), 'Crystal Ballroo', 132, 477, 434, 585, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 'Platinum Plaza', 133, 464, 311, 616, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-09-2021', 'dd-mm-yyyy'), 'Harmony Hall', 134, 380, 239, 468, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-10-2021', 'dd-mm-yyyy'), 'Serene Pavilion', 135, 454, 103, 107, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-05-2024', 'dd-mm-yyyy'), 'Opal Palace', 137, 319, 187, 894, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-02-2025', 'dd-mm-yyyy'), 'Ruby Gardens', 138, 480, 10, 450, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-08-2026', 'dd-mm-yyyy'), 'Celestial Terra', 139, 208, 41, 372, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2028', 'dd-mm-yyyy'), 'Jade Hall', 140, 442, 87, 243, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-03-2020', 'dd-mm-yyyy'), 'Breathtaking Te', 141, 542, 142, 803, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-01-2021', 'dd-mm-yyyy'), 'Exquisite Pavil', 142, 420, 10, 407, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 'Victory Pavilio', 143, 464, 94, 432, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 'Eclipse Ballroo', 144, 315, 448, 653, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-10-2022', 'dd-mm-yyyy'), 'Starlight Pavil', 145, 580, 413, 456, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-11-2022', 'dd-mm-yyyy'), 'Sapphire Hall', 146, 594, 206, 455, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-02-2023', 'dd-mm-yyyy'), 'Gilded Palace', 147, 559, 119, 835, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-06-2028', 'dd-mm-yyyy'), 'Royal Garden Ha', 148, 323, 290, 219, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-04-2023', 'dd-mm-yyyy'), 'Opal Palace', 149, 578, 196, 87, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-11-2020', 'dd-mm-yyyy'), 'Serene Pavilion', 150, 562, 379, 230, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-11-2022', 'dd-mm-yyyy'), 'Ethereal Ballro', 151, 313, 421, 831, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-08-2021', 'dd-mm-yyyy'), 'Sapphire Hall', 152, 365, 187, 838, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 'Amethyst Ballro', 153, 456, 238, 980, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-08-2026', 'dd-mm-yyyy'), 'Cherished Garde', 154, 381, 43, 369, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-03-2024', 'dd-mm-yyyy'), 'Harmony Hall', 155, 284, 415, 37, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2023', 'dd-mm-yyyy'), 'Tranquil Garden', 156, 389, 108, 188, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-05-2022', 'dd-mm-yyyy'), 'Whispering Gard', 157, 292, 195, 517, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-05-2028', 'dd-mm-yyyy'), 'Mystic Terrace', 158, 521, 205, 800, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-05-2024', 'dd-mm-yyyy'), 'Luxury Pavilion', 159, 536, 170, 733, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-02-2021', 'dd-mm-yyyy'), 'Elite Mansion', 160, 257, 252, 832, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-10-2020', 'dd-mm-yyyy'), 'Glamorous Ballr', 161, 348, 252, 837, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-12-2023', 'dd-mm-yyyy'), 'Majestic Manor', 162, 446, 375, 413, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-01-2024', 'dd-mm-yyyy'), 'Aurora Ballroom', 163, 301, 219, 716, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-09-2028', 'dd-mm-yyyy'), 'Topaz Terrace', 164, 274, 237, 351, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-04-2026', 'dd-mm-yyyy'), 'Regal Ballroom', 165, 361, 448, 427, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-05-2022', 'dd-mm-yyyy'), 'Radiant Hall', 166, 479, 96, 735, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('05-04-2021', 'dd-mm-yyyy'), 'Ruby Gardens', 167, 219, 101, 518, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-10-2024', 'dd-mm-yyyy'), 'Glamorous Ballr', 168, 442, 99, 866, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-05-2026', 'dd-mm-yyyy'), 'Heavenly Terrac', 169, 246, 239, 832, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-09-2022', 'dd-mm-yyyy'), 'Mystic Terrace', 170, 458, 392, 343, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2023', 'dd-mm-yyyy'), 'Moonbeam Hall', 171, 519, 249, 881, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-05-2025', 'dd-mm-yyyy'), 'Imperial Mansio', 172, 590, 380, 322, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-07-2025', 'dd-mm-yyyy'), 'Regal Ballroom', 173, 326, 37, 690, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-07-2028', 'dd-mm-yyyy'), 'Elite Mansion', 174, 379, 242, 538, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-04-2025', 'dd-mm-yyyy'), 'Noble Hall', 175, 387, 255, 831, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-05-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo', 176, 440, 54, 331, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-08-2028', 'dd-mm-yyyy'), 'Celestial Terra', 177, 498, 311, 590, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-03-2021', 'dd-mm-yyyy'), 'Platinum Plaza', 178, 351, 368, 719, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-11-2022', 'dd-mm-yyyy'), 'Glamorous Ballr', 179, 350, 162, 220, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-12-2021', 'dd-mm-yyyy'), 'Victory Pavilio', 180, 365, 136, 541, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-05-2021', 'dd-mm-yyyy'), 'Sapphire Hall', 181, 383, 205, 226, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-11-2025', 'dd-mm-yyyy'), 'Royal Garden Ha', 182, 444, 189, 768, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-08-2027', 'dd-mm-yyyy'), 'Pearl Pavilion', 184, 492, 246, 454, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-05-2028', 'dd-mm-yyyy'), 'Celestial Terra', 185, 284, 29, 886, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-06-2027', 'dd-mm-yyyy'), 'Victory Pavilio', 186, 360, 38, 225, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-04-2027', 'dd-mm-yyyy'), 'Moonbeam Hall', 187, 353, 131, 525, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-05-2024', 'dd-mm-yyyy'), 'Heavenly Terrac', 188, 308, 256, 606, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-12-2024', 'dd-mm-yyyy'), 'Grandeur Hall', 189, 291, 352, 478, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-12-2027', 'dd-mm-yyyy'), 'Grandeur Hall', 190, 520, 96, 546, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-06-2024', 'dd-mm-yyyy'), 'Pearl Pavilion', 191, 204, 261, 130, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-09-2022', 'dd-mm-yyyy'), 'Elegant Terrace', 192, 233, 360, 870, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-09-2025', 'dd-mm-yyyy'), 'Amethyst Ballro', 194, 274, 269, 230, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-02-2025', 'dd-mm-yyyy'), 'Topaz Terrace', 195, 204, 211, 456, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-12-2022', 'dd-mm-yyyy'), 'Dreamy Manor', 196, 296, 218, 226, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-08-2025', 'dd-mm-yyyy'), 'Cherished Garde', 197, 285, 128, 629, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-09-2021', 'dd-mm-yyyy'), 'Cherished Garde', 198, 248, 345, 812, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-07-2024', 'dd-mm-yyyy'), 'Onyx Mansion', 199, 372, 166, 98, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-10-2027', 'dd-mm-yyyy'), 'Dazzle Pavilion', 200, 397, 202, 285, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('22-06-2027', 'dd-mm-yyyy'), 'Pearl Pavilion', 201, 367, 358, 127, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-04-2028', 'dd-mm-yyyy'), 'Whispering Gard', 202, 322, 371, 103, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-01-2023', 'dd-mm-yyyy'), 'Ruby Gardens', 203, 580, 175, 827, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-02-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo', 204, 286, 207, 203, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-06-2026', 'dd-mm-yyyy'), 'Blissful Palace', 205, 303, 435, 745, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-06-2027', 'dd-mm-yyyy'), 'Tranquil Garden', 206, 459, 380, 369, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-06-2022', 'dd-mm-yyyy'), 'Silver Springs ', 207, 593, 305, 324, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-11-2023', 'dd-mm-yyyy'), 'Jade Hall', 208, 338, 183, 899, 472);
commit;
prompt 200 records committed...
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-10-2022', 'dd-mm-yyyy'), 'Aurora Ballroom', 209, 533, 259, 339, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-01-2021', 'dd-mm-yyyy'), 'Harmony Hall', 210, 479, 52, 690, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-11-2021', 'dd-mm-yyyy'), 'Breathtaking Te', 211, 582, 280, 413, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-07-2023', 'dd-mm-yyyy'), 'Royal Garden Ha', 212, 257, 327, 789, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-06-2022', 'dd-mm-yyyy'), 'Grandeur Hall', 213, 303, 178, 723, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-04-2025', 'dd-mm-yyyy'), 'Royal Garden Ha', 214, 592, 397, 529, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-03-2025', 'dd-mm-yyyy'), 'Breathtaking Te', 215, 579, 399, 657, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('17-04-2027', 'dd-mm-yyyy'), 'Cherished Garde', 216, 587, 367, 362, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-01-2022', 'dd-mm-yyyy'), 'Platinum Plaza', 217, 219, 216, 44, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-02-2028', 'dd-mm-yyyy'), 'Sunset Ballroom', 219, 272, 266, 200, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('06-11-2025', 'dd-mm-yyyy'), 'Mystic Terrace', 220, 370, 160, 453, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-11-2028', 'dd-mm-yyyy'), 'Enchanted Garde', 221, 212, 21, 500, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-02-2028', 'dd-mm-yyyy'), 'Tranquil Garden', 223, 599, 60, 203, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-03-2028', 'dd-mm-yyyy'), 'Imperial Mansio', 224, 326, 335, 658, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-06-2028', 'dd-mm-yyyy'), 'Amethyst Ballro', 225, 447, 46, 996, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-12-2024', 'dd-mm-yyyy'), 'Noble Hall', 226, 555, 396, 331, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-05-2021', 'dd-mm-yyyy'), 'Emerald Manor', 227, 344, 180, 158, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-05-2022', 'dd-mm-yyyy'), 'Blissful Palace', 228, 556, 58, 324, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 'Jade Hall', 229, 396, 95, 430, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('17-05-2021', 'dd-mm-yyyy'), 'Moonbeam Hall', 230, 505, 246, 651, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2024', 'dd-mm-yyyy'), 'Majestic Manor', 231, 204, 191, 314, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-04-2025', 'dd-mm-yyyy'), 'Crystal Ballroo', 232, 464, 313, 827, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-01-2021', 'dd-mm-yyyy'), 'Blissful Palace', 233, 216, 10, 642, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-05-2023', 'dd-mm-yyyy'), 'Dreamy Manor', 234, 462, 388, 884, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-05-2024', 'dd-mm-yyyy'), 'Breathtaking Te', 236, 333, 89, 339, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-12-2024', 'dd-mm-yyyy'), 'Elite Mansion', 237, 259, 212, 530, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-12-2027', 'dd-mm-yyyy'), 'Harmony Hall', 238, 530, 197, 86, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-07-2027', 'dd-mm-yyyy'), 'Gilded Palace', 239, 485, 362, 947, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 'Enchanted Garde', 240, 325, 418, 947, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-10-2020', 'dd-mm-yyyy'), 'Ruby Gardens', 241, 253, 358, 560, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 'Radiant Hall', 242, 442, 352, 4, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-04-2027', 'dd-mm-yyyy'), 'Blissful Palace', 243, 220, 332, 559, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-03-2028', 'dd-mm-yyyy'), 'Silver Springs ', 244, 440, 252, 413, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-12-2028', 'dd-mm-yyyy'), 'Ruby Gardens', 245, 567, 327, 358, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-06-2025', 'dd-mm-yyyy'), 'Crystal Ballroo', 246, 377, 223, 308, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 'Elegant Terrace', 247, 248, 267, 903, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-06-2021', 'dd-mm-yyyy'), 'Imperial Mansio', 248, 429, 268, 788, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-03-2026', 'dd-mm-yyyy'), 'Elite Mansion', 249, 510, 241, 200, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-10-2024', 'dd-mm-yyyy'), 'Starlight Pavil', 250, 476, 175, 110, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-01-2027', 'dd-mm-yyyy'), 'Tranquil Garden', 251, 502, 92, 304, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-08-2026', 'dd-mm-yyyy'), 'Opal Palace', 252, 304, 159, 685, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-10-2028', 'dd-mm-yyyy'), 'Cherished Garde', 253, 292, 358, 324, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 'Exquisite Pavil', 254, 292, 261, 219, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-01-2025', 'dd-mm-yyyy'), 'Heavenly Terrac', 255, 523, 309, 862, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-05-2022', 'dd-mm-yyyy'), 'Regal Ballroom', 256, 511, 311, 792, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-08-2025', 'dd-mm-yyyy'), 'Victory Pavilio', 257, 564, 11, 590, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('05-07-2027', 'dd-mm-yyyy'), 'Emerald Manor', 258, 387, 406, 2, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-08-2025', 'dd-mm-yyyy'), 'Platinum Plaza', 259, 529, 214, 154, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-03-2026', 'dd-mm-yyyy'), 'Dazzle Pavilion', 260, 524, 431, 623, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-09-2028', 'dd-mm-yyyy'), 'Ruby Gardens', 261, 389, 257, 613, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-01-2028', 'dd-mm-yyyy'), 'Elegant Terrace', 262, 575, 107, 847, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-12-2024', 'dd-mm-yyyy'), 'Sunset Ballroom', 263, 588, 413, 815, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-10-2027', 'dd-mm-yyyy'), 'Silver Springs ', 264, 303, 364, 351, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 'Dreamy Manor', 265, 558, 186, 716, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-02-2024', 'dd-mm-yyyy'), 'Opal Palace', 266, 272, 240, 163, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-10-2025', 'dd-mm-yyyy'), 'Grandeur Hall', 267, 511, 306, 654, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-07-2028', 'dd-mm-yyyy'), 'Onyx Mansion', 268, 388, 411, 44, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-04-2022', 'dd-mm-yyyy'), 'Silver Springs ', 269, 492, 333, 647, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-01-2023', 'dd-mm-yyyy'), 'Tranquil Garden', 270, 367, 293, 144, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-05-2021', 'dd-mm-yyyy'), 'Crystal Ballroo', 271, 325, 216, 202, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-10-2027', 'dd-mm-yyyy'), 'Opal Palace', 272, 471, 318, 274, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-10-2021', 'dd-mm-yyyy'), 'Gilded Palace', 273, 258, 209, 87, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-11-2026', 'dd-mm-yyyy'), 'Luxury Pavilion', 274, 512, 148, 226, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-12-2025', 'dd-mm-yyyy'), 'Cherished Garde', 275, 510, 412, 319, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-03-2026', 'dd-mm-yyyy'), 'Diamond Palace', 276, 412, 292, 518, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-12-2028', 'dd-mm-yyyy'), 'Onyx Mansion', 277, 533, 30, 210, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-01-2020', 'dd-mm-yyyy'), 'Jade Hall', 278, 476, 388, 897, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-02-2021', 'dd-mm-yyyy'), 'Grandeur Hall', 279, 498, 185, 13, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-04-2026', 'dd-mm-yyyy'), 'Breathtaking Te', 280, 555, 320, 169, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-08-2022', 'dd-mm-yyyy'), 'Celestial Terra', 281, 241, 171, 403, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-11-2021', 'dd-mm-yyyy'), 'Eclipse Ballroo', 282, 401, 141, 333, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-11-2026', 'dd-mm-yyyy'), 'Moonbeam Hall', 283, 383, 235, 726, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-01-2025', 'dd-mm-yyyy'), 'Luxury Pavilion', 284, 297, 9, 180, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-10-2027', 'dd-mm-yyyy'), 'Whispering Gard', 285, 498, 111, 189, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-12-2027', 'dd-mm-yyyy'), 'Mystic Terrace', 286, 219, 153, 530, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-06-2027', 'dd-mm-yyyy'), 'Glamorous Ballr', 287, 560, 68, 875, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-02-2028', 'dd-mm-yyyy'), 'Amethyst Ballro', 288, 356, 401, 126, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-05-2023', 'dd-mm-yyyy'), 'Amethyst Ballro', 289, 402, 73, 590, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-01-2024', 'dd-mm-yyyy'), 'Regal Ballroom', 290, 352, 433, 403, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-06-2021', 'dd-mm-yyyy'), 'Exquisite Pavil', 291, 445, 182, 83, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-12-2028', 'dd-mm-yyyy'), 'Radiant Hall', 292, 325, 299, 982, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2021', 'dd-mm-yyyy'), 'Pearl Pavilion', 293, 289, 135, 855, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('31-10-2026', 'dd-mm-yyyy'), 'Jade Hall', 294, 289, 383, 885, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-03-2027', 'dd-mm-yyyy'), 'Aurora Ballroom', 295, 377, 62, 613, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-07-2025', 'dd-mm-yyyy'), 'Crystal Ballroo', 296, 327, 40, 940, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 'Exquisite Pavil', 297, 592, 253, 957, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-12-2026', 'dd-mm-yyyy'), 'Victory Pavilio', 298, 551, 437, 714, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-06-2021', 'dd-mm-yyyy'), 'Blissful Palace', 299, 466, 192, 847, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-09-2021', 'dd-mm-yyyy'), 'Diamond Palace', 300, 567, 76, 505, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-08-2027', 'dd-mm-yyyy'), 'Glamorous Ballr', 301, 532, 249, 219, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-04-2024', 'dd-mm-yyyy'), 'Sunset Ballroom', 302, 454, 286, 10, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-12-2024', 'dd-mm-yyyy'), 'Whispering Gard', 303, 286, 224, 925, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-05-2026', 'dd-mm-yyyy'), 'Grand Oasis Hal', 304, 205, 325, 560, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-10-2025', 'dd-mm-yyyy'), 'Amethyst Ballro', 305, 577, 264, 661, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-10-2027', 'dd-mm-yyyy'), 'Regal Ballroom', 306, 566, 153, 255, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-10-2020', 'dd-mm-yyyy'), 'Exquisite Pavil', 307, 581, 393, 664, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('17-12-2022', 'dd-mm-yyyy'), 'Jade Hall', 309, 293, 77, 915, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-11-2025', 'dd-mm-yyyy'), 'Eclipse Ballroo', 310, 475, 406, 310, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-02-2022', 'dd-mm-yyyy'), 'Gilded Palace', 311, 272, 345, 884, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('01-01-2028', 'dd-mm-yyyy'), 'Majestic Manor', 312, 257, 197, 998, 472);
commit;
prompt 300 records committed...
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-11-2025', 'dd-mm-yyyy'), 'Dreamy Manor', 313, 523, 248, 505, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-09-2027', 'dd-mm-yyyy'), 'Elite Mansion', 314, 573, 353, 903, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 'Emerald Manor', 315, 539, 432, 714, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-05-2028', 'dd-mm-yyyy'), 'Celestial Terra', 316, 592, 235, 944, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-09-2027', 'dd-mm-yyyy'), 'Regal Ballroom', 317, 527, 112, 519, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-06-2025', 'dd-mm-yyyy'), 'Whispering Gard', 318, 250, 287, 158, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-12-2024', 'dd-mm-yyyy'), 'Cherished Garde', 319, 272, 318, 860, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('09-12-2024', 'dd-mm-yyyy'), 'Whispering Gard', 320, 363, 247, 222, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-09-2024', 'dd-mm-yyyy'), 'Heavenly Terrac', 321, 406, 320, 240, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-02-2026', 'dd-mm-yyyy'), 'Ruby Gardens', 322, 221, 196, 708, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-06-2026', 'dd-mm-yyyy'), 'Moonbeam Hall', 323, 460, 188, 240, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('20-12-2028', 'dd-mm-yyyy'), 'Royal Garden Ha', 324, 341, 70, 662, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('22-05-2026', 'dd-mm-yyyy'), 'Victory Pavilio', 325, 452, 212, 339, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-11-2025', 'dd-mm-yyyy'), 'Ethereal Ballro', 326, 383, 327, 24, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-08-2025', 'dd-mm-yyyy'), 'Aurora Ballroom', 327, 405, 65, 614, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 'Gilded Palace', 328, 507, 131, 922, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-12-2021', 'dd-mm-yyyy'), 'Regal Ballroom', 329, 347, 206, 372, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('03-10-2026', 'dd-mm-yyyy'), 'Radiant Hall', 330, 307, 396, 229, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-11-2020', 'dd-mm-yyyy'), 'Tranquil Garden', 331, 337, 58, 530, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-05-2026', 'dd-mm-yyyy'), 'Sunset Ballroom', 332, 241, 103, 628, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-02-2022', 'dd-mm-yyyy'), 'Moonbeam Hall', 333, 445, 152, 694, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-12-2025', 'dd-mm-yyyy'), 'Tranquil Garden', 334, 379, 170, 339, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-04-2028', 'dd-mm-yyyy'), 'Luxury Pavilion', 335, 323, 414, 704, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-11-2028', 'dd-mm-yyyy'), 'Enchanted Garde', 336, 311, 406, 671, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-05-2025', 'dd-mm-yyyy'), 'Enchanted Garde', 337, 431, 26, 658, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-11-2028', 'dd-mm-yyyy'), 'Harmony Hall', 338, 486, 218, 881, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 'Heavenly Terrac', 339, 241, 381, 153, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-09-2027', 'dd-mm-yyyy'), 'Ruby Gardens', 340, 592, 449, 153, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-11-2023', 'dd-mm-yyyy'), 'Grand Oasis Hal', 341, 268, 421, 344, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('27-01-2020', 'dd-mm-yyyy'), 'Emerald Manor', 342, 464, 393, 313, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-10-2022', 'dd-mm-yyyy'), 'Exquisite Pavil', 343, 496, 383, 712, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-06-2028', 'dd-mm-yyyy'), 'Tranquil Garden', 344, 384, 230, 814, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-09-2024', 'dd-mm-yyyy'), 'Ruby Gardens', 347, 474, 425, 331, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-01-2025', 'dd-mm-yyyy'), 'Golden Plaza', 348, 289, 326, 149, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('29-07-2020', 'dd-mm-yyyy'), 'Sapphire Hall', 349, 210, 135, 712, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('30-06-2026', 'dd-mm-yyyy'), 'Aurora Ballroom', 350, 229, 280, 430, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-03-2021', 'dd-mm-yyyy'), 'Sapphire Hall', 351, 206, 359, 578, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-03-2021', 'dd-mm-yyyy'), 'Diamond Palace', 352, 292, 368, 443, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-02-2025', 'dd-mm-yyyy'), 'Exquisite Pavil', 353, 453, 345, 925, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-05-2021', 'dd-mm-yyyy'), 'Serene Pavilion', 354, 452, 351, 221, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-12-2028', 'dd-mm-yyyy'), 'Topaz Terrace', 356, 412, 238, 211, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-02-2023', 'dd-mm-yyyy'), 'Platinum Plaza', 357, 364, 138, 856, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-08-2020', 'dd-mm-yyyy'), 'Regal Ballroom', 358, 502, 239, 409, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-12-2022', 'dd-mm-yyyy'), 'Emerald Manor', 359, 288, 343, 232, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-11-2024', 'dd-mm-yyyy'), 'Aurora Ballroom', 360, 369, 280, 232, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('10-10-2025', 'dd-mm-yyyy'), 'Eclipse Ballroo', 361, 281, 211, 877, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('21-12-2025', 'dd-mm-yyyy'), 'Breathtaking Te', 362, 352, 248, 627, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('05-07-2021', 'dd-mm-yyyy'), 'Tranquil Garden', 363, 569, 438, 947, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('13-09-2028', 'dd-mm-yyyy'), 'Silver Springs ', 364, 437, 27, 652, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-01-2022', 'dd-mm-yyyy'), 'Radiant Hall', 365, 426, 70, 570, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 'Ethereal Ballro', 366, 436, 310, 369, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-11-2025', 'dd-mm-yyyy'), 'Ethereal Ballro', 367, 574, 34, 655, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('28-12-2028', 'dd-mm-yyyy'), 'Crystal Ballroo', 368, 531, 60, 606, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-03-2023', 'dd-mm-yyyy'), 'Dreamy Manor', 369, 237, 297, 449, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-11-2025', 'dd-mm-yyyy'), 'Whispering Gard', 370, 562, 226, 124, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-10-2026', 'dd-mm-yyyy'), 'Blissful Palace', 371, 380, 264, 685, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 'Sapphire Hall', 372, 277, 434, 505, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-05-2021', 'dd-mm-yyyy'), 'Onyx Mansion', 373, 410, 179, 381, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-11-2020', 'dd-mm-yyyy'), 'Sunset Ballroom', 374, 238, 159, 473, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('12-07-2028', 'dd-mm-yyyy'), 'Harmony Hall', 375, 475, 278, 768, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('15-10-2026', 'dd-mm-yyyy'), 'Royal Garden Ha', 376, 539, 50, 335, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('26-12-2022', 'dd-mm-yyyy'), 'Mystic Terrace', 377, 553, 444, 333, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('22-09-2022', 'dd-mm-yyyy'), 'Noble Hall', 378, 306, 421, 56, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('22-04-2022', 'dd-mm-yyyy'), 'Gilded Palace', 379, 573, 411, 267, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('02-05-2021', 'dd-mm-yyyy'), 'Cherished Garde', 380, 543, 88, 200, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 'Glamorous Ballr', 381, 307, 239, 460, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 'Crystal Ballroo', 382, 303, 119, 727, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 'Royal Garden Ha', 383, 289, 60, 580, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('16-02-2027', 'dd-mm-yyyy'), 'Mystic Terrace', 384, 464, 365, 324, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-02-2021', 'dd-mm-yyyy'), 'Majestic Manor', 385, 253, 137, 956, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('24-05-2027', 'dd-mm-yyyy'), 'Serene Pavilion', 386, 435, 236, 153, 163);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('18-07-2024', 'dd-mm-yyyy'), 'Dazzle Pavilion', 387, 469, 81, 154, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('08-06-2026', 'dd-mm-yyyy'), 'Glamorous Ballr', 388, 231, 44, 697, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 'Harmony Hall', 389, 246, 72, 33, 799);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('14-05-2022', 'dd-mm-yyyy'), 'Onyx Mansion', 391, 424, 261, 20, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 'Elite Mansion', 393, 488, 165, 381, 472);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('04-06-2025', 'dd-mm-yyyy'), 'Royal Garden Ha', 394, 506, 381, 98, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-04-2023', 'dd-mm-yyyy'), 'Breathtaking Te', 395, 489, 70, 623, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 'Silver Springs ', 396, 239, 149, 449, 839);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('17-07-2024', 'dd-mm-yyyy'), 'Ethereal Ballro', 397, 400, 322, 181, 130);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('07-08-2020', 'dd-mm-yyyy'), 'Emerald Manor', 398, 428, 95, 679, 968);
insert into EVENT (event_date, location, event_id, producer_id, singer_id, cid, pid)
values (to_date('25-11-2025', 'dd-mm-yyyy'), 'Radiant Hall', 399, 554, 250, 416, 968);
commit;
prompt 382 records loaded
prompt Loading INSTRUMENT...
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Pan Flute', 822, 1);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Djembe', 808, 2);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Didgeridoo', 597, 3);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Banjo', 720, 4);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 679, 5);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Flute', 865, 6);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 845, 7);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Ukulele', 614, 8);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Banjo', 942, 9);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Balalaika', 820, 10);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Zither', 826, 11);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Clarinet', 610, 12);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Bandoneon', 933, 13);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Recorder', 721, 14);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Marimba', 830, 15);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Triangle', 553, 16);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Electric Guitar', 751, 17);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Kazoo', 748, 18);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Trombone', 732, 19);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Double Bass', 719, 20);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Balalaika', 584, 21);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Drum', 693, 22);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Cello', 576, 23);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Vuvuzela', 938, 24);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 815, 25);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Sitar', 980, 26);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Accordion', 943, 27);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Guitar', 751, 28);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 898, 29);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Pan Flute', 704, 30);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 595, 31);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 595, 32);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Vuvuzela', 528, 33);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Synthesizer', 716, 34);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Triangle', 910, 35);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 526, 36);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Oboe', 582, 37);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tambourine', 725, 38);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 583, 39);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Lyre', 959, 40);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Harmonica', 841, 41);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Lute', 941, 42);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Clarinet', 626, 43);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Djembe', 954, 44);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 502, 45);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Violin', 743, 46);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Cello', 637, 47);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Bassoon', 527, 48);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piccolo', 968, 49);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Drum', 887, 50);
commit;
prompt 50 records loaded
prompt Loading INSTRUMENT_EVENT...
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 1);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 2);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 16);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 69);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 90);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 163);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 185);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 238);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 289);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 303);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (1, 382);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 1);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 21);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 24);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 50);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 109);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 158);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 195);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 205);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 224);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 313);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 315);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 335);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 348);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (2, 375);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 66);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 80);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 97);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 108);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 233);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 244);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 313);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (3, 342);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 11);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 44);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 60);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 82);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 94);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 125);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 325);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 362);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (4, 378);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 39);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 98);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 189);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 225);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 272);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (5, 397);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 22);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 135);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 137);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 168);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 196);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 273);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 277);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 350);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 371);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 391);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (6, 398);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (7, 93);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (7, 108);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (7, 157);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (7, 191);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (8, 85);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (8, 103);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (8, 326);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (8, 335);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (8, 389);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 10);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 29);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 37);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 60);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 90);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 94);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 224);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 306);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 373);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (9, 377);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (10, 44);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (10, 212);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (10, 258);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (10, 276);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (10, 391);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 29);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 62);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 78);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 95);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 167);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 299);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 391);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (11, 397);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 40);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 98);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 168);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 224);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 232);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 342);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (12, 384);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 23);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 85);
commit;
prompt 100 records committed...
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 225);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 259);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 272);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (13, 336);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 39);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 52);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 189);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 191);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 223);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 242);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 266);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 298);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 304);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 320);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (14, 364);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 1);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 24);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 93);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 120);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 133);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 166);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 196);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 197);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 230);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 304);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (15, 357);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 4);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 6);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 8);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 10);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 94);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 184);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 280);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 302);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 318);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 319);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 329);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (16, 333);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 8);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 48);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 108);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 155);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 180);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 317);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 333);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (17, 394);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (18, 51);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (18, 195);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (18, 257);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (18, 383);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 17);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 84);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 149);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 169);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 195);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 248);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 267);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (19, 274);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 45);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 46);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 121);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 126);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 128);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 181);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 211);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 212);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 292);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 295);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (20, 363);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 31);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 37);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 90);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 107);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 185);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 219);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (21, 268);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 54);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 115);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 135);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 161);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 165);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 189);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 374);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 386);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (22, 394);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (23, 129);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (23, 171);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (23, 364);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (23, 365);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 68);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 105);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 163);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 182);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 196);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 219);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 237);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 344);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (24, 373);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 25);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 76);
commit;
prompt 200 records committed...
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 126);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 171);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 210);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 226);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 234);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 240);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (25, 340);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 37);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 67);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 88);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 130);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 133);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 335);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 363);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 365);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (26, 382);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 69);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 107);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 128);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 133);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 272);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 282);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 292);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 295);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 299);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 309);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 313);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 340);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 364);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 375);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (27, 396);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (28, 4);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (28, 39);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (28, 217);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (28, 225);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (28, 379);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (29, 59);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (29, 81);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (29, 299);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (29, 366);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (30, 61);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (30, 107);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (30, 253);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (31, 109);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (31, 113);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (31, 135);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (31, 168);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (31, 395);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 54);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 56);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 72);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 130);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 145);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 194);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 197);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 274);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 323);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (32, 330);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 68);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 115);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 137);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 223);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 283);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 301);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (33, 322);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 85);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 86);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 142);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 157);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 221);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (34, 316);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 170);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 176);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 225);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 325);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 336);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 381);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (35, 388);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 37);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 75);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 95);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 122);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 167);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 169);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 251);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 341);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (36, 367);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 16);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 31);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 55);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 72);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 80);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 257);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (37, 335);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 4);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 82);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 108);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 125);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 137);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 143);
commit;
prompt 300 records committed...
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 163);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 238);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (38, 255);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 20);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 32);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 100);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 257);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 281);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 320);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 327);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (39, 362);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 91);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 99);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 176);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 246);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 259);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 286);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (40, 375);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 19);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 167);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 204);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 239);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 289);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (41, 341);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 60);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 70);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 148);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 233);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 354);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (42, 397);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 5);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 8);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 19);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 34);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 87);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 125);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 154);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 210);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 286);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (43, 353);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 27);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 173);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 207);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 271);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 296);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 299);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (44, 344);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 8);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 25);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 100);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 127);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 329);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (45, 350);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 10);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 56);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 151);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 157);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 171);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 194);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 223);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 309);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 318);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (46, 325);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 109);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 161);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 243);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 251);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 299);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (47, 335);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (48, 126);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (48, 159);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (48, 285);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (48, 319);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (48, 358);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 11);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 187);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 205);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 249);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 383);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (49, 399);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 29);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 61);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 129);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 147);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 318);
insert into INSTRUMENT_EVENT (instrument_id, event_id)
values (50, 348);
commit;
prompt 386 records loaded
prompt Loading ORDERS...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (439, to_date('09-10-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 619, 292, 54, 525);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (901, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 102, 87, 357, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (631, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), 109, 296, 497, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (476, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), 109, 947, 77, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (214, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 956, 89, 63, 815);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (999, to_date('14-05-2023', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 446, 18, 23, 354);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (506, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 106, 98, 907, 149, 150);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (853, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 106, 414, 808, 111, 932);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (937, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 106, 80, 572, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (173, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 104, 61, 985, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (283, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'), 102, 914, 85, 167, 688);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (271, to_date('18-06-2023', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 104, 135, 964, 38, 304);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (355, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 102, 853, 565, 185, 387);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (97, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('14-02-2023', 'dd-mm-yyyy'), 104, 675, 395, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (560, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 101, 853, 316, 185, 513);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (278, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('09-04-2022', 'dd-mm-yyyy'), 110, 167, 854, 101, 160);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (546, to_date('09-04-2024', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 110, 137, 30, 146, 999);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (306, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 914, 740, 167, 404);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (353, to_date('15-02-2022', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 102, 806, 375, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (912, to_date('18-03-2023', 'dd-mm-yyyy'), to_date('12-06-2022', 'dd-mm-yyyy'), 104, 479, 872, 29, 564);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (629, to_date('03-05-2022', 'dd-mm-yyyy'), to_date('11-04-2023', 'dd-mm-yyyy'), 109, 553, 746, 182, 608);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (153, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('15-01-2022', 'dd-mm-yyyy'), 106, 1, 282, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (531, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 109, 879, 713, 169, 291);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (573, to_date('25-05-2022', 'dd-mm-yyyy'), to_date('24-03-2022', 'dd-mm-yyyy'), 110, 147, 567, 21, 895);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (737, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('13-02-2022', 'dd-mm-yyyy'), 101, 387, 865, 186, 624);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (674, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'), 101, 125, 486, 126, 565);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (996, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 110, 428, 236, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (706, to_date('27-01-2022', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 106, 761, 842, 181, 295);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (75, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('30-09-2022', 'dd-mm-yyyy'), 110, 947, 399, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (37, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 102, 211, 298, 91, 75);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (166, to_date('25-09-2022', 'dd-mm-yyyy'), to_date('28-10-2022', 'dd-mm-yyyy'), 102, 443, 495, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (314, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 106, 997, 935, 22, 340);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (947, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('05-03-2022', 'dd-mm-yyyy'), 101, 953, 52, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (776, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('04-08-2022', 'dd-mm-yyyy'), 104, 371, 303, 154, 437);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (985, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 102, 61, 415, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (963, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 109, 195, 588, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (523, to_date('09-02-2022', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 110, 468, 85, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (410, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 125, 949, 126, 777);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (0, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 102, 372, 317, 150, 651);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (558, to_date('17-04-2022', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 104, 10, 677, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (219, to_date('18-02-2024', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), 101, 979, 535, 96, 596);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (708, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('03-07-2022', 'dd-mm-yyyy'), 110, 501, 486, 162, 136);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (824, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 109, 853, 145, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (5, to_date('26-01-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 110, 263, 791, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (677, to_date('08-03-2022', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 104, 750, 9, 26, 114);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (663, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 110, 223, 218, 37, 8);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (481, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), 106, 848, 514, 183, 623);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (786, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 109, 533, 645, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (449, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 101, 155, 377, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (341, to_date('22-09-2022', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 101, 912, 786, 149, 416);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (857, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 102, 64, 484, 160, 591);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (254, to_date('18-05-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 106, 277, 656, 60, 622);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (799, to_date('30-07-2022', 'dd-mm-yyyy'), to_date('14-01-2022', 'dd-mm-yyyy'), 104, 647, 928, 64, 621);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (949, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'), 102, 936, 11, 130, 2);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (39, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('12-12-2022', 'dd-mm-yyyy'), 104, 769, 769, 54, 50);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (924, to_date('15-09-2022', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 102, 402, 234, 134, 309);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (740, to_date('10-09-2022', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 104, 937, 84, 197, 772);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (4, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'), 109, 847, 253, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (444, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 106, 446, 34, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (128, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('27-04-2022', 'dd-mm-yyyy'), 109, 747, 147, 160, 527);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (902, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), 110, 922, 633, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (367, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 106, 356, 316, 39, 938);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (782, to_date('22-01-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 102, 713, 844, 193, 412);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (260, to_date('08-03-2023', 'dd-mm-yyyy'), to_date('21-06-2022', 'dd-mm-yyyy'), 110, 680, 115, 161, 226);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (15, to_date('22-04-2024', 'dd-mm-yyyy'), to_date('14-10-2022', 'dd-mm-yyyy'), 109, 829, 675, 71, 186);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (475, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('11-02-2022', 'dd-mm-yyyy'), 104, 995, 12, 153, 732);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (855, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 109, 247, 70, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (116, to_date('02-08-2023', 'dd-mm-yyyy'), to_date('09-09-2022', 'dd-mm-yyyy'), 109, 501, 689, 162, 901);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (416, to_date('21-02-2023', 'dd-mm-yyyy'), to_date('17-01-2023', 'dd-mm-yyyy'), 109, 443, 755, 105, 907);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (990, to_date('17-02-2022', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), 106, 988, 299, 141, 441);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (218, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('25-12-2022', 'dd-mm-yyyy'), 106, 63, 523, 42, 193);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (251, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('15-03-2022', 'dd-mm-yyyy'), 110, 586, 839, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (265, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'), 106, 288, 316, 180, 736);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (417, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 106, 419, 927, 140, 593);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (33, to_date('05-04-2024', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 104, 211, 231, 91, 270);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (66, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 102, 555, 701, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (398, to_date('19-12-2022', 'dd-mm-yyyy'), to_date('14-12-2022', 'dd-mm-yyyy'), 104, 95, 635, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (819, to_date('19-08-2023', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 101, 269, 495, 154, 673);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (731, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('08-03-2023', 'dd-mm-yyyy'), 104, 372, 215, 150, 285);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (727, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('24-01-2022', 'dd-mm-yyyy'), 101, 416, 554, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (458, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('16-05-2022', 'dd-mm-yyyy'), 106, 308, 972, 168, 51);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (78, to_date('04-03-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'), 110, 513, 440, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (995, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 102, 750, 311, 26, 586);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (405, to_date('25-10-2022', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 101, 949, 360, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (979, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('20-10-2022', 'dd-mm-yyyy'), 109, 507, 97, 88, 562);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (263, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 104, 489, 565, 74, 221);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (768, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 102, 926, 293, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (160, to_date('30-05-2022', 'dd-mm-yyyy'), to_date('28-05-2022', 'dd-mm-yyyy'), 106, 394, 755, 75, 633);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (180, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 109, 870, 77, 74, 109);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (958, to_date('20-09-2022', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 109, 921, 599, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (231, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 102, 750, 839, 26, 219);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (38, to_date('12-04-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 101, 919, 919, 23, 324);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (107, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'), 102, 451, 434, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (903, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('07-07-2022', 'dd-mm-yyyy'), 102, 538, 469, 137, 315);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (894, to_date('23-05-2022', 'dd-mm-yyyy'), to_date('23-11-2022', 'dd-mm-yyyy'), 104, 859, 73, 198, 450);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (518, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('19-01-2022', 'dd-mm-yyyy'), 109, 112, 599, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (802, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('04-06-2022', 'dd-mm-yyyy'), 110, 246, 533, 132, 953);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (369, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('04-04-2022', 'dd-mm-yyyy'), 104, 321, 976, 166, 207);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (967, to_date('04-04-2022', 'dd-mm-yyyy'), to_date('24-08-2022', 'dd-mm-yyyy'), 101, 896, 99, 110, 235);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (725, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 101, 361, 618, null, null);
commit;
prompt 100 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (659, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('12-07-2022', 'dd-mm-yyyy'), 110, 573, 268, 95, 675);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (83, to_date('19-04-2024', 'dd-mm-yyyy'), to_date('11-12-2022', 'dd-mm-yyyy'), 101, 227, 660, 113, 402);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (211, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 101, 482, 764, 171, 384);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (918, to_date('08-08-2022', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 101, 994, 282, 173, 24);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (791, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 104, 275, 420, 113, 78);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (364, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('11-11-2022', 'dd-mm-yyyy'), 104, 195, 291, 198, 108);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (805, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('28-07-2022', 'dd-mm-yyyy'), 102, 460, 790, 131, 509);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (163, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 366, 469, 28, 568);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (932, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 106, 268, 224, 32, 355);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (653, to_date('30-08-2022', 'dd-mm-yyyy'), to_date('25-05-2022', 'dd-mm-yyyy'), 102, 671, 656, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (721, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 102, 9, 77, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (793, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('17-07-2022', 'dd-mm-yyyy'), 106, 19, 401, 55, 592);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (762, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 101, 499, 283, 177, 100);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (437, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 110, 88, 484, 24, 352);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (673, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 312, 508, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (627, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 106, 890, 659, 32, 159);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (139, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 104, 705, 480, 196, 710);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (833, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'), 109, 211, 152, 91, 344);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (597, to_date('14-05-2022', 'dd-mm-yyyy'), to_date('23-02-2022', 'dd-mm-yyyy'), 104, 438, 137, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (453, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'), 110, 425, 330, 128, 281);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (620, to_date('18-09-2022', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 102, 402, 523, 134, 542);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (689, to_date('11-09-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 109, 32, 533, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (64, to_date('12-03-2022', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'), 101, 223, 534, 37, 814);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (40, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('23-07-2022', 'dd-mm-yyyy'), 109, 280, 755, 114, 166);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (3, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'), 101, 769, 73, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (865, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 102, 867, 600, 176, 531);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (430, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 109, 63, 64, 42, 282);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (610, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'), 106, 761, 675, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (556, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 109, 489, 618, 74, 444);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (310, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('20-09-2022', 'dd-mm-yyyy'), 110, 308, 73, 168, 935);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (647, to_date('07-06-2022', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 102, 846, 527, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (886, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'), 102, 482, 292, 171, 408);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (602, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 106, 754, 139, 66, 524);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (119, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 104, 473, 352, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (888, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('19-03-2022', 'dd-mm-yyyy'), 106, 736, 70, 169, 775);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (693, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), 101, 268, 902, 32, 132);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (754, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 109, 87, 551, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (687, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'), 101, 13, 848, 119, 4);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (871, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('16-01-2023', 'dd-mm-yyyy'), 104, 562, 198, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (713, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('02-03-2023', 'dd-mm-yyyy'), 104, 553, 71, 182, 518);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (331, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 104, 329, 120, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (736, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('03-10-2022', 'dd-mm-yyyy'), 106, 437, 328, 100, 723);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (154, to_date('16-01-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), 106, 296, 117, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (709, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('01-01-2022', 'dd-mm-yyyy'), 106, 947, 352, 69, 685);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (998, to_date('05-07-2022', 'dd-mm-yyyy'), to_date('19-08-2022', 'dd-mm-yyyy'), 106, 956, 234, null, 99);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (36, to_date('22-05-2022', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'), 109, 320, 299, null, 101);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (31, to_date('22-05-2022', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'), 109, 320, 299, 150, 102);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (200, to_date('07-07-2024 00:06:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2024 00:06:17', 'dd-mm-yyyy hh24:mi:ss'), 116, 506, 575, null, 162);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (966, to_date('07-07-2024 00:09:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2024 00:09:06', 'dd-mm-yyyy hh24:mi:ss'), 116, 506, 575, 195, 655);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (329, to_date('07-07-2024 00:13:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2024 00:13:04', 'dd-mm-yyyy hh24:mi:ss'), 116, 506, 575, 100, 858);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (18, to_date('07-07-2024 00:15:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 00:15:24', 'dd-mm-yyyy hh24:mi:ss'), 116, 506, 575, 191, 213);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (496, to_date('07-07-2024 00:18:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 00:18:43', 'dd-mm-yyyy hh24:mi:ss'), 110, 284, 756, 179, 230);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (569, to_date('07-07-2024 00:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 00:49:16', 'dd-mm-yyyy hh24:mi:ss'), 110, 284, 756, 179, 85);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (880, to_date('07-07-2024 16:38:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2024 16:38:30', 'dd-mm-yyyy hh24:mi:ss'), 104, 340, 462, 34, 635);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (95, to_date('07-07-2024 16:38:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 16:38:37', 'dd-mm-yyyy hh24:mi:ss'), 113, 599, 341, 55, 770);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (421, to_date('07-07-2024 16:40:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2024 16:40:11', 'dd-mm-yyyy hh24:mi:ss'), 120, 219, 64, 200, 273);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (797, to_date('07-07-2024 16:40:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 16:40:32', 'dd-mm-yyyy hh24:mi:ss'), 123, 143, 162, 54, 676);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (373, to_date('07-07-2024 18:17:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2024 18:17:36', 'dd-mm-yyyy hh24:mi:ss'), 109, 937, 287, 200, 612);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (882, to_date('07-07-2024 18:21:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 18:21:48', 'dd-mm-yyyy hh24:mi:ss'), 117, 280, 959, 116, 515);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (401, to_date('07-07-2024 18:24:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2024 18:24:37', 'dd-mm-yyyy hh24:mi:ss'), 117, 280, 959, 144, 302);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (954, to_date('07-07-2024 18:26:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-07-2024 18:26:04', 'dd-mm-yyyy hh24:mi:ss'), 117, 102, 959, 144, 431);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (634, to_date('07-07-2024 18:36:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-07-2024 18:36:09', 'dd-mm-yyyy hh24:mi:ss'), 109, 451, 108, 163, 385);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (654, to_date('07-07-2024 18:42:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 18:42:22', 'dd-mm-yyyy hh24:mi:ss'), 106, 280, 138, 190, 962);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (636, to_date('07-07-2024 18:47:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2024 18:47:18', 'dd-mm-yyyy hh24:mi:ss'), 122, 617, 389, 198, 748);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (550, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 102, 956, 635, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (255, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 102, 395, 270, 34, 316);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (641, to_date('09-10-2023', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 110, 713, 936, 193, 587);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (10, to_date('22-03-2022', 'dd-mm-yyyy'), to_date('13-01-2023', 'dd-mm-yyyy'), 106, 920, 842, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (321, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 106, 297, 487, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (389, to_date('23-01-2022', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 106, 620, 352, 22, 407);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (343, to_date('21-04-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 276, 389, 150, 816);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (818, to_date('10-07-2023', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 104, 50, 876, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (344, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('30-03-2022', 'dd-mm-yyyy'), 110, 626, 437, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (342, to_date('08-10-2022', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 104, 571, 900, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (835, to_date('24-06-2022', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 104, 320, 201, 153, 382);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (866, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 110, 529, 660, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (317, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 106, 886, 863, 35, 516);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (814, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('01-06-2022', 'dd-mm-yyyy'), 104, 333, 757, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (428, to_date('26-11-2022', 'dd-mm-yyyy'), to_date('04-03-2022', 'dd-mm-yyyy'), 109, 98, 104, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (223, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-04-2022', 'dd-mm-yyyy'), 102, 875, 320, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (242, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 102, 510, 849, 148, 579);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (537, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 101, 289, 18, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (120, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('12-08-2022', 'dd-mm-yyyy'), 106, 240, 599, 22, 492);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (622, to_date('22-10-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 197, 797, 123, 973);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (761, to_date('24-01-2023', 'dd-mm-yyyy'), to_date('05-10-2022', 'dd-mm-yyyy'), 101, 847, 828, 117, 836);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (748, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 110, 875, 29, 157, 191);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (326, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('05-04-2022', 'dd-mm-yyyy'), 106, 134, 889, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (590, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('13-01-2022', 'dd-mm-yyyy'), 110, 58, 528, 111, 914);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (468, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('16-07-2022', 'dd-mm-yyyy'), 106, 73, 234, 62, 991);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (931, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'), 101, 137, 482, 146, 87);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (386, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('26-04-2022', 'dd-mm-yyyy'), 109, 894, 377, 56, 296);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (502, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'), 102, 675, 746, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (601, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 101, 277, 352, 60, 318);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (650, to_date('09-02-2024', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 101, 32, 428, 62, 279);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (757, to_date('08-05-2022', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), 101, 416, 316, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (541, to_date('04-03-2022', 'dd-mm-yyyy'), to_date('04-09-2022', 'dd-mm-yyyy'), 106, 213, 218, 30, 957);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (842, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 109, 384, 484, 179, 929);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (699, to_date('19-02-2022', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 104, 312, 5, 113, 599);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (494, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 106, 215, 462, 94, 62);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (652, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 109, 57, 857, null, null);
commit;
prompt 200 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (397, to_date('05-03-2022', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 106, 288, 311, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (788, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('12-03-2022', 'dd-mm-yyyy'), 102, 685, 879, 67, 428);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (555, to_date('24-06-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 102, 256, 508, 160, 639);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (515, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 110, 818, 389, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (413, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 102, 366, 41, 28, 268);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (563, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 102, 995, 224, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (148, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 101, 396, 256, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (836, to_date('27-04-2023', 'dd-mm-yyyy'), to_date('02-06-2022', 'dd-mm-yyyy'), 110, 195, 414, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (472, to_date('21-01-2022', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'), 110, 853, 287, 185, 47);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (183, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 110, 979, 749, 96, 305);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (26, to_date('25-02-2024', 'dd-mm-yyyy'), to_date('15-03-2024', 'dd-mm-yyyy'), 102, 596, 557, 63, 292);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (548, to_date('07-02-2022', 'dd-mm-yyyy'), to_date('21-10-2022', 'dd-mm-yyyy'), 101, 771, 675, 47, 229);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (186, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 101, 47, 972, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (562, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 101, 459, 374, 184, 307);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (313, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('22-01-2022', 'dd-mm-yyyy'), 101, 680, 486, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (358, to_date('20-07-2022', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 109, 371, 377, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (337, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'), 101, 898, 689, 188, 351);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (643, to_date('15-04-2023', 'dd-mm-yyyy'), to_date('10-08-2022', 'dd-mm-yyyy'), 101, 80, 780, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (806, to_date('29-01-2023', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 104, 914, 38, 167, 172);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (275, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('10-03-2022', 'dd-mm-yyyy'), 101, 853, 318, 185, 800);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (815, to_date('16-05-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 104, 510, 328, 148, 379);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (870, to_date('29-04-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 104, 153, 342, 117, 308);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (424, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 106, 297, 487, 71, 74);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (205, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 101, 215, 346, 94, 822);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (482, to_date('15-02-2024', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 110, 602, 757, 125, 52);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (432, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 106, 950, 858, 120, 164);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (981, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('24-12-2022', 'dd-mm-yyyy'), 101, 269, 879, 154, 392);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (361, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 17, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (339, to_date('31-08-2022', 'dd-mm-yyyy'), to_date('27-03-2022', 'dd-mm-yyyy'), 109, 416, 740, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (266, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'), 104, 143, 367, 48, 425);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (35, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 102, 227, 617, 113, 417);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (287, to_date('02-01-2022', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'), 104, 384, 484, 179, 272);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (431, to_date('26-04-2022', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 104, 635, 26, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (868, to_date('17-02-2024', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 102, 997, 390, 22, 919);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (625, to_date('24-10-2022', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 110, 167, 156, 101, 640);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (703, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 110, 416, 195, 116, 510);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (717, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 102, 424, 858, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (513, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 104, 169, 177, 112, 59);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (393, to_date('23-11-2022', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 106, 747, 408, 160, 138);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (315, to_date('15-03-2024', 'dd-mm-yyyy'), to_date('25-04-2022', 'dd-mm-yyyy'), 106, 373, 352, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (885, to_date('02-06-2022', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 104, 565, 595, 70, 523);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (915, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('18-08-2022', 'dd-mm-yyyy'), 102, 90, 281, 141, 338);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (234, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 110, 806, 916, 74, 151);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (448, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 109, 14, 91, 93, 13);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (400, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('15-06-2022', 'dd-mm-yyyy'), 104, 947, 26, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (46, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('26-03-2022', 'dd-mm-yyyy'), 109, 82, 955, 115, 707);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (20, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 101, 576, 618, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (742, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'), 110, 210, 378, 102, 288);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (285, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('24-04-2022', 'dd-mm-yyyy'), 104, 890, 1, 32, 90);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (658, to_date('24-04-2024', 'dd-mm-yyyy'), to_date('01-02-2023', 'dd-mm-yyyy'), 110, 717, 955, 112, 477);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (561, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 104, 921, 955, 110, 11);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (232, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('18-04-2023', 'dd-mm-yyyy'), 102, 944, 772, 21, 923);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (514, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('22-02-2022', 'dd-mm-yyyy'), 106, 372, 367, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (951, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('23-06-2022', 'dd-mm-yyyy'), 104, 525, 780, 37, 12);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (773, to_date('02-07-2022', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 102, 937, 889, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (480, to_date('11-05-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 109, 446, 571, 23, 756);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (959, to_date('22-06-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 104, 928, 536, 93, 182);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (147, to_date('25-02-2022', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 109, 263, 270, 88, 419);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (763, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 109, 263, 632, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (298, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), 104, 211, 73, 91, 115);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (864, to_date('30-12-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 106, 680, 269, 161, 227);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (189, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'), 106, 302, 749, 31, 204);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (978, to_date('01-04-2022', 'dd-mm-yyyy'), to_date('26-05-2022', 'dd-mm-yyyy'), 106, 544, 872, 76, 36);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (779, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('03-03-2022', 'dd-mm-yyyy'), 110, 818, 14, 191, 977);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (404, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('21-04-2023', 'dd-mm-yyyy'), 101, 266, 481, 34, 619);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (290, to_date('15-07-2022', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 110, 125, 491, 126, 614);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (598, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('20-03-2022', 'dd-mm-yyyy'), 104, 538, 85, 137, 720);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (47, to_date('31-03-2024', 'dd-mm-yyyy'), to_date('15-02-2022', 'dd-mm-yyyy'), 101, 959, 743, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (425, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 101, 629, 166, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (750, to_date('01-06-2022', 'dd-mm-yyyy'), to_date('25-06-2022', 'dd-mm-yyyy'), 101, 167, 759, 101, 202);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (720, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), 106, 806, 620, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (134, to_date('17-06-2022', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'), 109, 508, 395, 123, 0);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (456, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('03-06-2022', 'dd-mm-yyyy'), 104, 371, 678, 154, 435);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (495, to_date('10-04-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 102, 64, 5, 160, 287);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (956, to_date('30-03-2023', 'dd-mm-yyyy'), to_date('25-10-2022', 'dd-mm-yyyy'), 101, 482, 622, 171, 825);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (770, to_date('30-03-2022', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 106, 246, 71, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (686, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('04-12-2022', 'dd-mm-yyyy'), 102, 95, 777, 102, 882);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (104, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('28-02-2022', 'dd-mm-yyyy'), 110, 952, 895, 189, 994);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (338, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 106, 352, 491, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (738, to_date('24-11-2022', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 104, 532, 508, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (972, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('04-02-2022', 'dd-mm-yyyy'), 109, 756, 256, 145, 181);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (778, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 110, 541, 341, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (268, to_date('31-07-2022', 'dd-mm-yyyy'), to_date('20-04-2022', 'dd-mm-yyyy'), 106, 210, 495, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (21, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 102, 665, 256, 57, 427);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (530, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 101, 936, 17, 130, 789);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (606, to_date('31-08-2023', 'dd-mm-yyyy'), to_date('04-03-2022', 'dd-mm-yyyy'), 110, 647, 791, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (443, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 102, 959, 649, 34, 414);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (170, to_date('14-12-2022', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), 106, 39, 895, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (994, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('26-11-2022', 'dd-mm-yyyy'), 106, 453, 738, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (460, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), 104, 88, 292, 24, 880);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (76, to_date('22-06-2023', 'dd-mm-yyyy'), to_date('16-03-2022', 'dd-mm-yyyy'), 102, 226, 63, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (62, to_date('14-04-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 110, 980, 754, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (567, to_date('05-09-2022', 'dd-mm-yyyy'), to_date('22-07-2022', 'dd-mm-yyyy'), 104, 247, 119, 167, 578);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (70, to_date('23-10-2022', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), 102, 437, 32, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (942, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 101, 894, 994, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (715, to_date('05-12-2022', 'dd-mm-yyyy'), to_date('10-12-2022', 'dd-mm-yyyy'), 101, 275, 503, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (267, to_date('18-10-2022', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'), 104, 161, 806, 108, 841);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (872, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 102, 19, 586, 55, 689);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (934, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 110, 416, 66, 116, 928);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (379, to_date('11-07-2023', 'dd-mm-yyyy'), to_date('25-02-2022', 'dd-mm-yyyy'), 102, 292, 732, null, null);
commit;
prompt 300 records committed...
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (507, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 109, 955, 367, 174, 894);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (614, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('15-11-2022', 'dd-mm-yyyy'), 110, 456, 99, 21, 453);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (810, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('10-10-2022', 'dd-mm-yyyy'), 101, 84, 63, 75, 261);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (426, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('12-01-2022', 'dd-mm-yyyy'), 102, 13, 797, 119, 173);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (29, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'), 109, 980, 848, 89, 117);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (382, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('31-03-2022', 'dd-mm-yyyy'), 109, 67, 330, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (42, to_date('27-07-2022', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 110, 642, 293, 180, 188);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (374, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 109, 321, 701, 166, 359);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (114, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('13-08-2022', 'dd-mm-yyyy'), 106, 528, 167, 68, 833);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (399, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('08-08-2022', 'dd-mm-yyyy'), 110, 914, 201, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (993, to_date('16-03-2022', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 102, 446, 617, 23, 388);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (572, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('05-06-2022', 'dd-mm-yyyy'), 109, 247, 352, 167, 234);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (488, to_date('17-05-2024', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 102, 482, 586, 171, 269);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (796, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 110, 397, 382, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (176, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 101, 280, 909, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (867, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('08-05-2022', 'dd-mm-yyyy'), 110, 647, 797, 64, 458);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (691, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('30-07-2022', 'dd-mm-yyyy'), 109, 437, 29, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (307, to_date('07-07-2022', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 106, 197, 26, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (838, to_date('28-08-2023', 'dd-mm-yyyy'), to_date('11-08-2022', 'dd-mm-yyyy'), 110, 823, 566, 55, 415);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (179, to_date('27-09-2022', 'dd-mm-yyyy'), to_date('19-11-2022', 'dd-mm-yyyy'), 102, 457, 147, 32, 413);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (887, to_date('26-10-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 106, 769, 645, 54, 199);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (512, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('23-09-2022', 'dd-mm-yyyy'), 106, 277, 796, 60, 345);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (723, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 104, 174, 32, 96, 670);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (536, to_date('25-12-2022', 'dd-mm-yyyy'), to_date('06-05-2022', 'dd-mm-yyyy'), 109, 617, 311, 192, 194);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (589, to_date('31-01-2023', 'dd-mm-yyyy'), to_date('29-08-2022', 'dd-mm-yyyy'), 109, 134, 415, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (638, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), 110, 736, 844, 169, 737);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (466, to_date('23-03-2022', 'dd-mm-yyyy'), to_date('09-08-2022', 'dd-mm-yyyy'), 109, 466, 565, 48, 867);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (156, to_date('05-04-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 101, 438, 846, 46, 540);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (324, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), 109, 49, 551, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (419, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('02-04-2022', 'dd-mm-yyyy'), 110, 453, 769, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (789, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), 101, 329, 415, 141, 601);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (661, to_date('21-01-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 101, 280, 993, 114, 503);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (975, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 109, 640, 765, 30, 5);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (710, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 106, 369, 959, 200, 451);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (499, to_date('04-05-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 104, 761, 945, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (587, to_date('28-10-2022', 'dd-mm-yyyy'), to_date('03-04-2022', 'dd-mm-yyyy'), 106, 369, 139, 200, 383);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (946, to_date('14-11-2022', 'dd-mm-yyyy'), to_date('08-02-2022', 'dd-mm-yyyy'), 106, 246, 551, 132, 464);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (406, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 102, 620, 586, 22, 476);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (303, to_date('27-04-2024', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 101, 383, 656, 101, 271);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (216, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 106, 204, 787, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (125, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 110, 944, 967, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (681, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('26-10-2022', 'dd-mm-yyyy'), 104, 147, 108, 21, 569);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (438, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'), 110, 268, 618, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (672, to_date('07-05-2022', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 102, 67, 751, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (540, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('11-09-2022', 'dd-mm-yyyy'), 104, 855, 405, 163, 103);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (106, to_date('27-02-2024', 'dd-mm-yyyy'), to_date('14-02-2022', 'dd-mm-yyyy'), 109, 928, 618, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (624, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('07-03-2022', 'dd-mm-yyyy'), 109, 80, 434, null, null);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (615, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('15-12-2022', 'dd-mm-yyyy'), 104, 371, 53, 154, 634);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (675, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'), 101, 693, 302, 149, 28);
insert into ORDERS (oid, orderdate, returndate, eid, did, cid, salary, pid)
values (728, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 104, 396, 535, 36, 715);
commit;
prompt 350 records loaded
prompt Loading LAUNDRY...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (315, 215, 'Universal Solut', to_date('29-04-2022', 'dd-mm-yyyy'), 26);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (13, 255, 'Texas Residenti', to_date('19-03-2024', 'dd-mm-yyyy'), 449);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (64, 73, 'Tropical Oasis', to_date('10-03-2022', 'dd-mm-yyyy'), 799);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (247, 83, 'Joe Lombardo Pl', to_date('02-06-2022', 'dd-mm-yyyy'), 835);
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
values (603, 289, 'Liners Direct', to_date('21-04-2024', 'dd-mm-yyyy'), 283);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (53, 343, 'Jewett-Cameron ', to_date('20-12-2023', 'dd-mm-yyyy'), 727);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (175, 165, 'StoneTech Profe', to_date('03-07-2023', 'dd-mm-yyyy'), 806);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (947, 330, 'Teamstudio', to_date('10-08-2023', 'dd-mm-yyyy'), 290);
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
values (905, 214, 'Microsoft Corp.', to_date('28-03-2022', 'dd-mm-yyyy'), 931);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (218, 82, 'Medical Action ', to_date('07-04-2022', 'dd-mm-yyyy'), 530);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (31, 208, 'Technica', to_date('09-03-2023', 'dd-mm-yyyy'), 523);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (586, 316, 'Hi-Tech Pharmac', to_date('22-08-2022', 'dd-mm-yyyy'), 29);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (491, 78, 'Span-America Me', to_date('16-07-2023', 'dd-mm-yyyy'), 518);
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
values (198, 198, 'Dell Computer C', to_date('14-05-2024', 'dd-mm-yyyy'), 0);
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
values (102, 230, 'Mars Inc.', to_date('29-10-2023', 'dd-mm-yyyy'), 672);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (38, 277, 'American Land L', to_date('19-01-2023', 'dd-mm-yyyy'), 260);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (382, 138, 'Direct Data', to_date('18-12-2023', 'dd-mm-yyyy'), 814);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (156, 220, 'Electrical Solu', to_date('14-01-2024', 'dd-mm-yyyy'), 344);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (474, 159, 'Capital Crossin', to_date('23-10-2023', 'dd-mm-yyyy'), 355);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (311, 78, 'Blue Pumpkin So', to_date('01-09-2023', 'dd-mm-yyyy'), 819);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (719, 299, 'Alternative Tec', to_date('01-04-2024', 'dd-mm-yyyy'), 251);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (631, 137, 'SALT Group', to_date('07-12-2022', 'dd-mm-yyyy'), 754);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (25, 182, 'Microsoft Corp.', to_date('17-07-2023', 'dd-mm-yyyy'), 567);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (872, 329, 'esoftsolutions', to_date('24-01-2023', 'dd-mm-yyyy'), 738);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (820, 304, 'Anheuser-Busch ', to_date('07-04-2022', 'dd-mm-yyyy'), 39);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (606, 256, 'Amerisource Fun', to_date('27-01-2022', 'dd-mm-yyyy'), 15);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (42, 325, 'Sterling Financ', to_date('30-05-2024', 'dd-mm-yyyy'), 537);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (400, 67, 'Biosite', to_date('22-07-2022', 'dd-mm-yyyy'), 148);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (1, 247, 'Mindworks', to_date('18-11-2023', 'dd-mm-yyyy'), 271);
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
values (238, 52, 'MindIQ', to_date('03-09-2023', 'dd-mm-yyyy'), 946);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (933, 90, 'SPS Commerce', to_date('12-12-2022', 'dd-mm-yyyy'), 331);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (240, 50, 'Analytics Opera', to_date('10-01-2022', 'dd-mm-yyyy'), 358);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (266, 94, 'Auction Systems', to_date('13-04-2024', 'dd-mm-yyyy'), 885);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (283, 129, 'PrivateBancorp', to_date('10-05-2022', 'dd-mm-yyyy'), 598);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (129, 219, 'Heritage Microf', to_date('02-08-2022', 'dd-mm-yyyy'), 419);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (17, 140, 'Alogent', to_date('22-04-2022', 'dd-mm-yyyy'), 614);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (597, 325, 'Brandt Informat', to_date('02-10-2023', 'dd-mm-yyyy'), 231);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (775, 147, 'Great Lakes Med', to_date('25-01-2022', 'dd-mm-yyyy'), 842);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (364, 217, 'ZonePerfect Nut', to_date('26-01-2023', 'dd-mm-yyyy'), 389);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (871, 178, 'ASAP Staffing', to_date('21-01-2023', 'dd-mm-yyyy'), 180);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (456, 119, 'U.S. Energy Ser', to_date('23-01-2023', 'dd-mm-yyyy'), 70);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (200, 213, 'First American ', to_date('06-08-2023', 'dd-mm-yyyy'), 353);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (322, 237, 'Marlabs', to_date('13-04-2022', 'dd-mm-yyyy'), 934);
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
values (617, 198, 'Prometheus Labo', to_date('15-09-2022', 'dd-mm-yyyy'), 97);
commit;
prompt 100 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (15, 204, 'Viacom', to_date('28-07-2023', 'dd-mm-yyyy'), 652);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (668, 129, 'Heartlab', to_date('28-05-2023', 'dd-mm-yyyy'), 405);
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
values (647, 202, 'Bristol-Myers S', to_date('13-01-2022', 'dd-mm-yyyy'), 786);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (179, 120, 'Freedom Medical', to_date('12-02-2022', 'dd-mm-yyyy'), 120);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (856, 139, 'Calence', to_date('28-12-2022', 'dd-mm-yyyy'), 658);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (502, 122, 'First Place Fin', to_date('11-08-2022', 'dd-mm-yyyy'), 514);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (406, 197, 'Business Plus C', to_date('16-12-2023', 'dd-mm-yyyy'), 147);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (812, 207, 'Hi-Tech Pharmac', to_date('01-04-2022', 'dd-mm-yyyy'), 448);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (317, 338, 'Professional Pl', to_date('03-06-2022', 'dd-mm-yyyy'), 641);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (3, 314, 'American Land L', to_date('28-10-2022', 'dd-mm-yyyy'), 650);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (807, 83, 'Data Company', to_date('17-01-2024', 'dd-mm-yyyy'), 643);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (890, 185, 'GDA Technologie', to_date('04-12-2022', 'dd-mm-yyyy'), 548);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (544, 179, 'Multimedia Live', to_date('01-06-2023', 'dd-mm-yyyy'), 789);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (62, 155, 'SBC Communicati', to_date('29-02-2024', 'dd-mm-yyyy'), 20);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (565, 231, 'ConAgra', to_date('19-01-2023', 'dd-mm-yyyy'), 951);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (704, 251, 'Portfolio Recov', to_date('19-05-2022', 'dd-mm-yyyy'), 918);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (104, 312, 'Noodles & Co.', to_date('29-03-2022', 'dd-mm-yyyy'), 661);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (239, 233, 'Homebuilders Fi', to_date('03-08-2023', 'dd-mm-yyyy'), 687);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (404, 173, 'Span-America Me', to_date('24-02-2023', 'dd-mm-yyyy'), 338);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (850, 248, 'Horizon Consult', to_date('29-03-2022', 'dd-mm-yyyy'), 275);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (18, 247, 'Quaker City Ban', to_date('31-05-2022', 'dd-mm-yyyy'), 66);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (63, 215, 'Freedom Medical', to_date('06-10-2023', 'dd-mm-yyyy'), 562);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (7, 156, 'Green Mountain ', to_date('29-06-2023', 'dd-mm-yyyy'), 219);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (965, 76, 'Hospital Soluti', to_date('21-09-2022', 'dd-mm-yyyy'), 762);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (85, 83, 'Digital Visual ', to_date('17-03-2023', 'dd-mm-yyyy'), 868);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (526, 190, 'Pulaski Financi', to_date('04-09-2022', 'dd-mm-yyyy'), 170);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (237, 192, 'Authoria', to_date('21-01-2024', 'dd-mm-yyyy'), 558);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (997, 248, 'Kimberly-Clark ', to_date('14-01-2024', 'dd-mm-yyyy'), 647);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (301, 134, 'Nature''s Cure', to_date('21-12-2023', 'dd-mm-yyyy'), 106);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (557, 337, 'Orange Glo Inte', to_date('02-02-2022', 'dd-mm-yyyy'), 871);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (599, 265, 'Kimberly-Clark ', to_date('18-07-2022', 'dd-mm-yyyy'), 894);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (593, 53, 'GDA Technologie', to_date('16-05-2024', 'dd-mm-yyyy'), 507);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (345, 56, 'Deutsche Teleko', to_date('29-08-2022', 'dd-mm-yyyy'), 425);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (902, 103, 'Atlantic.Net', to_date('10-01-2023', 'dd-mm-yyyy'), 606);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (503, 240, 'Joseph Sheairs ', to_date('17-06-2022', 'dd-mm-yyyy'), 782);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (469, 301, 'Ositis Software', to_date('21-03-2022', 'dd-mm-yyyy'), 482);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (478, 152, 'Open Software S', to_date('09-02-2022', 'dd-mm-yyyy'), 560);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (154, 184, 'Great Lakes Tec', to_date('29-03-2024', 'dd-mm-yyyy'), 602);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (444, 156, 'Imaging Busines', to_date('27-05-2022', 'dd-mm-yyyy'), 949);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (292, 127, 'Tigris Consulti', to_date('31-07-2022', 'dd-mm-yyyy'), 166);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (468, 148, 'Multimedia Live', to_date('21-09-2023', 'dd-mm-yyyy'), 481);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (899, 254, 'SCI', to_date('07-09-2022', 'dd-mm-yyyy'), 116);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (122, 266, 'Amerisource Fun', to_date('27-08-2023', 'dd-mm-yyyy'), 721);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (144, 120, 'Comm-Works', to_date('27-03-2024', 'dd-mm-yyyy'), 703);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (889, 219, 'Vivendi Univers', to_date('02-04-2022', 'dd-mm-yyyy'), 379);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (114, 340, 'VoiceLog', to_date('06-10-2023', 'dd-mm-yyyy'), 10);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (251, 152, 'Sterling Financ', to_date('23-07-2023', 'dd-mm-yyyy'), 985);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (711, 105, 'Eze Castle Soft', to_date('27-01-2024', 'dd-mm-yyyy'), 824);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (165, 104, 'Gillani', to_date('10-09-2022', 'dd-mm-yyyy'), 531);
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
values (208, 170, 'Home Depot', to_date('25-11-2023', 'dd-mm-yyyy'), 555);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (543, 256, 'Tilia', to_date('04-09-2022', 'dd-mm-yyyy'), 710);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (687, 298, 'Ogio Internatio', to_date('22-12-2022', 'dd-mm-yyyy'), 255);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (219, 238, 'Allegiant Banco', to_date('21-03-2022', 'dd-mm-yyyy'), 232);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (294, 254, 'Pragmatech Soft', to_date('18-04-2023', 'dd-mm-yyyy'), 691);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (169, 310, 'Synovis Life Te', to_date('26-04-2022', 'dd-mm-yyyy'), 254);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (316, 212, 'Advanced Techno', to_date('21-09-2023', 'dd-mm-yyyy'), 398);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (344, 183, 'Formatech', to_date('17-11-2023', 'dd-mm-yyyy'), 833);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (389, 348, 'Cardinal Cartri', to_date('26-01-2022', 'dd-mm-yyyy'), 33);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (293, 212, 'Cardinal Cartri', to_date('06-09-2023', 'dd-mm-yyyy'), 399);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (489, 79, 'Cynergy Data', to_date('20-06-2022', 'dd-mm-yyyy'), 723);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (125, 74, 'Conquest', to_date('06-06-2023', 'dd-mm-yyyy'), 979);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (252, 243, 'Contract Counse', to_date('04-01-2023', 'dd-mm-yyyy'), 937);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (229, 328, 'Elite Medical', to_date('21-03-2024', 'dd-mm-yyyy'), 546);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (55, 341, 'Navigator Syste', to_date('26-10-2023', 'dd-mm-yyyy'), 731);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (504, 96, 'Liners Direct', to_date('29-05-2024', 'dd-mm-yyyy'), 361);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (99, 120, 'Diageo', to_date('29-03-2022', 'dd-mm-yyyy'), 620);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (998, 89, 'Max & Erma''s Re', to_date('14-09-2023', 'dd-mm-yyyy'), 125);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (352, 134, 'Morgan Stanley ', to_date('29-01-2023', 'dd-mm-yyyy'), 4);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (713, 289, 'Bioanalytical S', to_date('06-01-2024', 'dd-mm-yyyy'), 887);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (935, 214, 'IPS Advisory', to_date('24-08-2023', 'dd-mm-yyyy'), 778);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (105, 89, 'GulfMark Offsho', to_date('13-06-2023', 'dd-mm-yyyy'), 104);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (455, 179, 'Walt Disney Co.', to_date('04-12-2022', 'dd-mm-yyyy'), 404);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (79, 170, 'Service Link', to_date('03-02-2022', 'dd-mm-yyyy'), 674);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (128, 266, 'SafeHome Securi', to_date('03-10-2022', 'dd-mm-yyyy'), 37);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (878, 242, 'MidAmerica Auto', to_date('15-01-2023', 'dd-mm-yyyy'), 590);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (726, 293, 'ProSys Informat', to_date('18-04-2024', 'dd-mm-yyyy'), 993);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (532, 179, 'Team', to_date('11-09-2023', 'dd-mm-yyyy'), 587);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (265, 232, 'Lydian Trust', to_date('21-01-2023', 'dd-mm-yyyy'), 981);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (901, 84, 'VoiceLog', to_date('27-02-2022', 'dd-mm-yyyy'), 205);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (45, 77, 'Caliber Collisi', to_date('17-05-2024', 'dd-mm-yyyy'), 460);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (94, 69, 'NLX', to_date('05-03-2024', 'dd-mm-yyyy'), 494);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (372, 237, 'Tarragon Realty', to_date('12-05-2023', 'dd-mm-yyyy'), 597);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (69, 271, 'McKee Wallwork ', to_date('18-07-2022', 'dd-mm-yyyy'), 382);
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
commit;
prompt 200 records committed...
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (862, 290, 'Medical Action ', to_date('12-03-2024', 'dd-mm-yyyy'), 708);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (43, 199, 'Ford Motor Co.', to_date('02-04-2023', 'dd-mm-yyyy'), 432);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (621, 214, 'Unit', to_date('12-10-2022', 'dd-mm-yyyy'), 139);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (669, 318, 'Data Company', to_date('01-11-2022', 'dd-mm-yyyy'), 488);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (402, 325, 'Tilson Landscap', to_date('24-07-2022', 'dd-mm-yyyy'), 757);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (211, 282, 'Loss Mitigation', to_date('25-07-2023', 'dd-mm-yyyy'), 788);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (506, 207, 'Dearborn Bancor', to_date('03-04-2022', 'dd-mm-yyyy'), 223);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (313, 68, 'Summit Energy', to_date('16-08-2023', 'dd-mm-yyyy'), 556);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (281, 209, 'Softworld', to_date('19-02-2023', 'dd-mm-yyyy'), 314);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (142, 173, 'Urstadt Biddle ', to_date('10-01-2022', 'dd-mm-yyyy'), 386);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (280, 138, 'Miller Systems', to_date('22-08-2023', 'dd-mm-yyyy'), 397);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (254, 86, 'Call Henry', to_date('09-09-2023', 'dd-mm-yyyy'), 818);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (556, 99, 'Taycor Financia', to_date('07-08-2023', 'dd-mm-yyyy'), 653);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (888, 126, 'Myricom', to_date('20-01-2023', 'dd-mm-yyyy'), 740);
insert into LAUNDRY (lid, cost, lname, pickingdate, oid)
values (152, 148, 'Wal-Mart Stores', to_date('31-12-2022', 'dd-mm-yyyy'), 214);
commit;
prompt 215 records loaded
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint EVENT_CID_FK;
alter table EVENT enable constraint EVENT_PID_FK;
alter table EVENT enable constraint SYS_C007487;
alter table EVENT enable constraint SYS_C007490;
prompt Enabling foreign key constraints for INSTRUMENT_EVENT...
alter table INSTRUMENT_EVENT enable constraint SYS_C007498;
alter table INSTRUMENT_EVENT enable constraint SYS_C007499;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint ORDERS_PID_FK;
alter table ORDERS enable constraint SYS_C007439;
alter table ORDERS enable constraint SYS_C007440;
alter table ORDERS enable constraint SYS_C007441;
prompt Enabling foreign key constraints for LAUNDRY...
alter table LAUNDRY enable constraint SYS_C007447;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DRESS...
alter table DRESS enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for PAYMENT...
alter table PAYMENT enable all triggers;
prompt Enabling triggers for PRODUCER...
alter table PRODUCER enable all triggers;
prompt Enabling triggers for SINGER...
alter table SINGER enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for INSTRUMENT...
alter table INSTRUMENT enable all triggers;
prompt Enabling triggers for INSTRUMENT_EVENT...
alter table INSTRUMENT_EVENT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for LAUNDRY...
alter table LAUNDRY enable all triggers;
set feedback on
set define on
prompt Done.
