-- ================================================================================
--   postgres SQL DDL Script File
-- ================================================================================


-- ===============================================================================
--
--   Generated by:      tedia2sql -- v1.2.12
--                      See http://tedia2sql.tigris.org/AUTHORS.html for tedia2sql author information
--
--   Target Database:   postgres
--   Generated at:      Mon Nov 23 12:46:05 2009
--   Input Files:       generateModelTrackers.dia
--
-- ================================================================================



-- Generated SQL Constraints Drop statements
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia

-- alter table task drop constraint does-- (is implicitly done)
-- alter table task drop constraint makeUp-- (is implicitly done)
-- alter table requests drop constraint requests_fk_CustomerId-- (is implicitly done)
-- alter table requests drop constraint requests_fk_ProjectId-- (is implicitly done)
-- alter table task drop constraint finances-- (is implicitly done)
-- alter table works drop constraint works_fk_UsrId-- (is implicitly done)
-- alter table works drop constraint works_fk_ProjectId-- (is implicitly done)
-- alter table project_schedule drop constraint project_schedule_fk_UsrId-- (is implicitly done)
-- alter table extra_hour drop constraint worked-- (is implicitly done)
-- alter table belongs drop constraint belongs_fk_User_groupId-- (is implicitly done)
-- alter table belongs drop constraint belongs_fk_UsrId-- (is implicitly done)
-- alter table hour_cost_history drop constraint hour_cost_history_fk_UsrId-- (is implicitly done)
-- alter table area_history drop constraint area_history_fk_UsrId-- (is implicitly done)
-- alter table city_history drop constraint city_history_fk_UsrId-- (is implicitly done)
-- alter table journey_history drop constraint journey_history_fk_UsrId-- (is implicitly done)
-- alter table city_history drop constraint matches-- (is implicitly done)
-- alter table common_event drop constraint bank_holiday-- (is implicitly done)
-- alter table custom_event drop constraint appointment-- (is implicitly done)
-- alter table project_usr drop constraint project_usr_fk_UsrId-- (is implicitly done)
-- alter table project_usr drop constraint project_usr_fk_ProjectId-- (is implicitly done)
-- alter table customer drop constraint customer_fk_SectorId-- (is implicitly done)
-- alter table project drop constraint project_fk_AreaId-- (is implicitly done)
-- alter table area_history drop constraint area_history_fk_AreaId-- (is implicitly done)
-- alter table iteration drop constraint plans-- (is implicitly done)
-- alter table story drop constraint contains-- (is implicitly done)
-- alter table story drop constraint leads_st-- (is implicitly done)
-- alter table story drop constraint next-- (is implicitly done)
-- alter table task_story drop constraint constitutes-- (is implicitly done)
-- alter table task drop constraint includes-- (is implicitly done)
-- alter table task_story drop constraint developer-- (is implicitly done)
-- alter table module drop constraint analyzes-- (is implicitly done)
-- alter table task_section drop constraint shapes-- (is implicitly done)
-- alter table section drop constraint describes-- (is implicitly done)
-- alter table task_section drop constraint assigned_to-- (is implicitly done)
-- alter table section drop constraint leads_sc-- (is implicitly done)
-- alter table task_story drop constraint develops-- (is implicitly done)


-- Generated Permissions Drops
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia




-- Generated SQL View Drop Statements
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia



-- Generated SQL Schema Drop statements
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia

drop table usr cascade ;
drop table task cascade ;
drop table customer cascade ;
drop table project cascade ;
drop table requests cascade ;
drop table works cascade ;
drop table project_schedule cascade ;
drop table extra_hour cascade ;
drop table user_group cascade ;
drop table belongs cascade ;
drop table hour_cost_history cascade ;
drop table area_history cascade ;
drop table city_history cascade ;
drop table journey_history cascade ;
drop table city cascade ;
drop table common_event cascade ;
drop table custom_event cascade ;
drop table project_usr cascade ;
drop table sector cascade ;
drop table area cascade ;
drop table iteration cascade ;
drop table story cascade ;
drop table task_story cascade ;
drop table module cascade ;
drop table section cascade ;
drop table task_section cascade ;


-- Generated SQL Schema
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia


-- usr
create table usr (
  id                        serial not null,
  password                  varchar(256),
  login                     varchar (20) not null,
  constraint pk_Usr primary key (id)
) ;

-- task
create table task (
  id                        serial not null,
  _date                     date not null,
  init                      integer not null,
  _end                      integer not null,
  story                     varchar(80),
  telework                  boolean,
  onsite                    boolean,
  text                      varchar(8192),
  ttype                     varchar(40),
  phase                     varchar(15),
  usrId                     integer not null,
  projectId                 integer,
  customerId                integer,
  task_storyId              integer,
  constraint pk_Task primary key (id)
) ;

-- customer
create table customer (
  id                        serial not null,
  name                      varchar(256) not null,
  type                      varchar(256) not null,
  sectorId                  integer not null,
  url                       varchar(8192),
  constraint pk_Customer primary key (id)
) ;

-- project
create table project (
  id                        serial not null,
  activation                boolean default true not null,
  init                      date,
  _end                      date,
  invoice                   double precision,
  est_hours                 double precision,
  areaId                    integer not null,
  description               varchar(256),
  type                      varchar(256),
  moved_hours               double precision,
  sched_type                varchar(256),
  constraint pk_Project primary key (id)
) ;

-- requests
create table requests (
  customerId                integer not null,
  projectId                 integer not null,
  constraint pk_Requests primary key (customerId,projectId)
) ;

-- works
create table works (
  usrId                     integer not null,
  projectId                 integer not null,
  constraint pk_Works primary key (usrId,projectId)
) ;

-- project_schedule
create table project_schedule (
  id                        serial not null,
  weekly_load               double precision not null,
  init_week                 integer not null,
  init_year                 integer not null,
  end_week                  integer not null,
  end_year                  integer not null,
  usrId                     integer not null,
  projectId                 integer not null,
  constraint pk_Project_schedule primary key (id)
) ;

-- extra_hour
create table extra_hour (
  id                        serial not null,
  _date                     date not null,
  hours                     double precision not null,
  usrId                     integer not null,
  constraint pk_Extra_hour primary key (id)
) ;

-- user_group
create table user_group (
  id                        serial not null,
  name                      varchar(128),
  constraint pk_User_group primary key (id)
) ;

-- belongs
create table belongs (
  user_groupId              integer not null,
  usrId                     integer not null,
  constraint pk_Belongs primary key (user_groupId,usrId)
) ;

-- hour_cost_history
create table hour_cost_history (
  id                        serial not null,
  hour_cost                 numeric(8,4) not null,
  init_date                 date not null,
  end_date                  date,
  usrId                     integer not null,
  constraint pk_Hour_cost_history primary key (id)
) ;

-- area_history
create table area_history (
  id                        serial not null,
  areaId                    integer not null,
  init_date                 date not null,
  end_date                  date,
  usrId                     integer not null,
  constraint pk_Area_history primary key (id)
) ;

-- city_history
create table city_history (
  id                        serial not null,
  cityId                    integer not null,
  init_date                 date not null,
  end_date                  date,
  usrId                     integer not null,
  constraint pk_City_history primary key (id)
) ;

-- journey_history
create table journey_history (
  id                        serial not null,
  journey                   numeric (8,4) not null,
  init_date                 date not null,
  end_date                  date,
  usrId                     integer not null,
  constraint pk_Journey_history primary key (id)
) ;

-- city
create table city (
  id                        serial not null,
  name                      varchar(30) not null,
  constraint pk_City primary key (id)
) ;

-- common_event
create table common_event (
  id                        serial not null,
  cityId                    integer not null,
  _date                     date not null,
  constraint pk_Common_event primary key (id)
) ;

-- custom_event
create table custom_event (
  id                        serial not null,
  _date                     date not null,
  hours                     double precision not null,
  usrId                     integer not null,
  type                      varchar(256) not null,
  constraint pk_Custom_event primary key (id)
) ;

-- project_usr
create table project_usr (
  usrId                     integer not null,
  projectId                 integer not null,
  constraint pk_Project_usr primary key (usrId,projectId)
) ;

-- sector
create table sector (
  id                        serial not null,
  name                      varchar(256) not null,
  constraint pk_Sector primary key (id)
) ;

-- area
create table area (
  id                        serial not null,
  name                      varchar(256) not null,
  constraint pk_Area primary key (id)
) ;

-- iteration
create table iteration (
  id                        serial not null,
  name                      varchar(256) not null,
  summary                   varchar(256),
  init                      date not null,
  _end                      date,
  projectId                 integer not null,
  constraint pk_Iteration primary key (id)
) ;

-- story
create table story (
  id                        serial not null,
  name                      varchar(256) not null,
  accepted                  boolean,
  usrId                     integer not null,
  iterationId               integer not null,
  storyId                   integer,
  constraint pk_Story primary key (id)
) ;

-- task_story
create table task_story (
  id                        serial not null,
  name                      varchar(256) not null,
  risk                      integer,
  est_hours                 double precision not null,
  init                      date not null,
  _end                      date,
  est_end                   date not null,
  storyId                   integer not null,
  to_do                     double precision,
  usrId                     integer not null,
  task_sectionId            integer,
  constraint pk_Task_story primary key (id)
) ;

-- module
create table module (
  id                        serial not null,
  name                      varchar(256) not null,
  summary                   varchar(256),
  init                      date not null,
  _end                      date,
  projectId                 integer not null,
  constraint pk_Module primary key (id)
) ;

-- section
create table section (
  id                        serial not null,
  name                      varchar(256) not null,
  accepted                  boolean,
  usrId                     integer not null,
  moduleId                  integer not null,
  text                      varchar(8192),
  constraint pk_Section primary key (id)
) ;

-- task_section
create table task_section (
  id                        serial not null,
  name                      varchar(256) not null,
  est_hours                 double precision not null,
  sectionId                 integer not null,
  usrId                     integer not null,
  risk                      integer,
  constraint pk_Task_section primary key (id)
) ;




























-- Generated SQL Views
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia




-- Generated Permissions
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia



-- Generated SQL Insert statements
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia



-- Generated SQL Constraints
-- --------------------------------------------------------------------
--     Target Database:   postgres
--     SQL Generator:     tedia2sql -- v1.2.12
--     Generated at:      Mon Nov 23 12:46:02 2009
--     Input Files:       generateModelTrackers.dia

alter table task add constraint does
  foreign key (usrId)
  references usr (id)  ;
alter table task add constraint makeUp
  foreign key (projectId)
  references project (id)  ;
alter table requests add constraint requests_fk_CustomerId
  foreign key (customerId)
  references customer (id)  ;
alter table requests add constraint requests_fk_ProjectId
  foreign key (projectId)
  references project (id)  ;
alter table task add constraint finances
  foreign key (customerId)
  references customer (id)  ;
alter table works add constraint works_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table works add constraint works_fk_ProjectId
  foreign key (projectId)
  references project (id)  ;
alter table project_schedule add constraint project_schedule_fk_UsrId
  foreign key (usrId,projectId)
  references works (usrId,projectId)  ;
alter table extra_hour add constraint worked
  foreign key (usrId)
  references usr (id)  ;
alter table belongs add constraint belongs_fk_User_groupId
  foreign key (user_groupId)
  references user_group (id)  ;
alter table belongs add constraint belongs_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table hour_cost_history add constraint hour_cost_history_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table area_history add constraint area_history_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table city_history add constraint city_history_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table journey_history add constraint journey_history_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table city_history add constraint matches
  foreign key (cityId)
  references city (id)  ;
alter table common_event add constraint bank_holiday
  foreign key (cityId)
  references city (id)  ;
alter table custom_event add constraint appointment
  foreign key (usrId)
  references usr (id)  ;
alter table project_usr add constraint project_usr_fk_UsrId
  foreign key (usrId)
  references usr (id)  ;
alter table project_usr add constraint project_usr_fk_ProjectId
  foreign key (projectId)
  references project (id)  ;
alter table customer add constraint customer_fk_SectorId
  foreign key (sectorId)
  references sector (id)  ;
alter table project add constraint project_fk_AreaId
  foreign key (areaId)
  references area (id)  ;
alter table area_history add constraint area_history_fk_AreaId
  foreign key (areaId)
  references area (id)  ;
alter table iteration add constraint plans
  foreign key (projectId)
  references project (id)  ;
alter table story add constraint contains
  foreign key (iterationId)
  references iteration (id)  ;
alter table story add constraint leads_st
  foreign key (usrId)
  references usr (id)  ;
alter table story add constraint next
  foreign key (storyId)
  references story (id)  ;
alter table task_story add constraint constitutes
  foreign key (storyId)
  references story (id)  ;
alter table task add constraint includes
  foreign key (task_storyId)
  references task_story (id)  ;
alter table task_story add constraint developer
  foreign key (usrId)
  references usr (id)  ;
alter table module add constraint analyzes
  foreign key (projectId)
  references project (id)  ;
alter table task_section add constraint shapes
  foreign key (sectionId)
  references section (id)  ;
alter table section add constraint describes
  foreign key (moduleId)
  references module (id)  ;
alter table task_section add constraint assigned_to
  foreign key (usrId)
  references usr (id)  ;
alter table section add constraint leads_sc
  foreign key (usrId)
  references usr (id)  ;
alter table task_story add constraint develops
  foreign key (task_sectionId)
  references task_section (id)  ;
