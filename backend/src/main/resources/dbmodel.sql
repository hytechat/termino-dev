create database termino_db
GO

use termino_db
GO

-- USER
CREATE TABLE person (
                        id BIGINT IDENTITY (1,1) PRIMARY KEY,
                        p_name VARCHAR (50),
                        email VARCHAR(100)UNIQUE,
                        pw VARCHAR(40)

);

CREATE TABLE meeting_date (
                              id BIGINT IDENTITY (1,1) PRIMARY KEY,
                              start_date DATETIME NOT NULL,
                              start_date DATETIME
--                               time_start time,
--                               time_end time
);

CREATE TABLE meeting (
                         id BIGINT IDENTITY (1,1) PRIMARY KEY,
                         date_id BIGINT FOREIGN KEY REFERENCES meeting_date(id),
                         organizer BIGINT FOREIGN KEY REFERENCES  person(id),
                         organizer_name VARCHAR (50),
                         organizer_email VARCHAR (100),
                         title VARCHAR(50) NOT NULL,
                         meeting_description VARCHAR(200),
                         isMaybeable bit DEFAULT '0',
                         isVoteAnonymous bit DEFAULT '0',
                         isMailMandatory bit DEFAULT '0',
                         closed bit DEFAULT '0',
                         created_at DATETIME NOT NULL,
                         closed_at DATETIME
);

CREATE TABLE vote (
                      id BIGINT IDENTITY (1,1) PRIMARY KEY,
                      person_id BIGINT FOREIGN KEY REFERENCES  person(id),
                      date_id BIGINT FOREIGN KEY REFERENCES meeting_date(id),
                      participant_name VARCHAR(50),
                      participant_email VARCHAR (100),
                      choice VARCHAR (10) CHECK (choice IN ('yes', 'no', 'maybe'))
);


-- CREATE TABLE meeting_poll (
--                               id BIGINT IDENTITY (1,1) PRIMARY KEY,
--                               meeting_id BIGINT FOREIGN KEY REFERENCES meeting(id),
--                               date_id BIGINT FOREIGN KEY REFERENCES meeting_date(id),
--                               person_id BIGINT FOREIGN KEY REFERENCES  person(id),
--                               participant_name VARCHAR(50),
--                               participant_email VARCHAR (100),
--                               choice VARCHAR (10) CHECK (choice IN ('yes', 'no', 'maybe'))
--                               created_at DATETIME NOT NULL,
--                               updated_at DATETIME NOT NULL,
-- );


GO