-- Author Timothy Ngo

use group20;

drop table if exists Tweet;

create table Tweet (
tweetID integer,
retweeted boolean,
retweetCount integer,
createdAt timestamp,
day integer,
month integer,
year integer,
tweetText varchar(280),
primary key(tweetID)
);

drop table if exists Hashtag;

create table Hashtag (
hashText varchar(50),
primary key(hashText)
);

drop table if exists URL;

create table URL (
link varchar(100),
primary key(link)
);

drop table if exists HashUsed;

create table HashUsed (
twitID integer,
hashTxt varchar(50),
primary key(twitID, hashTxt),
foreign key(twitID) references Tweet(tweetID),
foreign key(hashTxt) references Hashtag(hashText)
);

drop table if exists URLAppears;

create table URLAppears (
twitID integer,
url varchar(50),
primary key(twitID, url),
foreign key(twitID) references Tweet(tweetID),
foreign key(url) references URL(link)
);

drop table if exists Users;

create table Users (
screenName varchar(100),
location varchar(100),
name varchar(100),
followers integer,
following integer,
category varchar(50),
subCategory varchar(50),
repState varchar(50),
primary key(screenName)
);

drop table if exists TwitPost;

create table TwitPost (
scrName varchar(100),
twitID integer,
primary key(twitID, scrName),
foreign key(twitID) references Tweet(tweetID),
foreign key(scrName) references Users(screenName)
);







