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
  Descript VARCHAR(100) NOT NULL,
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
)

  use RainbowSix;
drop table if EXISTS Mods
CREATE TABLE Mods (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
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
  Part VARCHAR(7) NOT NULL UNIQUE,
  Ability_name VARCHAR(20) NOT NULL UNIQUE,
  Ability_definition VARCHAR(200) NOT NULL UNIQUE,
  Passive_ability VARCHAR(20)  NULL UNIQUE,
  Passif_definition VARCHAR(200)  NULL UNIQUE,
  Gender VARCHAR(10) NULL UNIQUE,
  Country VARCHAR(45) NULL UNIQUE,
  Special_force VARCHAR(80) NULL UNIQUE,

 )

    use RainbowSix;
drop table if EXISTS Maps
CREATE TABLE Maps (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Country VARCHAR(45) NOT NULL UNIQUE,
  Size INT NOT NULL UNIQUE,
  Nb_spawns VARCHAR(45) NOT NULL UNIQUE,
  Nb_floors VARCHAR(45) NOT NULL UNIQUE,
  
 )
     use RainbowSix;
drop table if EXISTS Rewards
CREATE TABLE Rewards (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Type VARCHAR(45) NOT NULL UNIQUE,
   
 )

   use RainbowSix;
drop table if EXISTS Gadgets
CREATE TABLE Gadgets (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Definition VARCHAR(200) NOT NULL UNIQUE,
  Part VARCHAR(200) NOT NULL UNIQUE,
   
 )