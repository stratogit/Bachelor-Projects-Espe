/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     13/07/2012 13:14:04                          */
/*==============================================================*/


alter table T_SALAS
   drop constraint FK_T_SALAS_RELATIONS_T_PELICU;

drop table T_PELICULAS cascade constraints;

drop index RELATIONSHIP_1_FK;

drop table T_SALAS cascade constraints;

/*==============================================================*/
/* Table: T_PELICULAS                                           */
/*==============================================================*/
create table T_PELICULAS  (
   P_CODIGO             INTEGER                         not null,
   P_NOMBRE             VARCHAR2(100)                   not null,
   P_CALIFICAEDAD       INTEGER                         not null,
   constraint PK_T_PELICULAS primary key (P_CODIGO)
);

/*==============================================================*/
/* Table: T_SALAS                                               */
/*==============================================================*/
create table T_SALAS  (
   S_CODIGO             INTEGER                         not null,
   P_CODIGO             INTEGER,
   S_NOMBRE             VARCHAR2(100)                   not null,
   S_PELICULA           INTEGER                         not null,
   constraint PK_T_SALAS primary key (S_CODIGO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on T_SALAS (
   P_CODIGO ASC
);

alter table T_SALAS
   add constraint FK_T_SALAS_RELATIONS_T_PELICU foreign key (P_CODIGO)
      references T_PELICULAS (P_CODIGO);

