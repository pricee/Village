DROP DATABASE IF EXISTS village;
CREATE DATABASE village;
USE village;

CREATE TABLE users
(
	username			VARCHAR(40)		PRIMARY KEY,
    pword				VARCHAR(40)		NOT NULL,
    character_name		VARCHAR(40)		NOT NULL,
    account_bal			INT 			NOT NULL,
    total_items 		INT 			NOT NULL,
    CHECK (account_bal >= 0),
    CHECK (total_items >= 0)
);
INSERT INTO users VALUES ("emma", "1234", "thepriceisright", 0,0), ("emily", "5678", "emily", 0,0);

CREATE TABLE style
(
	style	VARCHAR(40)		PRIMARY KEY 	DEFAULT 'BASIC'
);

CREATE TABLE color
(
	color	VARCHAR(40)		PRIMARY KEY		DEFAULT 'WHITE'
);

CREATE TABLE villager
(
	villager_name	VARCHAR(40)		PRIMARY KEY,
    birthday		DATE			NOT NULL,
    preferred_style	VARCHAR(40)		NOT NULL,
    preferred_color	VARCHAR(40)		NOT NULL,
    CONSTRAINT vil_style_fk FOREIGN KEY (preferred_style) REFERENCES style(style)
		ON UPDATE NO ACTION
        ON DELETE NO ACTION,
	CONSTRAINT vil_color_fk FOREIGN KEY (preferred_color) REFERENCES color(color)
		ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE item
(
	itemName	VARCHAR(40)		PRIMARY KEY,
    cost 		INT				NOT NULL,
    style		VARCHAR(40),
    CONSTRAINT item_style_fk FOREIGN KEY (style) REFERENCES style(style)
		ON UPDATE SET NULL
        ON DELETE SET NULL
);

CREATE TABLE clothing
(
	clothingName	VARCHAR(40),
    length			INT,
    CONSTRAINT clothing_item_fk FOREIGN KEY (clothingName) REFERENCES item(itemName)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE furniture
(
	furnitureName	VARCHAR(40),
    color1			VARCHAR(40),
    color2			VARCHAR(40),
    CONSTRAINT furniture_item_fk FOREIGN KEY (furnitureName) REFERENCES item(itemName)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT furniture_color_fk FOREIGN KEY (color1) REFERENCES color(color)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE userItems
(
	username 	VARCHAR(255),
    item		VARCHAR(255),
    CONSTRAINT ui_user_fk FOREIGN KEY (username) REFERENCES users(username)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT ui_item_fk FOREIGN KEY (item) REFERENCES item(itemName)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);








