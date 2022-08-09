CREATE DATABASE QLSBDMN 
/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     6/2/2022 6:48:56 PM                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_HOA_DON_RELATIONS_KHACH_HA') then
    alter table HOA_DON
       delete foreign key FK_HOA_DON_RELATIONS_KHACH_HA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOA_DON_RELATIONS_DICHVU') then
    alter table HOA_DON
       delete foreign key FK_HOA_DON_RELATIONS_DICHVU
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOA_DON_RELATIONS_NHANVIEN') then
    alter table HOA_DON
       delete foreign key FK_HOA_DON_RELATIONS_NHANVIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOA_DON_RELATIONS_THUE_SAN') then
    alter table HOA_DON
       delete foreign key FK_HOA_DON_RELATIONS_THUE_SAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SAN_RELATIONS_LOAI_SAN') then
    alter table SAN
       delete foreign key FK_SAN_RELATIONS_LOAI_SAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_THUE_SAN_RELATIONS_SAN') then
    alter table THUE_SAN
       delete foreign key FK_THUE_SAN_RELATIONS_SAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_THUE_SAN_RELATIONS_KHACH_HA') then
    alter table THUE_SAN
       delete foreign key FK_THUE_SAN_RELATIONS_KHACH_HA
end if;

drop index if exists DICHVU.DICHVU_PK;

drop table if exists DICHVU;

drop index if exists HOA_DON.RELATIONSHIP_7_FK;

drop index if exists HOA_DON.RELATIONSHIP_6_FK;

drop index if exists HOA_DON.RELATIONSHIP_5_FK;

drop index if exists HOA_DON.RELATIONSHIP_4_FK;

drop index if exists HOA_DON.HOA_DON_PK;

drop table if exists HOA_DON;

drop index if exists KHACH_HANG.KHACH_HANG_PK;

drop table if exists KHACH_HANG;

drop index if exists LOAI_SAN.LOAI_SAN_PK;

drop table if exists LOAI_SAN;

drop index if exists NHANVIEN.NHANVIEN_PK;

drop table if exists NHANVIEN;

drop index if exists SAN.RELATIONSHIP_1_FK;

drop index if exists SAN.SAN_PK;

drop table if exists SAN;

drop index if exists THUE_SAN.RELATIONSHIP_3_FK;

drop index if exists THUE_SAN.RELATIONSHIP_2_FK;

drop index if exists THUE_SAN.THUE_SAN_PK;

drop table if exists THUE_SAN;

/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
create table DICHVU 
(
   MADICHVU             char(256)                      not null,
   TENDICHVU            char(256)                      not null,
   GIA                  float                          not null,
   SOLUONG              integer                        not null,
   constraint PK_DICHVU primary key (MADICHVU)
);

/*==============================================================*/
/* Index: DICHVU_PK                                             */
/*==============================================================*/
create unique index DICHVU_PK on DICHVU (
MADICHVU ASC
);

/*==============================================================*/
/* Table: HOA_DON                                               */
/*==============================================================*/
create table HOA_DON 
(
   MA_HD                char(256)                      not null,
   MA_THUE_SAN          char(256)                      not null,
   MADICHVU             char(256)                      not null,
   MA_NHAN_VIEN         char(256)                      not null,
   MA_KHACH_HANG        char(256)                      not null,
   NGAYLAP_HD           date                           not null,
   TONGPHUTDA           float                          not null,
   DONGIA               float                          not null,
   TONGTIEN_HOADON      char(10)                       null,
   constraint PK_HOA_DON primary key (MA_HD)
);

/*==============================================================*/
/* Index: HOA_DON_PK                                            */
/*==============================================================*/
create unique index HOA_DON_PK on HOA_DON (
MA_HD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on HOA_DON (
MA_KHACH_HANG ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on HOA_DON (
MADICHVU ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on HOA_DON (
MA_NHAN_VIEN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on HOA_DON (
MA_THUE_SAN ASC
);

/*==============================================================*/
/* Table: KHACH_HANG                                            */
/*==============================================================*/
create table KHACH_HANG 
(
   MA_KHACH_HANG        char(256)                      not null,
   TEN_KHACH_HANG       char(256)                      not null,
   DIA_CHI_KHACH_HANG   char(256)                      not null,
   SDT                  char(256)                      not null,
   constraint PK_KHACH_HANG primary key (MA_KHACH_HANG)
);

/*==============================================================*/
/* Index: KHACH_HANG_PK                                         */
/*==============================================================*/
create unique index KHACH_HANG_PK on KHACH_HANG (
MA_KHACH_HANG ASC
);

/*==============================================================*/
/* Table: LOAI_SAN                                              */
/*==============================================================*/
create table LOAI_SAN 
(
   LOAI_SAN             char(256)                      not null,
   TEN__LOAI_SAN        char(256)                      not null,
   GIA_LOAI_SAN         float                          not null,
   constraint PK_LOAI_SAN primary key (LOAI_SAN)
);

/*==============================================================*/
/* Index: LOAI_SAN_PK                                           */
/*==============================================================*/
create unique index LOAI_SAN_PK on LOAI_SAN (
LOAI_SAN ASC
);

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN 
(
   MA_NHAN_VIEN         char(256)                      not null,
   TEN_NHAN_VIEN        char(256)                      not null,
   DIACHI_NHANVIEN      char(256)                      not null,
   GIOITINH             char(256)                      not null,
   SDT                  char(256)                      not null,
   constraint PK_NHANVIEN primary key (MA_NHAN_VIEN)
);

/*==============================================================*/
/* Index: NHANVIEN_PK                                           */
/*==============================================================*/
create unique index NHANVIEN_PK on NHANVIEN (
MA_NHAN_VIEN ASC
);

/*==============================================================*/
/* Table: SAN                                                   */
/*==============================================================*/
create table SAN 
(
   MA_SAN               char(256)                      not null,
   LOAI_SAN             char(256)                      not null,
   TEN__LOAI_SAN        char(256)                      not null,
   constraint PK_SAN primary key (MA_SAN)
);

/*==============================================================*/
/* Index: SAN_PK                                                */
/*==============================================================*/
create unique index SAN_PK on SAN (
MA_SAN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on SAN (
LOAI_SAN ASC
);

/*==============================================================*/
/* Table: THUE_SAN                                              */
/*==============================================================*/
create table THUE_SAN 
(
   MA_THUE_SAN          char(256)                      not null,
   MA_SAN               char(256)                      not null,
   MA_KHACH_HANG        char(256)                      not null,
   THOI_GIAN_BATDAU     time                           not null,
   THOI_GIAN_KETHUC     time                           not null,
   HINHTHUC             char(256)                      not null,
   DONGIA               float                          not null,
   THANHTIEN            float                          not null,
   LOAITHUE             char(256)                      not null,
   constraint PK_THUE_SAN primary key (MA_THUE_SAN)
);

/*==============================================================*/
/* Index: THUE_SAN_PK                                           */
/*==============================================================*/
create unique index THUE_SAN_PK on THUE_SAN (
MA_THUE_SAN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on THUE_SAN (
MA_SAN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on THUE_SAN (
MA_KHACH_HANG ASC
);

alter table HOA_DON
   add constraint FK_HOA_DON_RELATIONS_KHACH_HA foreign key (MA_KHACH_HANG)
      references KHACH_HANG (MA_KHACH_HANG)
      

alter table HOA_DON
   add constraint FK_HOA_DON_RELATIONS_DICHVU foreign key (MADICHVU)
      references DICHVU (MADICHVU)
      

alter table HOA_DON
   add constraint FK_HOA_DON_RELATIONS_NHANVIEN foreign key (MA_NHAN_VIEN)
      references NHANVIEN (MA_NHAN_VIEN)
     

alter table HOA_DON
   add constraint FK_HOA_DON_RELATIONS_THUE_SAN foreign key (MA_THUE_SAN)
      references THUE_SAN (MA_THUE_SAN)
      

alter table SAN
   add constraint FK_SAN_RELATIONS_LOAI_SAN foreign key (LOAI_SAN)
      references LOAI_SAN (LOAI_SAN)
      

alter table THUE_SAN
   add constraint FK_THUE_SAN_RELATIONS_SAN foreign key (MA_SAN)
      references SAN (MA_SAN)
      

alter table THUE_SAN
   add constraint FK_THUE_SAN_RELATIONS_KHACH_HA foreign key (MA_KHACH_HANG)
      references KHACH_HANG (MA_KHACH_HANG)
     

