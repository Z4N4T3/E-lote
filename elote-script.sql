--- 26-06-2022 19:51:39
--- MS SQL
 CREATE TABLE type(
    
    type_id int PRIMARY KEY identity (1,1),
    type_name VARCHAR(128) not null,
    usr_id int NOT null,
    FOREIGN KEY (usr_id) REFERENCES usr(usr_id),
    
    );

--- 26-06-2022 19:51:46
--- MS SQL
SELECT * FROM usr;

--- 26-06-2022 19:51:52
--- MS SQL
SELECT * FROM type;

--- 26-06-2022 19:52:12
--- MS SQL
INSERT INTO type (type_name,usr_id) VALUES (
  'admin',
  '1'
); SELECT * FROM type;

--- 26-06-2022 19:52:45
--- MS SQL
INSERT INTO type (type_name,usr_id) VALUES (
  'normie',
  '1'
); SELECT * FROM type;

--- 26-06-2022 19:55:12
--- MS SQL
/***** ERROR ******
Token error: 'Cannot insert explicit value for identity column in table 'type' when IDENTITY_INSERT is set to OFF.' on server c349b3de3b7b executing  on line 1 (code: 544, state: 1, class: 16)
 ----- 
INSERT INTO type (type_id,type_name,usr_id) VALUES (
  '',
  'juan',
  '2'
); SELECT * FROM type;
*****/

--- 26-06-2022 20:03:36
--- MS SQL
DROP TABLE type;

--- 26-06-2022 20:05:29
--- MS SQL
/***** ERROR ******
Token error: 'Incorrect syntax near 'identityt'.' on server c349b3de3b7b executing  on line 2 (code: 102, state: 1, class: 15)
 ----- 
CREATE TABLE type (
  type_id int PRIMARY KEY identityt (1,1)
  type_name VARCHAR(64) NOT null
  
  
  );
*****/

--- 26-06-2022 20:05:36
--- MS SQL
/***** ERROR ******
Token error: 'Incorrect syntax near 'type_name'.' on server c349b3de3b7b executing  on line 3 (code: 102, state: 1, class: 15)
 ----- 
CREATE TABLE type (
  type_id int PRIMARY KEY identity (1,1)
  type_name VARCHAR(64) NOT null
  
  
  );
*****/

--- 26-06-2022 20:05:54
--- MS SQL
CREATE TABLE type (
  type_id int PRIMARY KEY identity (1,1),
  type_name VARCHAR(64) NOT null
 );

--- 26-06-2022 20:08:26
--- MS SQL
CREATE TABLE type_usr(
  type_id int,
  usr_id INT
  
  FOREIGN KEY (type_id) REFERENCES type(type_id),
  
  FOREIGN KEY (usr_id) REFERENCES usr(usr_id)
 );

--- 26-06-2022 20:09:00
--- MS SQL
DROP TABLE type_usr;

--- 26-06-2022 20:09:04
--- MS SQL
CREATE TABLE type_usr(
  type_id int,
  usr_id INT,
  
  FOREIGN KEY (type_id) REFERENCES type(type_id),
  
  FOREIGN KEY (usr_id) REFERENCES usr(usr_id)
 );

--- 26-06-2022 20:10:31
--- MS SQL
SELECT * FROM type_usr;

--- 26-06-2022 20:10:37
--- MS SQL
/***** ERROR ******
Token error: 'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__type_usr__type_i__6166761E". The conflict occurred in database "db121631", table "dbo.type", column 'type_id'.' on server c349b3de3b7b executing  on line 1 (code: 547, state: 0, class: 16)
 ----- 
INSERT INTO type_usr (type_id,usr_id) VALUES (
  '',
  ''
); SELECT * FROM type_usr;
*****/

--- 26-06-2022 20:33:24
--- MS SQL
DROP TABLE type_usr;

--- 26-06-2022 20:34:03
--- MS SQL
CREATE TABLE type_usr(
  id int PRIMARY KEY identity (1,1),
  type_id int,
  usr_id INT,
  
  FOREIGN KEY (type_id) REFERENCES type(type_id),
  
  FOREIGN KEY (usr_id) REFERENCES usr(usr_id)
 );

--- 26-06-2022 20:39:37
--- MS SQL
/***** ERROR ******
Token error: 'Incorrect syntax near 'usr_id'.' on server c349b3de3b7b executing  on line 8 (code: 102, state: 1, class: 15)
 ----- 
CREATE TABLE report(
  id int PRIMARY KEY identity (1,1),
  topic varchar (45) not null,
  description varchar(255) not null,
  usr_id int,
  date_ datetime not null default GETDATE(),
  
  FOREIGN key usr_id references usr(usr_id)
 );
*****/

--- 26-06-2022 20:41:34
--- MS SQL
CREATE TABLE report(
  id int PRIMARY KEY identity (1,1),
  topic varchar (45) not null,
  description varchar(255) not null,
  usr_id int,
  date_ datetime not null default GETDATE(),
  
  FOREIGN key (usr_id) references usr(usr_id)
 );

--- 26-06-2022 20:45:37
--- MS SQL
CREATE TABLE profile(
  id int PRIMARY KEY identity (1,1),
  name varchar (255) not null,
  last_name varchar (255) not null,
  usr_id int not null,
  
  FOREIGN key (usr_id) references usr(usr_id)
  
 );

--- 26-06-2022 20:49:51
--- MS SQL

 create table company(
   id int PRIMARY key identity (1,1),
   company_name varchar (255) not null
   
   )

CREATE TABLE phone(
  id int PRIMARY KEY identity (1,1),
  phone_number char (8) not null,
  company_id int not null,
  usr_id int not null,
  
  FOREIGN key (usr_id) references usr(usr_id),
  FOREIGN key (company_id) references company(id)
  
 );

--- 26-06-2022 20:50:19
--- MS SQL
SELECT * FROM company;

