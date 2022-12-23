CREATE TABLE campaign (
  CampaignID varchar(60) NOT NULL,
  CampaignName varchar(60) NOT NULL,
  FundSpent varchar(45) NOT NULL,
  ReceivedDonations varchar(45) NOT NULL,
  ManagerID varchar(45) NOT NULL,
  NoOfVolunteers int(11) NOT NULL,
  CandidateID int(11) NOT NULL,
  PartyID varchar(60) NOT NULL,
  PRIMARY KEY (CampaignID),
  CONSTRAINT campaign_FK_1 FOREIGN KEY (CandidateID) REFERENCES candidates (CandidateID) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT campaign_FK_2 FOREIGN KEY (PartyID) REFERENCES candidates (PartyID) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE campaignmanager(
  ManagerID varchar(45) NOT NULL,
  Name varchar(45) NOT NULL,
  Gender varchar(45) NOT NULL,
  Experience varchar(60) NOT NULL,
  Rating int(11) DEFAULT NULL,
  PRIMARY KEY (ManagerID)
);

CREATE TABLE candidates(
  CandidateID int(11) NOT NULL,
  CandidateName varchar(45) NOT NULL,
  PartyID varchar(60) NOT NULL,
  CategoryID varchar(45) DEFAULT NULL,
  PRIMARY KEY (CandidateID),
  CONSTRAINT candidates_FK_1 FOREIGN KEY (PartyID) REFERENCES party (PartyID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT candidates_FK_2 FOREIGN KEY (Categoryid) REFERENCES category (CategoryID)
);

CREATE TABLE candidates_uses_media(
  CandidateID int(11) NOT NULL,
  MediaID varchar(45) NOT NULL,
  CONSTRAINT candidates_uses_media_FK_1 FOREIGN KEY (CandidateID) REFERENCES candidates (CandidateID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT candidates_uses_media_FK_2 FOREIGN KEY (MediaID) REFERENCES media (MediaID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE category(
  CategoryID varchar(60) NOT NULL,
  CategoryName varchar(45) NOT NULL,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE city (
  CityID int(11) NOT NULL,
  CityName varchar(45) NOT NULL,
  StateID int(11) NOT NULL,
  PRIMARY KEY (CityID),
  CONSTRAINT city_FK FOREIGN KEY (StateID) REFERENCES state (StateID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE election (
  ElectionID varchar(45) NOT NULL,
  ElectionName varchar(45) NOT NULL,
  ElectionDate varchar(45) NOT NULL,
  CategoryID varchar(60) NOT NULL,
  PRIMARY KEY (ElectionID),
  CONSTRAINT election_FK_1 FOREIGN KEY (CategoryID) REFERENCES category (CategoryID) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE election_has_candidates (
  ElectionID varchar(45) NOT NULL,
  CandidateID int(11) NOT NULL,
  CONSTRAINT election_has_candidates_FK_1 FOREIGN KEY (ElectionID) REFERENCES election (ElectionID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT election_has_candidates_FK_2 FOREIGN KEY (CandidateID) REFERENCES candidates (CandidateID) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE media (
  MediaID varchar(45) NOT NULL,
  Name varchar(45) NOT NULL,
  Type varchar(45) NOT NULL,
  Popularity varchar(45) NOT NULL,
  PRIMARY KEY (MediaID)
  );

CREATE TABLE party (
  PartyID varchar(60) NOT NULL,
  PartyName varchar(45) NOT NULL,
  Symbol varchar(45) NOT NULL,
  PRIMARY KEY (PartyID)
);

CREATE TABLE precinct (
  PrecinctID int(11) NOT NULL,
  PrecinctName varchar(45) NOT NULL,
  CityID int(11) NOT NULL,
  StateID int(11) NOT NULL,
  PRIMARY KEY (PrecinctID),
  CONSTRAINT precinct_FK_1 FOREIGN KEY (CityID) REFERENCES city (CityID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT precinct_FK_2 FOREIGN KEY (StateID) REFERENCES state (StateID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE roles (
  roleID varchar(70) NOT NULL,
  rolename varchar(70) DEFAULT NULL,
  privileges varchar(70) DEFAULT NULL,
  PRIMARY KEY (roleID)
);

CREATE TABLE state (
  StateID int(11) NOT NULL,
  StateName varchar(45) NOT NULL,
  PRIMARY KEY (StateID)
);

CREATE TABLE vote (
  BallotID varchar(60) NOT NULL,
  ElectionID varchar(45) NOT NULL,
  CandidateID int(11) DEFAULT NULL,
  PartyID varchar(60) DEFAULT NULL,
  PrecinctID int(11) NOT NULL,
  VoteStatus varchar(45) NOT NULL,
  CONSTRAINT vote_FK_1 FOREIGN KEY (ElectionID) REFERENCES election (ElectionID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT vote_FK_2 FOREIGN KEY (PartyID) REFERENCES party (PartyID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT vote_FK_3 FOREIGN KEY (BallotID) REFERENCES voter_info (BallotID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT vote_FK_4 FOREIGN KEY (PrecinctID) REFERENCES precinct (PrecinctID) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE voter_info (
  BallotID varchar(60) NOT NULL,
  FirstName varchar(45) NOT NULL,
  LastName varchar(45) NOT NULL,
  DateOfBirth date NOT NULL,
  Gender varchar(45) DEFAULT NULL,
  Street varchar(45) NOT NULL,
  City varchar(45) NOT NULL,
  State varchar(45) NOT NULL,
  SSN varchar(45) NOT NULL,
  PrecinctID int(11) DEFAULT NULL,
  EmailID varchar(40) DEFAULT NULL,
  PRIMARY KEY (BallotID),
  UNIQUE KEY SSN (SSN),
  CONSTRAINT voter_info_FK_1 FOREIGN KEY (PrecinctID) REFERENCES precinct (PrecinctID) ON DELETE CASCADE ON UPDATE CASCADE
);


