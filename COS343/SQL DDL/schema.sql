DROP SCHEMA missions_track CASCADE ;

-- Create new schema for MissionsTrack
CREATE SCHEMA missions_track;

-- Point to the new schema
SET SCHEMA 'missions_track';

-- Create domain for gauging levels
CREATE DOMAIN level char(9)
CHECK ( VALUE = 'low' OR
        VALUE = 'moderate' OR
        VALUE = 'high' OR
        VALUE = 'very high' );

-- Create domain for telephone numbers
CREATE DOMAIN telephone char(12)
CHECK (SUBSTRING (VALUE, 4, 1) = '-' AND SUBSTRING (VALUE, 8, 1) = '-');

-- Create the tables
CREATE TABLE mission (
  id int,
  name varchar(120),
  url varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE volunteer (
  id int,
  name varchar(120),
  username varchar(120) UNIQUE,
  password varchar(120),
  email varchar(255),
  phone_no telephone,
  postal_addr varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE skill (
  id int,
  name varchar(60),
  description varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE country (
  id int,
  name varchar(120),
  PRIMARY KEY (id)
);

CREATE TABLE interaction (
  id int,
  date_time TIMESTAMP,
  notes varchar(2000),
  PRIMARY KEY (id)
);

CREATE TABLE coordinators (
  mission_id int,
  coordinator_id int,
  PRIMARY KEY (mission_id, coordinator_id),
  FOREIGN KEY (mission_id)
  REFERENCES mission
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (coordinator_id)
  REFERENCES volunteer
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE need (
  id int,
  mission_id int,
  skill_id int,
  country_id int,
  urgency level,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id)
  REFERENCES mission
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (skill_id)
  REFERENCES skill
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (country_id)
  REFERENCES country
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE abilities (
  skill_id int,
  volunteer_id int,
  ability varchar (120),
  experience_level level,
  PRIMARY KEY (skill_id, volunteer_id),
  FOREIGN KEY (skill_id)
  REFERENCES skill
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
  REFERENCES volunteer
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE interests (
  country_id int,
  volunteer_id int,
  interest_level level,
  PRIMARY KEY (country_id,volunteer_id),
  FOREIGN KEY (country_id)
  REFERENCES country
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
  REFERENCES volunteer
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE assigned_contacts (
  id int,
  coordinator_id int,
  volunteer_id int,
  interaction_id int,
  matched_skill int,
  matched_country int,
  PRIMARY KEY (id),
  FOREIGN KEY (coordinator_id)
  REFERENCES volunteer
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
  REFERENCES volunteer
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (interaction_id)
  REFERENCES interaction
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (matched_skill)
  REFERENCES skill
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
  FOREIGN KEY (matched_country)
  REFERENCES country
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);