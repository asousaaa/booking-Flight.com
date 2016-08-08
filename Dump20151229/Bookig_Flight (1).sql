
/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     12/25/2015 2:39:27 PM                        */
/*==============================================================*/
create database booking_flight;
use booking_flight;
create table ADMIN 
(
   NAME_AD              varchar(1024)                 not null,
   PASSWROD_AD          varchar(1024)                 not null,
   EMAIL_AD             varchar(1024)                  null,
   ID_AD                integer (16)auto_increment     not null,
   constraint PK_ADMIN primary key (ID_AD)
);

/*==============================================================*/
/* Index: ADMIN_PK                                              */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
ID_AD ASC
);

/*==============================================================*/
/* Table: AIRCRAFT                                              */
/*==============================================================*/
create table AIRCRAFT 
(
   _OFSEATS             integer                        null,
   COMPANYNAME          varchar(1024)                  null,
   TYPE                 varchar(1024)                  null,
   ID_PLAN              integer (16)auto_increment                       not null,
   ID_AD                integer                        null,
   constraint PK_AIRCRAFT primary key (ID_PLAN)
);

/*==============================================================*/
/* Index: AIRCRAFT_PK                                           */
/*==============================================================*/
create unique index AIRCRAFT_PK on AIRCRAFT (
ID_PLAN ASC
);

/*==============================================================*/
/* Index: ADD_EDIT2_FK                                          */
/*==============================================================*/
create index ADD_EDIT2_FK on AIRCRAFT (
ID_AD ASC
);

/*==============================================================*/
/* Table: FLIGHT                                                */
/*==============================================================*/
create table FLIGHT 
(
   SOURSE               varchar(1024)                  null,
   DESTINATION          varchar(1024)                  null,
   _OFSEATS1             integer                        null,
   _OFSEATS2            integer                        null,
   _OFSEATS3            integer                        null,
   
   DATE           date                           null,
   BOOKEDSEATS1         integer                        null,
   BOOKEDSEATS2         integer                        null,
   BOOKEDSEATS3         integer                        null,
   ID_FLIGHT            integer(16)auto_increment                        not null,
   ID_PLAN              integer                        null,
   ID_AD                integer                        null,
   FLIGHT_MANGE         integer                        null,
   time                 varchar(1024) null,
   constraint PK_FLIGHT primary key (ID_FLIGHT)
);

/*==============================================================*/
/* Index: FLIGHT_PK                                             */
/*==============================================================*/
create unique index FLIGHT_PK on FLIGHT (
ID_FLIGHT ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on FLIGHT (
FLIGHT_MANGE ASC
);

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/
create index HAVE_FK on FLIGHT (
ID_PLAN ASC
);

/*==============================================================*/
/* Index: ADD_EDIT_FK                                           */
/*==============================================================*/
create index ADD_EDIT_FK on FLIGHT (
ID_AD ASC
);

/*==============================================================*/
/* Table: FLIGHTMANAGER                                         */
/*==============================================================*/
create table FLIGHTMANAGER 
(
   ID_US                integer                        null,
   ID_FL                integer                        null,
   BOOKEDSEATS1         integer                        null,
   BOOKEDSEATS2         integer                        null,
   BOOKEDSEATS3         integer                        null,
   FLIGHT_MANGE         integer(16)auto_increment                        not null,
   constraint PK_FLIGHTMANAGER primary key (FLIGHT_MANGE)
);

/*==============================================================*/
/* Index: FLIGHTMANAGER_PK                                      */
/*==============================================================*/
create unique index FLIGHTMANAGER_PK on FLIGHTMANAGER (
FLIGHT_MANGE ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table USER
(
   NAME_US              varchar(1024)                  not null,
   EMAIL_US             char(255)              unique not null,
   PASSWORD_US          char(255)                      not null,
   ID_USER              integer(16)auto_increment                     not  null,
   FLIGHT_MANGE         integer                        null,
   ID_AD                integer                        null,
   
   constraint PK_USER primary key (ID_USER)
);


/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique index USER_PK on USER (
ID_USER ASC
);

/*==============================================================*/
/* Index: TREAT_FK                                              */
/*==============================================================*/
create index TREAT_FK on USER (
FLIGHT_MANGE ASC
);

/*==============================================================*/
/* Index: ADD_FK                                                */
/*==============================================================*/
create index ADD_FK on USER (
ID_AD ASC
);

alter table AIRCRAFT
   add constraint FK_AIRCRAFT_ADD_EDIT2_ADMIN foreign key (ID_AD)
      references ADMIN (ID_AD)
      on update restrict
      on delete restrict;

alter table FLIGHT
   add constraint FK_FLIGHT_ADD_EDIT_ADMIN foreign key (ID_AD)
      references ADMIN (ID_AD)
      on update restrict
      on delete restrict;

alter table FLIGHT
   add constraint FK_FLIGHT_HAVE_AIRCRAFT foreign key (ID_PLAN)
      references AIRCRAFT (ID_PLAN)
      on update restrict
      on delete restrict;

alter table FLIGHT
   add constraint FK_FLIGHT_RELATIONS_FLIGHTMA foreign key (FLIGHT_MANGE)
      references FLIGHTMANAGER (FLIGHT_MANGE)
      on update restrict
      on delete restrict;

alter table USER
   add constraint FK_USER_ADD_ADMIN foreign key (ID_AD)
      references ADMIN (ID_AD)
      on update restrict
      on delete restrict;

alter table USER
   add constraint FK_USER_TREAT_FLIGHTMA foreign key (FLIGHT_MANGE)
      references FLIGHTMANAGER (FLIGHT_MANGE)
      on update restrict
      on delete restrict;

ALTER TABLE user AUTO_INCREMENT=1;
ALTER TABLE admin AUTO_INCREMENT=1;
ALTER TABLE aircraft AUTO_INCREMENT=1;
ALTER TABLE flightmanager AUTO_INCREMENT=1;
ALTER TABLE flight AUTO_INCREMENT=1;
ALTER TABLE user ADD UNIQUE ( EMAIL_US  );
alter table flight ADD firstprice integer(16);
alter table flight ADD businessprice integer(16);
alter table flight ADD economyprice integer(16);