CREATE DATABASE elote;
go
USER elote;
go


CREATE TABLE usr(
  
  id int PRIMARY key identity (1,1),
  user_name varchar(255) not null unique,
  user_passcode VARCHAR (255) not null,
  user_email varchar (255) not null
  
)
  
CREATE TABLE report(

  id int PRIMARY key identity (1,1),
  report_topic varchar(150) not null,
  report_Description VARCHAR(255) not null,
  report_date DATETIME NOT null DEFAULT GETDATE(),
  usr_id int
  
  FOREIGN KEY (usr_id) references usr(id)
  
  )


  create TABLE type(
  id int PRIMARY KEY identity (1,1),
  type_name varchar(255) not null unique
  )
  
create TABLE user_type(
  id int PRIMARY KEY identity (1,1),
  type_id int,
  usr_id int,
  
  FOREIGN KEY (usr_id) references usr(id),
  FOREIGN KEY (type_id) references type(id)

)



-- brand model vehicle

CREATE table brand (
  
  id int PRIMARY KEY identity (1,1),
  brand_name varchar(255) not null unique
  
  
  )

CREATE table model (
  
  id int PRIMARY KEY identity (1,1),
  model_name varchar(255) not null unique,
  brand_id int,
	
  FOREIGN KEY (brand_id) references brand(id)
  
  
  )

CREATE table vehicle(
  
  id int PRIMARY KEY identity (1,1), 
  plate CHAR(7) not null,
  v_price decimal(8,2) not null,
  v_year int not null,
  v_gasConsume decimal(4,2),
  v_Kms decimal(8,2),
  is_spare bit, --repuesto (1.SI / 0.NO)

  brand_id int,
  model_id int,
  usr_id int,
  
  v_date DATETIME not null DEFAULT GETDATE(),
  
  FOREIGN KEY (brand_id) references brand(id),
  FOREIGN KEY (model_id) references model(id),
  FOREIGN KEY (usr_id) references usr(id)
  
  )


  -- mech & legal history


CREATE TABLE Mech_H(
  
    id int PRIMARY KEY identity(1,1),
    
    Mech_Topic varchar(150) not null,
    Mech_Description varchar(255) not null,
    
    v_id int not null,
    
  
    FOREIGN KEY (v_id) references vehicle(id)
    
  )
  
    
CREATE TABLE Legal_H(
  
    id int PRIMARY KEY identity(1,1),
    
    owner varchar(150) not null,
    Legal_Description varchar(255) not null,
    
    v_id int not null,
    
  
    FOREIGN KEY (v_id) references vehicle(id)
    
  )


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
  
  
  )