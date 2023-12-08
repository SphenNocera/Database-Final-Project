SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS sport;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS teamplayer;
# ... 
SET FOREIGN_KEY_CHECKS = 1;
drop table if EXISTS player;
CREATE TABLE player (
    player_id int NOT NULL,
    player_name varchar(256) NOT NULL,
    player_email varchar(256) DEFAULT 'NULL',
    player_schoolYear varchar(256) NOT NULL,
    PRIMARY KEY (player_id)
);
drop table if EXISTS sport;
CREATE TABLE sport (
    sport_id int NOT NULL,
    sport_type varchar(256) NOT NULL,
    PRIMARY KEY (sport_id)
);
# figure out how to get average points scored and wins attributes
DROP TABLE if EXISTS team;
CREATE TABLE team (
    team_id int NOT NULL,
    team_name varchar(256) NOT NULL,
    sport_id int NOT NULL,
    PRIMARY KEY (team_id),
    FOREIGN KEY (sport_id) REFERENCES sport (sport_id)
);
drop table if EXISTS matches;
CREATE TABLE matches (
    match_id int NOT NULL,
    match_team1 int NOT NULL,
    match_team2 int NOT NULL,
    match_winner int NOT NULL,
    match_score1 int NOT NULL DEFAULT '0',
    match_score2 int NOT NULL DEFAULT '0',
    match_date date NOT NULL,
    match_location varchar(256) NOT NULL DEFAULT 'Cary St. Gym',
    PRIMARY KEY (match_id),
    FOREIGN KEY (match_team1) REFERENCES team (team_id),
    FOREIGN KEY (match_team2) REFERENCES team (team_id),
    FOREIGN KEY (match_winner) REFERENCES team (team_id)
);
drop table if EXISTS teamplayer;
CREATE TABLE teamplayer (
    teamplayer_id int AUTO_INCREMENT NOT NULL,
    player_id int NOT NULL,
    team_id int NOT NULL,
    PRIMARY KEY (teamplayer_id),
    FOREIGN KEY (player_id) REFERENCES player (player_id),
    FOREIGN KEY (team_id) REFERENCES team (team_id)
);
INSERT INTO player (
        player_id,
        player_name,
        player_email,
        player_schoolYear
    )
VALUES (1, 'John Doe', 'john.doe@example.com', 'Senior'),
    (
        2,
        'Jane Smith',
        'jane.smith@example.com',
        'Junior'
    ),
    (
        3,
        'Bob Johnson',
        'bob.johnson@example.com',
        'Sophomore'
    ),
    (
        4,
        'Alice Williams',
        'alice.williams@example.com',
        'Freshman'
    ),
    (
        5,
        'Chris Davis',
        'chris.davis@example.com',
        'Senior'
    ),
    (
        6,
        'Emily Brown',
        'emily.brown@example.com',
        'Junior'
    ),
    (
        7,
        'David Lee',
        'david.lee@example.com',
        'Senior'
    ),
    (
        8,
        'Sarah Miller',
        'sarah.miller@example.com',
        'Sophomore'
    ),
    (
        9,
        'Michael Wilson',
        'michael.wilson@example.com',
        'Freshman'
    ),
    (
        10,
        'Olivia Davis',
        'olivia.davis@example.com',
        'Junior'
    ),
    (
        11,
        'Michael Anderson',
        'michael.anderson@example.com',
        'Sophomore'
    ),
    (
        12,
        'Elena Rodriguez',
        'elena.rodriguez@example.com',
        'Junior'
    ),
    (
        13,
        'David Smith',
        'david.smith@example.com',
        'Senior'
    ),
    (
        14,
        'Sophie Johnson',
        'sophie.johnson@example.com',
        'Freshman'
    ),
    (
        15,
        'Ryan Taylor',
        'ryan.taylor@example.com',
        'Sophomore'
    ),
    (
        16,
        'Jessica White',
        'jessica.white@example.com',
        'Senior'
    ),
    (
        17,
        'Christopher Davis',
        'christopher.davis@example.com',
        'Junior'
    ),
    (
        18,
        'Olivia Harris',
        'olivia.harris@example.com',
        'Freshman'
    ),
    (
        19,
        'Daniel Martin',
        'daniel.martin@example.com',
        'Senior'
    ),
    (
        20,
        'Lily Thompson',
        'lily.thompson@example.com',
        'Sophomore'
    );
INSERT INTO sport (sport_id, sport_type)
VALUES (1, 'Basketball'),
    (2, 'Soccer'),
    (3, 'Baseball'),
    (4, 'Volleyball'),
    (5, 'Tennis');
INSERT INTO team (team_id, team_name, sport_id)
VALUES (101, 'ThunderStrikers', 1),
    (102, 'GoalDiggers', 2),
    (103, 'HomeRunHeroes', 3),
    (104, 'SpikeNation', 4),
    (105, 'AceRacers', 5),
    (106, "Quantum Mavericks", 1),
    (107, "Solar Flare All-Stars", 2),
    (108, "Thunderstorm Titans", 3),
    (109, "Nebula Nomads", 4),
    (110, "Velocity Vipers", 5);
INSERT INTO matches (
        match_id,
        match_team1,
        match_team2,
        match_winner,
        match_score1,
        match_score2,
        match_date,
        match_location
    )
VALUES (
        1,
        101,
        106,
        101,
        2,
        1,
        '2023-01-15',
        'Cary St. Gym'
    ),
    (
        2,
        102,
        107,
        107,
        3,
        0,
        '2023-01-18',
        'Cary St. Gym'
    ),
    (
        3,
        103,
        108,
        108,
        2,
        3,
        '2023-01-20',
        'Cary St. Gym'
    ),
    (
        4,
        104,
        109,
        104,
        1,
        0,
        '2023-01-22',
        'Cary St. Gym'
    ),
    (
        5,
        105,
        110,
        105,
        3,
        1,
        '2023-01-25',
        'Cary St. Gym'
    ),
    (
        6,
        101,
        106,
        101,
        3,
        2,
        '2023-01-28',
        'Cary St. Gym'
    ),
    (
        7,
        102,
        107,
        102,
        2,
        0,
        '2023-01-30',
        'Cary St. Gym'
    ),
    (
        8,
        103,
        108,
        103,
        1,
        0,
        '2023-02-02',
        'Cary St. Gym'
    ),
    (
        9,
        104,
        109,
        104,
        3,
        1,
        '2023-02-05',
        'Cary St. Gym'
    ),
    (
        10,
        105,
        110,
        108,
        2,
        1,
        '2023-02-08',
        'Cary St. Gym'
    );
INSERT INTO teamplayer (player_id, team_id)
VALUES (1, 101),
    (2, 101),
    (3, 102),
    (4, 102),
    (5, 103),
    (6, 103),
    (7, 104),
    (8, 104),
    (9, 105),
    (10, 105),
    (11, 106),
    (12, 106),
    (13, 107),
    (14, 107),
    (15, 108),
    (16, 108),
    (17, 109),
    (18, 109),
    (19, 110),
    (20, 110);