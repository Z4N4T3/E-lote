CREATE DATABASE elote;
go
USE elote;
go


CREATE TABLE usr(
  
  id int PRIMARY key identity (1,1),
  username varchar(255) not null unique,
  user_passcode VARCHAR (255) not null,
  user_email varchar (255) not null

  CONSTRAINT ck_email CHECK(user_email LIKE('__%@___%.___%'))
  
);
  
CREATE TABLE report(

  id int PRIMARY key identity (1,1),
  report_topic varchar(150) not null,
  report_Description VARCHAR(255) not null,
  report_date DATETIME NOT null DEFAULT GETDATE(),
  usr_id int not null,
  
  FOREIGN KEY (usr_id) references usr(id)
  
  );


  create TABLE tipo(
  id int PRIMARY KEY identity (1,1),
  tipo_name varchar(255) not null unique
  );
  
create TABLE user_tipo(
  id int PRIMARY KEY identity (1,1),
  tipo_id int not null,
  usr_id int not null,
  
  FOREIGN KEY (usr_id) references usr(id),
  FOREIGN KEY (tipo_id) references tipo(id)

);



-- brand model vehicle

CREATE table brand (
  
  id int PRIMARY KEY identity (1,1),
  brand_name varchar(255) not null unique
  
  
  );

CREATE table model (
  
  id int PRIMARY KEY identity (1,1),
  model_name varchar(255) not null unique,
  brand_id int not null,
	
  FOREIGN KEY (brand_id) references brand(id)
  
  
  );

CREATE table vehicle(
  
  id int PRIMARY KEY identity (1,1), 
  plate CHAR(7) not null,
  v_price decimal(8,2) not null CHECK (v_price >0),
  v_year int not null CHECK (v_year>1970 AND v_year<2022),
  v_gasConsume decimal(4,2) CHECK(v_gasConsume>0),
  v_Kms decimal(8,2),
  is_spare bit, --repuesto (1.SI / 0.NO)

  brand_id int not null,
  model_id int not null,
  usr_id int not null,
  
  v_date DATETIME not null DEFAULT GETDATE(),
  
  FOREIGN KEY (brand_id) references brand(id),
  FOREIGN KEY (model_id) references model(id),
  FOREIGN KEY (usr_id) references usr(id)
  
  );


  -- mech & legal history


CREATE TABLE Mech_H(
  
    id int PRIMARY KEY identity(1,1),
    
    Mech_Topic varchar(150) not null,
    Mech_Description varchar(255) not null,
    
    v_id int not null,
    
  
    FOREIGN KEY (v_id) references vehicle(id)
    
  );
  
    
CREATE TABLE Legal_H(
  
    id int PRIMARY KEY identity(1,1),
    
    owner varchar(150) not null,
    Legal_Description varchar(255) not null,
    
    v_id int not null,
    
  
    FOREIGN KEY (v_id) references vehicle(id)
    
  );


-- msgs
create TABLE messages(
  
  id int PRIMARY KEY identity(1,1),
  
  subject varchar(150) not null,
  body varchar (255) not null,
  
  msg_date DATETIME not null DEFAULT GETDATE(),
  
  v_id int not null,
  
  user_from int not null,
  to_user int not null,
  
  FOREIGN KEY (user_from) references usr(id),
  
  FOREIGN KEY (to_user) references usr(id),
  
  FOREIGN KEY (v_id) references vehicle(id)
  
  
  );