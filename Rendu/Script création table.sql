use RainbowSix;
drop table if EXISTS Pendants
CREATE TABLE Pendants (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Rarity VARCHAR(45) NOT NULL,
  Definition VARCHAR(45) NOT NULL,
  )
  
  use RainbowSix;
drop table if EXISTS Skins
CREATE TABLE Skins (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Color VARCHAR(45) NOT NULL,
  Rarity VARCHAR(45) NOT NULL,
  Pattern VARCHAR(45) NOT NULL,
  )


use RainbowSix;
drop table if EXISTS Accessories
CREATE TABLE Accessories (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Type VARCHAR(45) NOT NULL,
  Location VARCHAR(45) NOT NULL,
  Stat VARCHAR(100) NOT NULL,
  Descript VARCHAR(45) NOT NULL,
  )

  use RainbowSix;
drop table if EXISTS Weapons
CREATE TABLE Weapons (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Category VARCHAR(45) NOT NULL,
  Damage INT NOT NULL,
  Recoil VARCHAR(45) NOT NULL,
  ADS VARCHAR(45) NOT NULL,
  Capacity INT NOT NULL,
  Accessories_id INT,
)

  use RainbowSix;
drop table if EXISTS Mods
CREATE TABLE Mods (
  id INT NOT NULL   identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Duration INT NOT NULL,
  Special INT NOT NULL,
  Definition VARCHAR(45) NOT NULL,
 )
   use RainbowSix;
drop table if EXISTS Stat
CREATE TABLE Stat (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Defense VARCHAR(45) NOT NULL UNIQUE,
  Speed VARCHAR(45) NOT NULL UNIQUE,
 )   
  
    use RainbowSix;
drop table if EXISTS Characters
CREATE TABLE Characters (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Part VARCHAR(7) NOT NULL ,
  Ability_name VARCHAR(20) NOT NULL ,
  Ability_definition VARCHAR(200) NOT NULL ,
  Passive_ability VARCHAR(20)  NULL ,
  Passif_definition VARCHAR(200)  NULL ,
  Gender VARCHAR(10) NULL ,
  Country VARCHAR(45) NULL ,
  Special_force VARCHAR(80) NULL ,
  Weapons_id INT,
  Rewards_id INT,
  Gadgets_id INT,

 )

    use RainbowSix;
drop table if EXISTS Maps
CREATE TABLE Maps (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Country VARCHAR(45) NOT NULL ,
  Size INT NOT NULL ,
  Nb_spawns VARCHAR(45) NOT NULL ,
  Nb_floors VARCHAR(45) NOT NULL ,
  Mods_id INT,
  
 )
     use RainbowSix;
drop table if EXISTS Rewards
CREATE TABLE Rewards (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Type VARCHAR(45) NOT NULL ,
   
 )

   use RainbowSix;
drop table if EXISTS Gadgets
CREATE TABLE Gadgets (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Definition VARCHAR(200) NOT NULL ,
  Part VARCHAR(200) NOT NULL ,
   
 )
 ALTER TABLE Weapons WITH CHECK ADD  CONSTRAINT FK_Weapons_Accessories FOREIGN KEY(Accessories_id)
REFERENCES Accessories(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Weapons FOREIGN KEY(Weapons_id)
REFERENCES Weapons(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Rewards FOREIGN KEY(Rewards_id)
REFERENCES Rewards(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Gadgets FOREIGN KEY(Gadgets_id)
REFERENCES Gadgets(id)

 ALTER TABLE Maps WITH CHECK ADD  CONSTRAINT FK_Maps_Mods FOREIGN KEY(Mods_id)
REFERENCES Mods(id)