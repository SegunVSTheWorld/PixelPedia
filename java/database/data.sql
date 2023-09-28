BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,  avatar_pic, bio, steam_user_id, email, tagline) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'https://blog.short.io/content/images/2018/01/short.cm-logo-1024x1024.png', 'This is a test Bio!', '1234567', 'google@google.com', 'This is a test tagline!' );
INSERT INTO users (username,password_hash,role, avatar_pic, bio, steam_user_id, email, tagline) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'https://blog.short.io/content/images/2018/01/short.cm-logo-1024x1024.png', 'This is a test Bio.', '5678910', 'bing@bing.com', 'This is a test tagline.' );

INSERT INTO company (company_name) VALUES ('Activision');   --1
INSERT INTO company (company_name) VALUES ('Nintendo');     --2
INSERT INTO company (company_name) VALUES ('Bungie');       --3
INSERT INTO company (company_name) VALUES ('Team Meat');    --4
INSERT INTO company (company_name) VALUES ('THQ');          --5
INSERT INTO company (company_name) VALUES ('Microsoft');    --6
INSERT INTO company (company_name) VALUES ('Sony');    --7
INSERT INTO company (company_name) VALUES ('SEGA');    --8
INSERT INTO company (company_name) VALUES ('Ubisoft');      -- 9
INSERT INTO company (company_name) VALUES ('Electronic Arts (EA)');   -- 10
INSERT INTO company (company_name) VALUES ('Square Enix');  -- 11
INSERT INTO company (company_name) VALUES ('Capcom');       -- 12
INSERT INTO company (company_name) VALUES ('Blizzard Entertainment');   -- 13
INSERT INTO company (company_name) VALUES ('Valve');        -- 14
INSERT INTO company (company_name) VALUES ('Epic Games');   -- 15
INSERT INTO company (company_name) VALUES ('Rockstar Games');   -- 16
INSERT INTO company (company_name) VALUES ('CD Projekt');   -- 17
INSERT INTO company (company_name) VALUES ('Bethesda Game Studios');   -- 18
INSERT INTO company (company_name) VALUES ('Konami');       -- 19
INSERT INTO company (company_name) VALUES ('BioWare');      -- 20
INSERT INTO company (company_name) VALUES ('Insomniac Games');   -- 21
INSERT INTO company (company_name) VALUES ('Kojima Productions');   -- 22
INSERT INTO company (company_name) VALUES ('Gearbox Software');   -- 23
INSERT INTO company (company_name) VALUES ('Ubisoft Montreal');   -- 24
INSERT INTO company (company_name) VALUES ('Respawn Entertainment');   -- 25
INSERT INTO company (company_name) VALUES ('Naughty Dog');    -- 26
INSERT INTO company (company_name) VALUES ('Riot Games');    -- 27
INSERT INTO company (company_name) VALUES ('2K Games');    -- 28
INSERT INTO company (company_name) VALUES ('BioWare');    -- 29
INSERT INTO company (company_name) VALUES ('Konami-test');    -- 30
INSERT INTO company (company_name) VALUES ('Obsidian Entertainment');    -- 31
INSERT INTO company (company_name) VALUES ('Turn 10 Studios');    -- 32
INSERT INTO company (company_name) VALUES ('Square Enix');    -- 33
INSERT INTO company (company_name) VALUES ('Insomniac Games');    -- 34
INSERT INTO company (company_name) VALUES ('Double Fine Productions');    -- 35
INSERT INTO company (company_name) VALUES ('Treyarch');    -- 36
INSERT INTO company (company_name) VALUES ('Crystal Dynamics');    -- 37
INSERT INTO company (company_name) VALUES ('id Software');    -- 38
INSERT INTO company (company_name) VALUES ('Monolith Productions');    -- 39
INSERT INTO company (company_name) VALUES ('Ubisoft Toronto');    -- 40
INSERT INTO company (company_name) VALUES ('505 Games');    -- 41
INSERT INTO company (company_name) VALUES ('Monolith Soft');    -- 42
INSERT INTO company (company_name) VALUES ('FromSoftware');    -- 43
INSERT INTO company (company_name) VALUES ('Sega AM2');    -- 44
INSERT INTO company (company_name) VALUES ('Rare');    -- 45
INSERT INTO company (company_name) VALUES ('Ubisoft Quebec');    -- 46
INSERT INTO company (company_name) VALUES ('Bioware Edmonton');    -- 47
INSERT INTO company (company_name) VALUES ('Namco Bandai Games');    -- 48
INSERT INTO company (company_name) VALUES ('Insomniac Games');    -- 49
INSERT INTO company (company_name) VALUES ('Crystal Dynamics');    -- 50
INSERT INTO company (company_name) VALUES ('Game Freak');    -- 51
INSERT INTO company (company_name) VALUES ('Midway Games');    -- 52
INSERT INTO company (company_name) VALUES ('Mojang Studios');    -- 53
INSERT INTO company (company_name) VALUES ('Bethesda Game Studios');    -- 54
INSERT INTO company (company_name) VALUES ('Avalanche Software');    -- 55
INSERT INTO company (company_name) VALUES ('Maxis');    -- 56
INSERT INTO company (company_name) VALUES ('Lionhead Studios');    -- 57
INSERT INTO company (company_name) VALUES ('Paradox Interactive');  --58
INSERT INTO company (company_name) VALUES ('Paradox Development Studio'); --59
INSERT INTO company (company_name) VALUES ('Colossal Order'); --60
INSERT INTO company (company_name) VALUES ('2k Games'); --61



INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Halo: Combat Evolved','2011-11-15', 60.00, 'This is Halo. It is a game.', 3, 'M','https://cdn.mobygames.com/covers/4079988-halo-combat-evolved-windows-other.jpg', 1);                              --1
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Super Mario Bros.', '1985-09-13', 60.00, 'This is Super Mario Bros. It is a game.', 2, 'E','https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/de10961b-5990-4053-b78f-eabbba03ae83/d7ndqiw-9b9e55e3-e573-47c6-bc70-4edfa3b89043.png/v1/fill/w_746,h_1072,q_75,strp/super_mario_bros_nes_cover_by_perrito_gatito-d7ndqiw.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi9kZTEwOTYxYi01OTkwLTQwNTMtYjc4Zi1lYWJiYmEwM2FlODMvZDduZHFpdy05YjllNTVlMy1lNTczLTQ3YzYtYmM3MC00ZWRmYTNiODkwNDMucG5nIiwid2lkdGgiOiI8PTc0NiIsImhlaWdodCI6Ijw9MTA3MiJ9XV19.mDrgffJcbbl5h5bVylez77M2zeW_MfJyGdcdDRiYCfg');     --2
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Super Meat Boy', '2010-10-20', 60.00, 'This is Super Meat Boy. It is a game.', 4, 'T','https://www.newgamenetwork.com/images/uploads/games/1294707829_supermeatboycover.png');          --3
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Tak and the Power of Juju', '2003-10-15', 60.00, 'This is Tak and the Power of Juju. It is a game.', 5, 'E','https://www.giantbomb.com/a/uploads/original/8/87790/2352270-box_tak.png');    --4



--Segun's newly added games
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 59.99, 'An open-world action-adventure game set in the fantasy realm of Hyrule. Players control Link as he explores the vast landscape, battles enemies, and solves puzzles.', 2, 'E10+','https://upload.wikimedia.org/wikipedia/en/c/c6/The_Legend_of_Zelda_Breath_of_the_Wild.jpg');    --5
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Spyro The Dragon', '1998-09-09', 39.99, 'A classic platformer where players guide the energetic purple dragon Spyro to rescue captured dragons and thwart the plans of the malevolent Gnasty Gnorc. Explore vibrant worlds, defeat foes, and save the dragon realm in this iconic adventure.', 7, 'E','https://upload.wikimedia.org/wikipedia/en/5/53/Spyro_the_Dragon.jpg');    --6
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Pokémon Emerald Version', '2005-05-01', 34.99, 'A role-playing video game set in the Hoenn region, where players embark on a journey to become a Pokémon Trainer. With an enhanced storyline and features compared to its predecessors, players capture and train various Pokémon while thwarting the schemes of the villainous Team Aqua and Team Magma.', 51, 'E','https://m.media-amazon.com/images/M/MV5BMDVhZTFiNDgtM2JhOC00YzMzLWFlYTUtN2Q5ODQ0ZmZmOGVmXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_FMjpg_UX1000_.jpg');    --7
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Fortnite', '2017-09-26', 00.00, 'Fortnite is a popular battle royale game that drops players onto a vibrant island where they fight to be the last one standing. With its distinct building mechanics, engaging gameplay, and constant updates, it offers a dynamic experience where players can team up, strategize, and outlast opponents in a fast-paced digital battleground. \n $19 Fornite card! Who wants it?! ' , 15, 'T','https://images.pushsquare.com/8bb5c9aed6792/fortnite-cover.cover_large.jpg');    --8
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Super Metroid', '1994-03-19', 59.99, 'Super Metroid is an action-adventure game developed by Nintendo and Intelligent Systems and published by Nintendo for the Super Nintendo Entertainment System in 1994. It is the third installment in the Metroid series, following the events of the Game Boy game Metroid II: Return of Samus.', 2, 'E','https://i.redd.it/uk64xazup0e01.jpg');    --9
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Mortal Kombat II', '1994-03-19', 59.99, 'Mortal Kombat 2 is a classic fighting game that builds on the success of its predecessor. Released in 1993, it features an expanded roster of characters, enhanced graphics, and new finishing moves known as "Fatalities." Players engage in intense one-on-one combat, utilizing a mix of martial arts and special abilities, as they strive to defeat opponents and emerge victorious in this iconic arcade fighter.', 52, 'M','https://upload.wikimedia.org/wikipedia/en/d/df/Mortal_Kombat_II_boxart.png?20210316000531');    --10
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Uncharted 2: Among Thieves', '2009-10-13', 59.99, 'This is an action-adventure game that takes players on a thrilling journey across exotic locations. Released in 2009, it follows the charismatic treasure hunter Nathan Drake as he embarks on a quest filled with perilous obstacles, epic set pieces, and cinematic storytelling. With its engaging narrative and dynamic gameplay, the game is celebrated for its immersive experience and remains a standout title in the Uncharted series.', 7, 'T','https://assets-prd.ignimgs.com/2021/12/10/uncharted2-1639126191037.jpeg?width=300&crop=1%3A1%2Csmart');    --11
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Valorant', '2020-04-07', 0.00, '"Valorant" is a tactical FPS by Riot Games where teams of agents with special abilities engage in strategic battles. Released in 2020, it blends precise gunplay with unique agent skills, creating a dynamic and competitive gaming experience.', 7, 'T','https://cdnportal.mobalytics.gg/production/2020/04/valorant-gun-splash.jpg');    --12
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('World Of Warcraft', '2004-11-23', 0.00, 'This is a massively multiplayer online role-playing game (MMORPG) by Blizzard Entertainment. Set in the high-fantasy world of Azeroth, players create characters from various races and classes, embarking on epic quests, battling monsters, and interacting with other players in a vast virtual world. With its immersive storytelling and social gameplay, WoW has become one of the most influential and enduring MMORPGs in gaming history.', 13, 'T','https://upload.wikimedia.org/wikipedia/en/f/fc/World_of_Warcraft_The_Burning_Crusade.png');    --13
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Duck Hunt', '1984-04-21', 0.00, '"Duck Hunt" is a classic light gun shooting game released by Nintendo in 1984. Initially available as a combo cartridge with the NES, it challenges players to take aim at flying ducks on the screen using the NES Zapper light gun accessory. With its simple yet addictive gameplay, players test their accuracy and reflexes by shooting down ducks and earning points.', 2, 'E','https://upload.wikimedia.org/wikipedia/en/1/14/DuckHuntBox.jpg');    --14
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('The Sims 4', '2014-09-02', 59.99, '"The Sims 4" is a popular life simulation game where players create, customize, and manage virtual characters lives and activities. Released in 2014, it offers creative freedom and diverse gameplay experiences in a virtual world.', 10, 'T','https://m.media-amazon.com/images/I/71otyq1xFNL.jpg');    --15
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Minecraft', '2011-11-18', 29.99, '"Minecraft" is a sandbox video game that offers players a world of limitless creativity and exploration. Released in 2011, it invites players to gather resources, craft tools and structures, and build their own virtual worlds block by block. With various game modes, including survival and creative, players can mine for resources, engage in combat, tame animals, and unleash their imagination to construct impressive structures and landscapes. ', 53, 'E','https://image.api.playstation.com/vulcan/img/cfn/11307uYG0CXzRuA9aryByTHYrQLFz-HVQ3VVl7aAysxK15HMpqjkAIcC_R5vdfZt52hAXQNHoYhSuoSq_46_MT_tDBcLu49I.png');    --16
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('The Elder Scrolls V: Skyrim', '2011-11-11', 59.99, 'An open-world action RPG released by Bethesda Game Studios in 2011. Set in the fantasy realm of Tamriel, players assume the role of the Dragonborn, a hero with the power to combat dragons and unravel a complex narrative. Famed for its expansive world, intricate quests, and modding community, "Skyrim" has left an indelible mark on the RPG genre ', 54, 'M','https://upload.wikimedia.org/wikipedia/en/1/15/The_Elder_Scrolls_V_Skyrim_cover.png?20120309212335');    --17
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Metal Gear Solid', '1998-09-03', 59.99, 'Critically acclaimed stealth-action video game developed by Konami. Released in 1998, players take on the role of Solid Snake, a skilled operative, as he navigates complex missions to thwart a nuclear threat. Known for its cinematic storytelling, tactical gameplay, and memorable characters, the game has been praised for its innovation and impact on the gaming industry.', 19, 'M','https://www.giantbomb.com/a/uploads/scale_small/45/459166/3252663-mgs.png');    --18
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Cyberpunk 2077', '2020-12-10', 59.99, 'An open-world action RPG developed by CD Projekt Red. Released in 2020, the game is set in a dystopian future where players assume the role of V, a mercenary navigating the bustling metropolis of Night City. With a focus on player choice, cybernetic enhancements, and a narrative-driven experience, the game explores themes of technology, society, and personal identity in a visually stunning and immersive world.', 17, 'M','https://i.ytimg.com/vi/Ld37nwZz1RQ/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgSyhAMA8=&rs=AOn4CLCvQCD4AzH5JVLLRsqwJ34xdzNyPw');    --19
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Punch-Out!!', '1987-10-18', 49.99, '"Punch-Out!!" is a classic boxing game from 1987 for the NES. Players control Little Mac, a determined fighter, as he takes on a series of quirky opponents in a quest for the championship title. Master timing and tactics to defeat opponents and become the boxing champion.', 2, 'T','https://m.media-amazon.com/images/I/51TK9HNJ3PL.jpg');    --20
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Fable', '2004-09-14', 49.99, 'Released in 2004, is an action role-playing game that invites players into the fantasy realm of Albion. Developed by Lionhead Studios, the game follows the journey of a young hero as they make moral choices that shape their destiny. With a dynamic world influenced by player actions, a rich storyline, and a focus on character customization and development, "Fable" offers players the chance to explore a vibrant and immersive fantasy universe where their decisions have far-reaching consequences.', 6, 'M','https://upload.wikimedia.org/wikipedia/en/5/5b/Fablebox.jpg');    --21
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Starcraft II: Wings Of Liberty', '2010-07-27', 59.99, 'A real-time strategy game developed by Blizzard Entertainment. Set in a distant future, the game offers three distinct factions – Terran, Zerg, and Protoss – each with their own unique units and strategies. With an engaging single-player campaign following Jim Raynors quest for justice, and a competitive multiplayer mode, the game is known for its deep strategy, balanced gameplay, and impactful storytelling. Its enduring popularity and professional esports scene have solidified its position as a cornerstone of the real-time strategy genre.', 13, 'T','https://upload.wikimedia.org/wikipedia/en/2/20/StarCraft_II_-_Box_Art.jpg');    --22
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Final Fantasy VII', '1997-01-31', 59.99, 'A classic Japanese role-playing game developed by Square Enix. Set in the fictional world of Gaia, the game follows Cloud Strife, a former soldier, and his allies as they band together to thwart the plans of the sinister Shinra Corporation. With a blend of turn-based combat, a captivating storyline, and memorable characters, the game explores themes of environmentalism and personal redemption. Its groundbreaking 3D graphics and emotional depth have made it a beloved and influential title in the RPG genre.', 33, 'T','https://m.media-amazon.com/images/M/MV5BMGMxZDliYTktZTRmYy00MDc5LTk1YjMtMGY4NTM4ZDYzYmY2XkEyXkFqcGdeQXVyNzUzNTQ2MjQ@._V1_.jpg');    --23
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Dark Souls II', '2014-03-11', 59.99, 'Released in 2014, is an action RPG developed by FromSoftware. Set in a dark fantasy world, players embark on a challenging journey as the Undead, facing formidable enemies and overcoming intricate traps. With a focus on punishing difficulty, intricate level design, and deep exploration, the game demands strategic combat, mastery of timing, and a willingness to learn from failures. Its atmospheric world and methodical gameplay have garnered both praise and a dedicated fan base, solidifying its reputation as a demanding and rewarding gaming experience.', 43, 'M', 'https://image.api.playstation.com/vulcan/img/rnd/202010/0919/KsbzaxvzYc4rhCpU5XcewIfn.png');    --24
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Portal 2', '2011-04-18', 59.99, 'Released in 2011, is a puzzle-platformer game developed by Valve Corporation. Building upon the success of its predecessor, the game introduces new mechanics, characters, and a deeper narrative. Players wield the Aperture Science Handheld Portal Device to create interdimensional portals, solving intricate puzzles and navigating through cleverly designed test chambers. With a mix of challenging puzzles, witty humor, and a compelling story, "Portal 2" offers a unique and engaging gaming experience that challenges players logic and creativity in a futuristic and mysterious setting.', 14, 'T','https://upload.wikimedia.org/wikipedia/en/f/f9/Portal2cover.jpg');    --25
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Animal Crossing: New Horizons', '2020-03-03', 59.99, 'a life simulation game that whisks players away to a deserted island paradise. Set in a tranquil and customizable world, players can gather resources, build structures, and create their dream island community. With its relaxed pace, charming characters, and creative freedom, the game offers a cozy escape where players can fish, catch bugs, design their surroundings, and connect with friends in a heartwarming digital getaway.', 2, 'E','https://m.media-amazon.com/images/I/7141W51gqML._AC_UF894,1000_QL80_.jpg');    --26


--Maurice's added games
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Sonic Chronicles: The Dark Brotherhood', '2008-09-30', 34.99 , 'A role-playing game in which players assume the roles of characters in a fictional setting', 29 , 'E',	'https://upload.wikimedia.org/wikipedia/en/9/99/The_Dark_Brotherhood.jpg');         -- 27
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Shenmue', '2000-11-08', 49.99, '"Shenmue" is an action-adventure video game developed by Sega AM2 and directed by Yu Suzuki. Set in a meticulously detailed open-world environment, the game is known for its immersive storytelling, dynamic gameplay, and ambitious scope.',44, 'T', 'https://assets1.ignimgs.com/2018/09/08/shenmue-1---button-1536367889315.jpg?width=300&crop=1%3A1%2Csmart');         -- 28
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Guardians of Middle-earth','2012-12-04',14.99, 'Guardians of Middle-earth is a multiplayer online battle arena (MOBA) video game developed by Monolith Productions.It was released on various gaming platforms',39,'T', 'https://upload.wikimedia.org/wikipedia/en/9/95/Guardians_of_MIddle-Earth_cover_art.jpg');           -- 29
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Blood Omen: Legacy of Kain (1996)','1996-11-15',	19.99, 'Legacy of Kain is a series of dark fantasy action-adventure video games primarily developed by Crystal Dynamics and formerly published by Eidos Interactive', 37,'M', 'https://lparchive.org/Blood-Omen-Legacy-of-Kain/Images/1-blood-omen.jpg');               --30
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Sunset Overdrive', '2018-11-16', 19.99, 'Sunset Overdrive is an open-world action-adventure game set in the fictional metropolis of Sunset City. Known for its vibrant and stylized visuals, the game offers a unique blend of fast-paced traversal, chaotic combat and humor',49, 'M', 'https://cdn.akamai.steamstatic.com/steam/apps/847370/header.jpg?t=1667851405');            --31

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Tales of Vesperia', '2008-08-07', 12.59,'Tales of Vesperia" is an action role-playing game (RPG) developed by Namco Tales Studio (formerly known as Wolf Team) and published by Namco Bandai Games', 48,'T','https://cdn.akamai.steamstatic.com/steam/apps/738540/header.jpg?t=1630387563'); -- 32
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Assassins creed brotherhood','2010-11-16', 19.99,'Assassins Creed: Brotherhood is an action-adventure video game developed by Ubisoft Montreal and released in 2010',46, 'M','https://upload.wikimedia.org/wikipedia/en/2/2a/Assassins_Creed_brotherhood_cover.jpg'); -- 33
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Legends of Runeterra', '2020-04-29',0.00,  'Legends of Runeterra is a free-to-play digital collectible card game (CCG) developed and published by Riot Games. Released in April 2020, the game is set in the rich and diverse universe of League of Legends, Riot Games flagship multiplayer online battle arena (MOBA) title. Legends of Runeterra offers players a unique and strategic card-battling experience that combines elements of deck building, tactics, and deep lore from the League of Legends world', 27, 'T','https://gepig.com/game_cover_460w/6323.jpg');    -- 34
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Star Wars Jedi: Fallen Order', '2019-11-15', 59.99, 'Star Wars Jedi: Fallen Order is an action-adventure video game developed by Respawn Entertainment and published by Electronic Arts. Released in November 2019, the game is set in the expansive Star Wars universe and offers players the opportunity to experience a compelling single-player story-driven adventure',10, 'T', 'https://lumiere-a.akamaihd.net/v1/images/swjfo-key-art-deluxe-main-1280_6_e0eb3289.jpeg?region=0%2C0%2C768%2C562');   -- 35
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Borderlands', '2009-10-20', 59.99, 'The first game in the series introduces players to the planet Pandora, a lawless and dangerous world filled with hostile creatures and bandits. Players choose from one of four playable Vault Hunters, each with their own unique skills and abilities. The game focuses on the hunt for an alien Vault said to contain valuable treasures', '28','M','https://cdn1.epicgames.com/offer/catnip/EGS_Borderlands3_Takeover_Mobile-560x760-58be14c3e086e3a85bedcc21c08ab5cb-560x760-58be14c3e086e3a85bedcc21c08ab5cbjpg_560x760-58be14c3e086e3a85bedcc21c08ab5cb');   --36
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Sekiro: Shadows Die Twice', '2019-03-22', 59.99,'Sekiro: Shadows Die Twice is an action-adventure video game developed by FromSoftware and published by Activision. Released in 2019, the game offers a departure from the traditional Soulsborne formula that FromSoftware is known for, while still retaining the studios signature challenging gameplay, deep world-building, and intricate storytelling', 43, 'M', 'https://cdn.cloudflare.steamstatic.com/steam/apps/814380/capsule_616x353.jpg?t=1678991267'); -- 37
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Conkers Bad Fur Day', '2001-03-05', 69.99, 'Conkers Bad Fur Day is an action-adventure video game developed by Rare and released for the Nintendo 64 console in 2001. The game is known for its irreverent humor, mature themes, and unique gameplay mechanics', 5, 'M', 'https://light-in-the-attic.s3.amazonaws.com/uploads/release_image/21477/image/large_550_tmp_2F1513643297834-cx3o8ku46k-ecc11546973d6e6e053a17d4948402eb_2F850971008105.png');       -- 38
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('The Elder Scrolls V: Skyrim - Special Edition','2016-10-28', 39.99, 'The Elder Scrolls V: Skyrim - Special Edition is an enhanced and remastered version of the critically acclaimed open-world role-playing game developed by Bethesda Game Studios. Released in 2016 for various platforms, the Special Edition offers a range of technical improvements, graphical enhancements',18,'M', 'https://cdn.mobygames.com/promos/8181469-the-elder-scrolls-v-skyrim-special-edition-magazine-advertisemen.jpg');     --39
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('NBA 2K14','2013-10-01', 59.99,'"NBA 2K14" is a basketball video game released in 2013. Its known for its realistic graphics and gameplay, offering modes like "MyCareer" where players create and guide a custom players NBA journey. The game also features "MyTeam" mode for building custom teams with virtual trading cards. It received praise for realism but also criticism for its microtransactions. Overall, its a significant entry in the NBA 2K series, providing an immersive NBA experience on various gaming platforms.',61, 'E', 'https://e.snmc.io/lk/f/x/3a8ac94135e94f893da827851855c3a8/8597653');     --40
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Death Stranding', '2019-11-08',44.99, 'Death Stranding is an action-adventure game set in a post-apocalyptic world, featuring exploration, delivery mechanics, and a strong emphasis on storytelling and connections', 22, 'M','https://upload.wikimedia.org/wikipedia/en/2/22/Death_Stranding.jpg');   -- 41
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Teenage Mutant Ninja Turtles', '2014-10-21', 39.99,'"Teenage Mutant Ninja Turtles" is a live-action film released in 2014 that serves as a reboot of the Teenage Mutant Ninja Turtles movie franchise', 30, 'T',  	'https://prd-rteditorial.s3.us-west-2.amazonaws.com/wp-content/uploads/2023/05/31113412/EWKA_Ninja_Turtles_Mutant_Mayhem2.jpg');        --42
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Apex Legends', '2019-02-04', 0.00, 'Apex Legends is a free-to-play battle royale game developed by Respawn Entertainment and published by Electronic Arts. Set in the Titanfall universe (though without the giant Titans themselves', 25, 'T', 'https://www.charlieintel.com/cdn-cgi/image/width=640,quality=75,format=auto/https://editors.charlieintel.com/wp-content/uploads/2022/04/does-apex-legends-have-sbmm.jpg'); -- 43
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('The Last of Us', '2013-06-14', 59.99, 'The Last of Us is a critically acclaimed action-adventure video game developed by Naughty Dog and published by Sony Computer Entertainment. Originally released in 2013 for the PlayStation 3, the game was later remastered for the PlayStation 4. It is known for its emotionally charged narrative, compelling characters, and intense gameplay', 26, 'M', 'https://media.gamestop.com/i/gamestop/10114511/The-Last-of-Us-Remastered---PlayStation-4?$pdp$$&fmt=webp');    --44
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Aliens: Colonial Marines', '2013-02-12', 59.99, '"Aliens: Colonial Marines" is a first-person shooter video game developed by Gearbox Software and published by Sega. It was released in February 2013 for various platforms, including PlayStation 3, Xbox 360, and Microsoft Windows', 23, 'M', 'https://scale.coolshop-cdn.com/product-media.coolshop-cdn.com/AK6RY5/de1bb44261e04aa8b9504a2223bce894.jpg/f/aliens-colonial-marines-collection.jpg?height=650');             ---450
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Grand Theft Auto: Chinatown Wars', '2009-03-17', 34.99, 'Grand Theft Auto: Chinatown Wars–players assume the role of Huang Lee, a young member of the Chinese Triad crime syndicate, who arrives in Liberty City after the murder of his father. The game follows Huangs attempts to uncover the truth behind his fathers death while navigating the criminal underworld and engaging in various illegal activities', 16, 'M', 'https://assets-prd.ignimgs.com/2022/01/07/grand-theft-auto-chinatown-wars-button-char-1641587533817.jpg?width=300&crop=1%3A1%2Csmart');       -- 46
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Terraria', '2011-05-16', 9.99,'Terraria is a popular sandbox adventure game developed by Re-Logic and published by 505 Games.	The game combines elements of exploration, building, crafting, and combat to create a unique and immersive experience', 41, 'T', 	'https://d1wgd08o7gfznj.cloudfront.net/uploads/email_campaign/hero_image/21923/optimized_cover.png');       -- 47
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Warcraft III: The Frozen Throne', '2003-07-01', 29.99, 'Warcraft III: The Frozen Throne is an expansion pack for the critically acclaimed real-time strategy game "Warcraft III: Reign of Chaos, developed and published by Blizzard Entertainment. It was released in July 2003 and continues the story of the original game while introducing new gameplay features, units, and campaigns', 13, 'T','https://howlongtobeat.com/games/250px-Warcraftiii-frozen-throne-boxcover.jpg?width=760');        -- 48
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Prince of Persia: The Two Thrones', '2005-12-01', 39.99,'"Prince of Persia: The Two Thrones" is an action-adventure video game developed and published by Ubisoft Montreal. It is the third and final installment in the "Sands of Time" trilogy, following "Prince of Persia: The Sands of Time" and "Prince of Persia: Warrior Within',24, 'M',  'https://m.media-amazon.com/images/I/71zn0M0It-L._SL1087_.jpg' );       -- 49
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES('Pac-Man 256', '2015-08-19', 4.99,  'Pac-Man 256 is an endless maze runner video game developed by Hipster Whale and published by Bandai Namco Entertainment. It was originally released for mobile devices in 2015 and later for other platforms', 48, 'T', 'https://www.gamespot.com/a/uploads/original/280/2802776/2925392-key_art_02_1438755552.jpg');   -- 50


--Jeff's added games
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Europa Universalis IV', '2013-08-13', 39.99, 'Europa Universalis IV gives you control of a nation through four dramatic centuries. Rule your land and dominate the world with unparalleled freedom, depth and historical accuracy. Write a new history of the world and build an empire for the ages.', 58, 'T', 'https://m.media-amazon.com/images/I/817pmfOZsTL._AC_UF1000,1000_QL80_.jpg', 236850);   --51
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Victoria 3', '2022-10-25', 49.99, 'Paradox Development Studio invites you to build your ideal society in the tumult of the exciting and transformative 19th century. Balance the competing interests in your society and earn your place in the sun in Victoria 3, one of the most anticipated games in Paradox’s history.', 58, 'T', 'https://upload.wikimedia.org/wikipedia/en/f/fb/Victoria_3_cover_art.jpg', 529340);    --52
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Crusader Kings III', '2020-09-01', 49.99, 'Love, fight, scheme, and claim greatness. Determine your noble house’s legacy in the sprawling grand strategy of Crusader Kings III. Death is only the beginning as you guide your dynasty’s bloodline in the rich and larger-than-life simulation of the Middle Ages.', 58, 'T', 'https://upload.wikimedia.org/wikipedia/en/a/a3/Crusader_Kings_III.jpg', 1158310);  --53
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Stellaris', '2016-05-09', 39.99, 'Explore a galaxy full of wonders in this sci-fi grand strategy game from Paradox Development Studios. Interact with diverse alien races, discover strange new worlds with unexpected events and expand the reach of your empire. Each new adventure holds almost limitless possibilities.', 58, 'T', 'https://upload.wikimedia.org/wikipedia/en/b/bd/Stellaris_cover.png', 281990); --54
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) VALUES ('Cities: Skylines', '2015-03-10', 29.99, 'Cities: Skylines is a modern take on the classic city simulation. The game introduces new game play elements to realize the thrill and hardships of creating and maintaining a real city whilst expanding on some well-established tropes of the city building experience.', 58, 'E', 'https://m.media-amazon.com/images/M/MV5BNmM3NGMyNzYtN2MzNi00MGFjLTliYjQtN2M4MWRjOWM4Zjk1XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_FMjpg_UX1000_.jpg', 255710); --55


INSERT INTO genre (genre_name) VALUES ('Platformer');   --1
INSERT INTO genre (genre_name) VALUES ('First Person Shooter');          --2
INSERT INTO genre (genre_name) VALUES ('Real Time Strategy');          --3
INSERT INTO genre (genre_name) VALUES ('Twin-Stick Shooter');          --4
INSERT INTO genre (genre_name) VALUES ('Arcade Game');          --5
INSERT INTO genre (genre_name) VALUES ('2D');          --6
INSERT INTO genre (genre_name) VALUES ('3D');          --7
INSERT INTO genre (genre_name) VALUES ('Indie');          --8
INSERT INTO genre (genre_name) VALUES ('Role Playing Game');          --9
INSERT INTO genre (genre_name) VALUES ('Adventure');          --10
INSERT INTO genre (genre_name) VALUES ('Rhythm');          --11
INSERT INTO genre (genre_name) VALUES ('FORTNITEEE');          --12
INSERT INTO genre (genre_name) VALUES ('Battle Royale');          --13
INSERT INTO genre (genre_name) VALUES ('Puzzle Game');          --14
INSERT INTO genre (genre_name) VALUES ('MMO');          --15
INSERT INTO genre (genre_name) VALUES ('Souls-like');          --16
INSERT INTO genre (genre_name) VALUES ('Simulation');          --17
INSERT INTO genre (genre_name) VALUES ('Racing');          --18
INSERT INTO genre (genre_name) VALUES ('Sports Game');          --19
INSERT INTO genre (genre_name) VALUES ('Card Game');          --20
INSERT INTO genre (genre_name) VALUES ('Trivia');          --21
INSERT INTO genre (genre_name) VALUES ('Tactical FPS');          --22
INSERT INTO genre (genre_name) VALUES ('Education');          --23
INSERT INTO genre (genre_name) VALUES ('Exercise');          --24
INSERT INTO genre (genre_name) VALUES ('Party');          --25
INSERT INTO genre (genre_name) VALUES ('Fighting');          --26
INSERT INTO genre (genre_name) VALUES ('Shooter');          --27
INSERT INTO genre (genre_name) VALUES ('Strategy');         --28



INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 2);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (2, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (3, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (4, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 4);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 5);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 3);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (5, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (5, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (6, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (6, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (7, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (7, 17);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (8, 12);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (8, 13);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (8, 4);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (9, 6);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (9, 4);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (10, 26);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (10, 6);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (11, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (11, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (12, 2);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (12, 22);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (13, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (13, 15);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (13, 9);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (14, 5);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (15, 17);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (16, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (17, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (17, 9);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (18, 7);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (18, 5);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (19, 27);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (19, 2);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (20, 5);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (21, 9);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (22, 17);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (22, 3);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (23, 10);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (23, 17);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (24, 9);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (24, 16);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (25, 14);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (25, 11);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (26, 25);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (51, 28);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (52, 28);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (53, 28);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (54, 28);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (55, 17);



INSERT INTO system (system_name, manufacturer_id) VALUES ('NES', 2);    --1
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox', 6);   --2
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox 360', 6);   --3
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox One', 6);   --4
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation', 7);   --5
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 2', 7);   --6
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 3', 7);   --7
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 4', 7);   --8
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 5', 7);   --9
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation Portable', 7);   --10
INSERT INTO system (system_name, manufacturer_id) VALUES ('Game Boy Advance', 2);   --11
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo Switch', 2);   --12
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo DS', 2);   --13
INSERT INTO system (system_name, manufacturer_id) VALUES ('Gamecube', 2);   --14
INSERT INTO system (system_name, manufacturer_id) VALUES ('SNES', 2);   --15
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo Wii', 2);   --16
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo 64', 2);   --17
INSERT INTO system (system_name, manufacturer_id) VALUES ('Genesis', 8);   --18
INSERT INTO system (system_name, manufacturer_id) VALUES ('Dreamcast', 8);   --19
INSERT INTO system (system_name, manufacturer_id) VALUES ('Saturn', 8);   --20
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nomad', 8);   --21
INSERT INTO system (system_name, manufacturer_id) VALUES ('32X', 8);   --22
INSERT INTO system (system_name, manufacturer_id) VALUES ('SEGA CD', 8);   --23
INSERT INTO system (system_name, manufacturer_id) VALUES ('Game Gear', 8);   --24
INSERT INTO system (system_name, manufacturer_id) VALUES ('PC', 6);   --25
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo Wii U', 2);   --26


INSERT INTO vg_system (vg_id, system_id) VALUES (2, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (1, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (3, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (3, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (3, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (3, 12);
INSERT INTO vg_system (vg_id, system_id) VALUES (4, 14);
INSERT INTO vg_system (vg_id, system_id) VALUES (4, 11);
INSERT INTO vg_system (vg_id, system_id) VALUES (4,6);
INSERT INTO vg_system (vg_id, system_id) VALUES (5,26);
INSERT INTO vg_system (vg_id, system_id) VALUES (5,12);
INSERT INTO vg_system (vg_id, system_id) VALUES (6,5);
INSERT INTO vg_system (vg_id, system_id) VALUES (7,11);
INSERT INTO vg_system (vg_id, system_id) VALUES (8,25);
INSERT INTO vg_system (vg_id, system_id) VALUES (8,8);
INSERT INTO vg_system (vg_id, system_id) VALUES (8,9);
INSERT INTO vg_system (vg_id, system_id) VALUES (8,12);
INSERT INTO vg_system (vg_id, system_id) VALUES (8, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (9, 15);
INSERT INTO vg_system (vg_id, system_id) VALUES (10, 15);
INSERT INTO vg_system (vg_id, system_id) VALUES (11, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (12, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (13, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (14, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (15, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (15, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (15, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (16, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (17, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (17, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (17, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (17, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (17, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (18, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (18, 5);
INSERT INTO vg_system (vg_id, system_id) VALUES (19, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (19, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (19, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (19, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (19, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (20, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (21, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (21, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (21, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (22, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (23, 5);
INSERT INTO vg_system (vg_id, system_id) VALUES (24, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (24, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (24, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (24, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (25, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (25, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (25, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (25, 12);
INSERT INTO vg_system (vg_id, system_id) VALUES (26, 12);
INSERT INTO vg_system (vg_id, system_id) VALUES (27, 13);
INSERT INTO vg_system (vg_id, system_id) VALUES (27, 26);
INSERT INTO vg_system (vg_id, system_id) VALUES (28, 19);
INSERT INTO vg_system (vg_id, system_id) VALUES (28, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (28, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (29, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (29, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (30, 5);
INSERT INTO vg_system (vg_id, system_id) VALUES (31, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (32, 12);
INSERT INTO vg_system (vg_id, system_id) VALUES (33, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (33, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (34, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (35, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (35, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (35, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (35, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (36, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (36, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (37, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (37, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (38, 17);
INSERT INTO vg_system (vg_id, system_id) VALUES (39, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (39, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (40, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (40, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (41, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (41, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (42, 6);
INSERT INTO vg_system (vg_id, system_id) VALUES (42, 14);
INSERT INTO vg_system (vg_id, system_id) VALUES (42, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (42, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 12);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (43, 3);
INSERT INTO vg_system (vg_id, system_id) VALUES (44, 7);
INSERT INTO vg_system (vg_id, system_id) VALUES (44, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (44, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (45, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (45, 9);
INSERT INTO vg_system (vg_id, system_id) VALUES (45, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (46, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (46, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (46, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (47, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (48, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (49, 6);
INSERT INTO vg_system (vg_id, system_id) VALUES (49, 14);
INSERT INTO vg_system (vg_id, system_id) VALUES (49, 2);
INSERT INTO vg_system (vg_id, system_id) VALUES (50, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (50, 4);
INSERT INTO vg_system (vg_id, system_id) VALUES (50, 8);
INSERT INTO vg_system (vg_id, system_id) VALUES (51, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (52, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (53, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (54, 25);
INSERT INTO vg_system (vg_id, system_id) VALUES (55, 25);


INSERT INTO vg_studio (vg_id, studio_id) VALUES (1, 3);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (2, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (3, 4);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (4, 55);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (5, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (6, 21);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (7, 51);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (8, 15);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (9, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (10, 52);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (10, 55);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (11, 26);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (12,27);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (13,13);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (14,2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (15,56);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (16,53);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (17,54);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (18,22);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (19,17);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (20,2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (21,57);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (22,13);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (23,11);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (24, 43);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (25, 14);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (26, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (51, 59);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (52, 59);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (53, 59);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (54, 59);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (55, 60);


INSERT INTO review (review_id, review_txt, review_title) VALUES (0, 'Test', 'Test');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,1, 'This is test text. Man this game is so fun!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,2, 'This is test text. BRUH this game is so fun!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so bad!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,4, 'This is test text. Man this game is so good!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so boring!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so lame! DONT BUY', 'This Is Test Title!', '2023-01-01');


INSERT into review_likes(review_id, user_id, isliked) VALUES (1, 1, '0');
INSERT into review_likes(review_id, user_id, isliked) VALUES (2, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (3, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (4, 1, '0');
INSERT into review_likes(review_id, user_id, isliked) VALUES (5, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (6, 1, '0');

INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco & Jeff!!', 1,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Jeff!!', 1,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco!!', 2,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Jeff & Rocco!!', 3,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco & Jeff!!', 4,1, '2023-10-10');


INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (1, 1, '1');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (2, 1, '0');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (3, 1, '0');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (4, 1, '1');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (5, 1, '1');


INSERT INTO review_rating(user_id, game_id, review_id, overall_rating, story_rating, visual_rating, audio_rating, gameplay_rating, difficulty_rating) VALUES (1, 1, 1, 10, 10, 10, 10, 10, 5);
INSERT INTO review_rating(user_id, game_id, review_id, overall_rating, story_rating, visual_rating, audio_rating, gameplay_rating, difficulty_rating) VALUES (1, 2, 2, 9, 7, 10, 9, 8, 10);
INSERT INTO review_rating(user_id, game_id, review_id, overall_rating, story_rating, visual_rating, audio_rating, gameplay_rating, difficulty_rating) VALUES (1, 3, 3, 2, 0, 0, 1, 4, 3);
INSERT INTO review_rating(user_id, game_id, review_id, overall_rating, story_rating, visual_rating, audio_rating, gameplay_rating, difficulty_rating) VALUES (1, 4, 4, 8, 6, 4, 2, 7, 3);

INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Played', 10);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Played', 20);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Played', 12);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Played', 5);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Currently', 3);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Currently', 4);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Currently', 1);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Wishlist', 11);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Wishlist', 17);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Wishlist', 32);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Wishlist', 44);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Custom', 50);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Custom', 47);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Custom', 42);
INSERT INTO vg_list (user_id, list_name, vg_id) VALUES (1, 'Custom',36);


COMMIT TRANSACTION;
