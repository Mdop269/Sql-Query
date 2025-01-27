create database IMDB_MOVIE;


drop database IMDB_MOVIE;

USE IMDB_MOVIE ;


CREATE TABLE [actor] (
    [act_id] BIGINT NOT NULL  , 
    [act_fname] NVARCHAR(20) NOT NULL, 
    [act_lname] NVARCHAR(20) NOT NULL, 
    [act_gender] NVARCHAR(1) NOT NULL,
    PRIMARY KEY ([act_id])
);

CREATE TABLE [director] (
    [dir_id] BIGINT NOT NULL  , 
    [dir_fname] NVARCHAR(20) NOT NULL, 
    [dir_lname] NVARCHAR(20) NOT NULL,
    PRIMARY KEY ([dir_id])
);

CREATE TABLE [genres] (
    [gen_id] BIGINT NOT NULL  , 
    [gen_title] NVARCHAR(20) NOT NULL, 
    PRIMARY KEY ([gen_id])
);

CREATE TABLE [movie] (
    [mov_id] BIGINT NOT NULL  , 
    [mov_title] NVARCHAR(50) NOT NULL, 
    [mov_year] INT NOT NULL, 
    [mov_time] INT NOT NULL, 
    [mov_lang] NVARCHAR(20) NOT NULL, 
    [mov_rl_dt] DATE NOT NULL, 
    [mov_rel_country] NVARCHAR(20) NOT NULL,
    PRIMARY KEY ([mov_id])
);

CREATE TABLE [Movie_cast] (
    [mov_id] BIGINT NOT NULL,
    [act_id] BIGINT NOT NULL,
    [role] NVARCHAR(30) NOT NULL,
    FOREIGN KEY ([mov_id]) REFERENCES [movie]([mov_id]),
    FOREIGN KEY ([act_id]) REFERENCES [actor]([act_id]),
);

CREATE TABLE [Movie_Direction] (
    [mov_id] BIGINT NOT NULL,
    [dir_id] BIGINT NOT NULL,
    FOREIGN KEY ([mov_id]) REFERENCES [movie]([mov_id])  ,
    FOREIGN KEY ([dir_id]) REFERENCES [director]([dir_id])  
);

CREATE TABLE [Movie_Genres] (
    [mov_id] BIGINT NOT NULL,
    [gen_id] BIGINT NOT NULL,
    FOREIGN KEY ([mov_id]) REFERENCES [movie]([mov_id]) ,
    FOREIGN KEY ([gen_id]) REFERENCES [genres]([gen_id])
);

CREATE TABLE [Reviewer] (
    [rev_id] INT NOT NULL  ,
    [rev_name] NVARCHAR(30) NOT NULL, 
    PRIMARY KEY ([rev_id])
);

CREATE TABLE [Rating] (
    [mov_id] BIGINT NOT NULL,
    [rev_id] INT NOT NULL,
    [rev_stars] NUMERIC(4, 2) NOT NULL, 
    [num_o_ratings] INT NOT NULL, 
    FOREIGN KEY ([mov_id]) REFERENCES movie([mov_id]) ,
    FOREIGN KEY ([rev_id]) REFERENCES Reviewer([rev_id]) 
);



INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (101, N'James               ', N'Stewart             ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (102, N'Deborah             ', N'Kerr                ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (103, N'Peter               ', N'OToole              ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (104, N'Robert              ', N'De Niro             ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (105, N'F. Murray           ', N'Abraham             ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (106, N'Harrison            ', N'Ford                ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (107, N'Nicole              ', N'Kidman              ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (108, N'Stephen             ', N'Baldwin             ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (109, N'Jack                ', N'Nicholson           ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (110, N'Mark                ', N'Wahlberg            ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (111, N'Woody               ', N'Allen               ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (112, N'Claire              ', N'Danes               ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (113, N'Tim                 ', N'Robbins             ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (114, N'Kevin               ', N'Spacey              ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (115, N'Kate                ', N'Winslet             ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (116, N'Robin               ', N'Williams            ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (117, N'Jon                 ', N'Voight              ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (118, N'Ewan                ', N'McGregor            ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (119, N'Christian           ', N'Bale                ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (120, N'Maggie              ', N'Gyllenhaal          ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (121, N'Dev                 ', N'Patel               ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (122, N'Sigourney           ', N'Weaver              ', N'F')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (123, N'David               ', N'Aston               ', N'M')
INSERT [Actor] ([act_id], [act_fname], [act_lname], [act_gender]) VALUES (124, N'Ali                 ', N'Astin               ', N'F')


select * from actor;


INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (201, N'Alfred              ', N'Hitchcock           ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (202, N'Jack                ', N'Clayton             ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (203, N'David               ', N'Lean                ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (204, N'Michael             ', N'Cimino              ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (205, N'Milos               ', N'Forman              ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (206, N'Ridley              ', N'Scott               ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (207, N'Stanley             ', N'Kubrick             ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (208, N'Bryan               ', N'Singer              ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (209, N'Roman               ', N'Polanski            ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (210, N'Paul                ', N'Thomas Anderson     ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (211, N'Woody               ', N'Allen               ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (212, N'Hayao               ', N'Miyazaki            ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (213, N'Frank               ', N'Darabont            ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (214, N'Sam                 ', N'Mendes              ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (215, N'James               ', N'Cameron             ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (216, N'Gus                 ', N'Van Sant            ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (217, N'John                ', N'Boorman             ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (218, N'Danny               ', N'Boyle               ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (219, N'Christopher         ', N'Nolan               ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (220, N'Richard             ', N'Kelly               ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (221, N'Kevin               ', N'Spacey              ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (222, N'Andrei              ', N'Tarkovsky           ')
INSERT [Director] ([dir_id], [dir_fname], [dir_lname]) VALUES (223, N'Peter               ', N'Jackson             ')

SELECT * FROM [Director]

INSERT [Genres] ([gen_id], [gen_title]) VALUES (1001, N'Action              ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1002, N'Adventure           ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1003, N'Animation           ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1004, N'Biography           ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1005, N'Comedy              ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1006, N'Crime               ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1007, N'Drama               ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1008, N'Horror              ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1009, N'Music               ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1010, N'Mystery             ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1011, N'Romance             ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1012, N'Thriller            ')
INSERT [Genres] ([gen_id], [gen_title]) VALUES (1013, N'War                 ')

SELECT * FROM [Genres]

INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (901, N'Vertigo                                           ', 1958, 128, N'English        ', CAST(N'1958-08-24' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (902, N'The Innocents                                     ', 1961, 100, N'English        ', CAST(N'1962-02-19' AS Date), N'SW   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (903, N'Lawrence of Arabia                                ', 1962, 216, N'English        ', CAST(N'1962-12-11' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (904, N'The Deer Hunter                                   ', 1978, 183, N'English        ', CAST(N'1979-03-08' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (905, N'Amadeus                                           ', 1984, 160, N'English        ', CAST(N'1985-01-07' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (906, N'Blade Runner                                      ', 1982, 117, N'English        ', CAST(N'1982-09-09' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (907, N'Eyes Wide Shut                                    ', 1999, 159, N'English        ', NULL, N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (908, N'The Usual Suspects                                ', 1995, 106, N'English        ', CAST(N'1995-08-25' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (909, N'Chinatown                                         ', 1974, 130, N'English        ', CAST(N'1974-08-09' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (910, N'Boogie Nights                                     ', 1997, 155, N'English        ', CAST(N'1998-02-16' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (911, N'Annie Hall                                        ', 1977, 93, N'English        ', CAST(N'1977-04-20' AS Date), N'USA  ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (912, N'Princess Mononoke                                 ', 1997, 134, N'Japanese       ', CAST(N'2001-10-19' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (913, N'The Shawshank Redemption                          ', 1994, 142, N'English        ', CAST(N'1995-02-17' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (914, N'American Beauty                                   ', 1999, 122, N'English        ', NULL, N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (915, N'Titanic                                           ', 1997, 194, N'English        ', CAST(N'1998-01-23' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (916, N'Good Will Hunting                                 ', 1997, 126, N'English        ', CAST(N'1998-06-03' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (917, N'Deliverance                                       ', 1972, 109, N'English        ', CAST(N'1982-10-05' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (918, N'Trainspotting                                     ', 1996, 94, N'English        ', CAST(N'1996-02-23' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (919, N'The Prestige                                      ', 2006, 130, N'English        ', CAST(N'2006-11-10' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (920, N'Donnie Darko                                      ', 2001, 113, N'English        ', NULL, N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (921, N'Slumdog Millionaire                               ', 2008, 120, N'English        ', CAST(N'2009-01-09' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (922, N'Aliens                                            ', 1986, 137, N'English        ', CAST(N'1986-08-29' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (923, N'Beyond the Sea                                    ', 2004, 118, N'English        ', CAST(N'2004-11-26' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (924, N'Avatar                                            ', 2009, 162, N'English        ', CAST(N'2009-12-17' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (926, N'Seven Samurai                                     ', 1954, 207, N'Japanese       ', CAST(N'1954-04-26' AS Date), N'JP   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (927, N'Spirited Away                                     ', 2001, 125, N'Japanese       ', CAST(N'2003-09-12' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (928, N'Back to the Future                                ', 1985, 116, N'English        ', CAST(N'1985-12-04' AS Date), N'UK   ')
INSERT [Movie] ([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_rl_dt], [mov_rel_country]) VALUES (925, N'Braveheart                                        ', 1995, 178, N'English        ', CAST(N'1995-09-08' AS Date), N'UK   ')



SELECT * FROM [Movie]


INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (901, 101, N'John Scottie Ferguson         ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (902, 102, N'Miss Giddens                  ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (903, 103, N'T.E. Lawrence                 ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (904, 104, N'Michael                       ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (905, 105, N'Antonio Salieri               ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (906, 106, N'Rick Deckard                  ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (907, 107, N'Alice Harford                 ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (908, 108, N'McManus                       ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (910, 110, N'Eddie Adams                   ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (911, 111, N'Alvy Singer                   ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (912, 112, N'San                           ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (913, 113, N'Andy Dufresne                 ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (914, 114, N'Lester Burnham                ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (915, 115, N'Rose DeWitt Bukater           ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (916, 116, N'Sean Maguire                  ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (917, 117, N'Ed                            ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (918, 118, N'Renton                        ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (920, 120, N'Elizabeth Darko               ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (921, 121, N'Older Jamal                   ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (922, 122, N'Ripley                        ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (923, 114, N'Bobby Darin                   ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (909, 109, N'J.J. Gittes                   ')
INSERT [Movie_cast] ([mov_id], [act_id], [role]) VALUES (919, 119, N'Alfred Borden                 ')


SELECT * FROM [Movie_cast]

INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (901, 201)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (902, 202)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (903, 203)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (904, 204)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (905, 205)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (906, 206)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (907, 207)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (908, 208)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (909, 209)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (910, 210)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (911, 211)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (912, 212)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (913, 213)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (914, 214)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (915, 215)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (916, 216)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (917, 217)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (918, 218)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (919, 219)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (920, 220)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (921, 218)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (922, 215)
INSERT [Movie_Direction] ([mov_id], [dir_id]) VALUES (923, 221)


SELECT * FROM [Movie_Direction]

INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (922, 1001)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (917, 1002)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (903, 1002)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (912, 1003)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (911, 1005)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (908, 1006)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (913, 1006)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (926, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (928, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (918, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (921, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (902, 1008)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (923, 1009)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (907, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (927, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (901, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (914, 1011)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (906, 1012)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (904, 1013)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (922, 1001)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (917, 1002)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (903, 1002)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (912, 1003)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (911, 1005)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (908, 1006)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (913, 1006)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (926, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (928, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (918, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (921, 1007)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (902, 1008)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (923, 1009)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (907, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (927, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (901, 1010)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (914, 1011)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (906, 1012)
INSERT [Movie_Genres] ([mov_id], [gen_id]) VALUES (904, 1013)


SELECT * FROM [Movie_Genres]

INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (901, 9001, CAST(8.40 AS Numeric(4, 2)), 263575)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (902, 9002, CAST(7.90 AS Numeric(4, 2)), 20207)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (903, 9003, CAST(8.30 AS Numeric(4, 2)), 202778)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (906, 9005, CAST(8.20 AS Numeric(4, 2)), 484746)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (924, 9006, CAST(7.30 AS Numeric(4, 2)), NULL)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (908, 9007, CAST(8.60 AS Numeric(4, 2)), 779489)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (909, 9008, NULL, 227235)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (910, 9009, CAST(3.00 AS Numeric(4, 2)), 195961)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (911, 9010, CAST(8.10 AS Numeric(4, 2)), 203875)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (912, 9011, CAST(8.40 AS Numeric(4, 2)), NULL)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (914, 9013, CAST(7.00 AS Numeric(4, 2)), 862618)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (915, 9001, CAST(7.70 AS Numeric(4, 2)), 830095)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (916, 9014, CAST(4.00 AS Numeric(4, 2)), 642132)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (925, 9015, CAST(7.70 AS Numeric(4, 2)), 81328)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (918, 9016, NULL, 580301)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (920, 9017, CAST(8.10 AS Numeric(4, 2)), 609451)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (921, 9018, CAST(8.00 AS Numeric(4, 2)), 667758)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (922, 9019, CAST(8.40 AS Numeric(4, 2)), 511613)
INSERT [Rating] ([mov_id], [rev_id], [rev_stars], [num_o_ratings]) VALUES (923, 9020, CAST(6.70 AS Numeric(4, 2)), 13091)

SELECT * FROM [Rating]

INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9001, N'Righty Sock                   ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9002, N'Jack Malvern                  ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9003, N'Flagrant Baronessa            ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9004, N'Alec Shaw                     ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9005, NULL)
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9006, N'Victor Woeltjen               ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9007, N'Simon Wright                  ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9008, N'Neal Wruck                    ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9009, N'Paul Monks                    ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9010, N'Mike Salvati                  ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9011, NULL)
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9012, N'Wesley S. Walker              ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9013, N'Sasha Goldshtein              ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9014, N'Josh Cates                    ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9015, N'Krug Stillo                   ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9016, N'Scott LeBrun                  ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9017, N'Hannah Steele                 ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9018, N'Vincent Cadena                ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9019, N'Brandt Sponseller             ')
INSERT [Reviewer] ([rev_id], [rev_name]) VALUES (9020, N'Richard Adams                 ')

SELECT * FROM [Reviewer]



alter table [Rating]
add constraint FK_Rating_Movie_Id 
FOREIGN KEY ([mov_id]) REFERENCES movie([mov_id]) 


alter table [Rating]
add constraint FK_Rating_Reviewer_Id 
FOREIGN KEY ([rev_id]) REFERENCES Reviewer([rev_id]) 