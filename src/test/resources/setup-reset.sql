-- Use this script to set up your Planetarium database: edit at your own risk
-- NOTE: if executing these statements manually, the image data is encoded in base64
-- before being passed into the database: you will need to do this manually or leave it off
-- needed for referential integrity enforcement if executing the queries manually
PRAGMA foreign_keys = ON;

drop table if exists moons;

drop table if exists planets;

drop table if exists users;

create table users(
	id integer primary key,
	username text unique not null check (length(username) <= 30),
	password text not null check (length(password) <= 30)
);

insert into users (username, password) values ('Batman', 'I am the night');
insert into users (username, password) values ('This is a test account', 'This is the password');

create table planets(
	id integer primary key,
	name text not null check (length(name) <= 30),
	ownerId integer not null,
	image blob,
	foreign key(ownerId) references users(id) on delete cascade
);

insert into planets (name, ownerId, image) values ('Earth', 1, ?);
insert into planets (name, ownerId, image) values ('Mars', 1, ?);
insert into planets (name, ownerId, image) values ("User's planet", 1, ?);
insert into planets (name, ownerId, image) values ("User's planet with moon", 1, ?);
insert into planets (name, ownerId, image) values ('Jupiter', 2, ?);
insert into planets (name, ownerId, image) values ("Other user’s planet", 2, ?);
insert into planets (name, ownerId, image) values ("Other user’s planet with moon", 2, ?);
insert into planets (name, ownerId, image) values ("Planet .^$*+-?()[]{}\|", 1, ?);
insert into planets (name, ownerId, image) values ('Saturn', 2, ?);
insert into planets (name, ownerId, image) values ("User's planet2", 1, ?);
insert into planets (name, ownerId, image) values ("User's planet with moon2", 1, ?);
insert into planets (name, ownerId, image) values ("Other user’s planet2", 2, ?);
insert into planets (name, ownerId, image) values ("Other user’s planet with moon2", 2, ?);

create table moons(
	id integer primary key,
	name text not null check (length(name) <= 30),
	myPlanetId integer not null,
	image blob,
	foreign key(myPlanetId) references planets(id) on delete cascade
);

insert into moons (name, myPlanetId, image) values ('Luna', 1, ?);
insert into moons (name, myPlanetId, image) values ('Titan', 2, ?);
insert into moons (name, myPlanetId, image) values ('User’s associated moon', 4, ?);
insert into moons (name, myPlanetId, image) values ('Other user’s associated moon', 7, ?);
insert into moons (name, myPlanetId, image) values ('Callisto', 5, ?);
insert into moons (name, myPlanetId, image) values ('Moon .^$*+-?()[]{}\|', 8, ?);
insert into moons (name, myPlanetId, image) values ('Rhea', 9, ?);
insert into moons (name, myPlanetId, image) values ('User’s associated moon2', 10, ?);
insert into moons (name, myPlanetId, image) values ('Other user’s associated moon2', 11, ?);

