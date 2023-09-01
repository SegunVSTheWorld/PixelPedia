BEGIN TRANSACTION;

DROP TABLE IF EXISTS comment_likes;
DROP TABLE IF EXISTS review_likes;
DROP TABLE IF EXISTS review_rating;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS vg_list;
DROP TABLE IF EXISTS vg_system;
DROP TABLE IF EXISTS vg_genre;
DROP TABLE IF EXISTS vg_studio;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS video_game;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS system;







CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	avatar_pic varchar(300),
	bio TEXT,
	steam_user_id int,
	email VARCHAR(320),
	tagline varchar(120),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);







CREATE TABLE company (
	company_id SERIAL,
	company_name varchar(300) NOT NULL,
	CONSTRAINT PK_company PRIMARY KEY (company_id)
);

CREATE TABLE video_game (
	id SERIAL,
	title varchar(150) NOT NULL,
	release_date DATE,
	release_price NUMERIC (15,2),
	description TEXT,
	publisher_id INT,
	rating varchar(50),
	box_art TEXT,
	steam_id int,
	CONSTRAINT PK_video_game PRIMARY KEY (id),
	CONSTRAINT FK_publisher FOREIGN KEY (publisher_id) REFERENCES company (company_id)
);

CREATE TABLE review (
    review_id SERIAL,
    user_id int,
    game_id int,
    review_txt TEXT NOT NULL,
    review_title varchar(100) NOT NULL,
    date_time DATE,
    CONSTRAINT PK_review_id PRIMARY KEY (review_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_game_id FOREIGN KEY (game_id) REFERENCES video_game(id)
);

CREATE TABLE comment (
    comment_id SERIAL,
    comment_txt TEXT,
    review_id int,
    user_id int,
    date_time DATE,

    CONSTRAINT PK_comment_id PRIMARY KEY (comment_id),
    CONSTRAINT FK_review_id FOREIGN KEY (review_id) REFERENCES review(review_id),
    CONSTRAINT FK_user_id  FOREIGN KEY (user_id) REFERENCES users(user_id)

);

CREATE TABLE review_rating (
    rating_id SERIAL,
    user_id int,
    game_id int,
    review_id  int,
    overall_rating int,
    story_rating int,
    visual_rating int,
    audio_rating int,
    gameplay_rating int,
    difficulty_rating int,

    CONSTRAINT CHK_overall CHECK (overall_rating >= 0 AND overall_rating <= 10),
    CONSTRAINT CHK_story CHECK (story_rating >= 0 AND overall_rating <=10 ),
    CONSTRAINT CHK_visual CHECK (visual_rating >=0 AND overall_rating <=10 ),
    CONSTRAINT CHK_audio CHECK (audio_rating >= 0 AND overall_rating <=10),
    CONSTRAINT CHK_gameplay CHECK (gameplay_rating >= 0 AND gameplay_rating <=10),
    CONSTRAINT CHK_difficulty CHECK (difficulty_rating >= 0 AND difficulty_rating <=10),
    CONSTRAINT PK_rating_id PRIMARY KEY(rating_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_game_id FOREIGN KEY (game_id) REFERENCES video_game(id),
    CONSTRAINT FK_review_id FOREIGN KEY (review_id) REFERENCES review(review_id)
);

CREATE TABLE review_likes (
    review_id int,
    user_id int,
    isLiked BIT,
    CONSTRAINT FK_review_id FOREIGN KEY (review_id) REFERENCES review(review_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comment_likes (
    comment_id int,
    user_id int,
    isLiked BIT,
    CONSTRAINT FK_comment_id FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE system (
	system_id SERIAL,
	system_name varchar(250) NOT NULL,
	manufacturer_id INT,
	CONSTRAINT PK_system_id PRIMARY KEY (system_id),
	CONSTRAINT FK_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES company (company_id)
);

CREATE TABLE vg_list (
    user_id int,
    list_name varchar(25) NOT NULL,
    vg_id int,
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_vg_id FOREIGN KEY (vg_id) REFERENCES video_game(id)
);


CREATE TABLE vg_system (
	vg_id INT,
	system_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_system FOREIGN KEY (system_id) REFERENCES system (system_id)
);

CREATE TABLE genre (
	genre_id SERIAL,
	genre_name varchar(250) NOT NULL,
	CONSTRAINT PK_genre_id PRIMARY KEY (genre_id)
);

CREATE TABLE vg_genre (
	vg_id INT,
	genre_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);

CREATE TABLE vg_studio (
	vg_id INT,
	studio_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_studio FOREIGN KEY (studio_id) REFERENCES company (company_id)
);

COMMIT TRANSACTION;
