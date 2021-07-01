-- drop statements
drop table users;
drop table users_roles;
drop table roles;
-- if we have a simple structure we dont need the below tables
drop table roles_permission;
drop table permission;


-- create statements
CREATE TABLE [users] (
  [clientid] int,  -- will this be 
  [projid] int,
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [password] nvarchar(255), -- do we need to store this ?
  [change_password] bit, -- and this ?
  [last_login] datetime,
  [email] nvarchar(255),
  [phone] nvarchar(255),
  [address_line1] nvarchar(255),
  [address_line2] nvarchar(255),
  [city] nvarchar(255),
  [province] nvarchar(255),
  [country] nvarchar(255),
  [created_date] datetime,
  [end_date] datetime,
  [userid] as hashbytes('SHA2_256', CONCAT(email,'|',phone,'|',clientid,'|',projid)) persisted not null,
  PRIMARY KEY (userid)
);


CREATE TABLE [users_roles] (
  [roleid] int,
  [userid] int,
  [clientid] int,
  [projid] int,
  [added_by] nvarchar(255),
  [assigned_date] datetime,
  [end_date] datetime
)
;

CREATE TABLE [roles] (
  [roleid] int,
  [clientid] int,
  [projid] int,
  [title] nvarchar(255),
  [slug] nvarchar(255),
  [description] nvarchar(255),
  [active_ind] nvarchar(255),
  [activation_date] datetime,
  [end_date] datetime,
  PRIMARY KEY (roleid,clientid,projid)
);

-- if we have a simple structure we dont need the below tables
CREATE TABLE [roles_permission] (
  [permissionid] int,
  [roleid] int,
  [clientid] int,
  [projid] int,
  [activation_date] datetime,
  [end_date] datetime
)
;

CREATE TABLE [permission] (
  [permissionid] int,
  [clientid] int,
  [projid] int,
  [title] nvarchar(255),
  [slug] nvarchar(255),
  [description] nvarchar(255),
  [active_ind] nvarchar(255),
  [activation_date] datetime,
  [end_date] datetime,
  PRIMARY KEY (permissionid,clientid,projid)
);


-- alter statements
--ALTER TABLE [users_roles] ADD FOREIGN KEY ([userid]) REFERENCES [users] ([userid])
--ALTER TABLE [users_roles] ADD FOREIGN KEY ([roleid]) REFERENCES [roles] ([roleid])
--ALTER TABLE [users_roles] ADD FOREIGN KEY ([roleid]) REFERENCES [roles] ([roleid])
--ALTER TABLE [roles] ADD FOREIGN KEY ([roleid]) REFERENCES [roles_permission] ([roleid])
--ALTER TABLE [roles_permission] ADD FOREIGN KEY ([permissionid]) REFERENCES [permission] ([permissionid])


-- insert statements

insert into users VALUES ('001','000','James','Bond', 'NA','','','jamesbond@007.com','007-007-0007', '007 MI 7 Drive', '','tor', 'on', 'ca', '2021-01-01','');
insert into users_roles values (1,'','001','000','M','2021-01-01','');
insert into roles values ( 1,'001','000','ADMIN','ADMIN','Admistrator, Has full access','Y','2020-01-01','');

-- if we have a simple structure we dont need the below tables
insert into roles_permission values ( 1,1,'001','000','2021-01-01','');
insert into permission values ( 1,'001','000','ADMIN FULL ACCESS','ADMIN FULL ACCESS','This permission gives full access to the user','Y','2021-01-01','');

-- select statements
select * from Users;
select * from users_roles;
select * from roles;
-- if we have a simple structure we dont need the below tables
select * from roles_permission;
select * from permission;
