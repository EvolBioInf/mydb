drop table if exists project;
drop table if exists genome;
drop table if exists institute;
drop table if exists publication;
create table genome (
         gid varchar(10),
         organism text,
         domain varchar(20),
         size int,
         pid varchar(10),
         primary key (gid)
);
create table institute (
         iid varchar(10),
         name text,
         country text,
         primary key (iid)
);
create table project (
         gid varchar(10),
         iid varchar(10),
         primary key (gid, iid),
         foreign key (gid) references genome(gid),
         foreign key (iid) references institute(iid)
);       
create table publication (
         pid varchar(10),
         journal text,
         volume int,
         start_page int,
         end_page int,
         year int,
         primary key (pid)
);       
