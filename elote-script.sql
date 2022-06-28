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