DROP DATABASE IF EXISTS animalCrossing;
CREATE DATABASE animalCrossing;
USE animalCrossing;

CREATE TABLE ac_user
(
	username			VARCHAR(40)		PRIMARY KEY,
    pword				VARCHAR(40)		NOT NULL,
    character_name		VARCHAR(40)		NOT NULL,
    account_bal			INT 			NOT NULL,
    CHECK (account_bal >= 0)
);
INSERT INTO ac_user VALUES ("emma", "1234", "thepriceisright", 1000), ("emily", "5678", "emily", 2000);

CREATE TABLE style
(
	style	VARCHAR(40)		PRIMARY KEY 	DEFAULT 'BASIC'
);
INSERT INTO style VALUES ("cute"), ("goth"), ("basic");

CREATE TABLE color
(
	color	VARCHAR(40)		PRIMARY KEY		DEFAULT 'WHITE'
);
INSERT INTO color VALUES ("red"), ("plaid"), ("white");

-- USE ON DEFAULT
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
INSERT INTO villager VALUES ("todd", "2001-01-02", "goth", "plaid"), ("stacy", "2002-12-03", "cute", "red");

CREATE TABLE item
(
	itemName	VARCHAR(40)		PRIMARY KEY,
    cost 		INT				NOT NULL,
    style		VARCHAR(40),
    CONSTRAINT item_style_fk FOREIGN KEY (style) REFERENCES style(style)
		ON UPDATE SET NULL
        ON DELETE SET NULL
);
INSERT INTO item VALUES ("tshirt", 100, "goth"), 
						("pants", 150, "cute"), 
                        ("couch", 500, "goth"),
                        ("chair", 400, "cute");

CREATE TABLE clothing
(
	clothingName	VARCHAR(40),
    length			INT,
    CONSTRAINT clothing_item_fk FOREIGN KEY (clothingName) REFERENCES item(itemName)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
INSERT INTO clothing VALUES ("tshirt", 40), ("pants", 50);

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
INSERT INTO furniture VALUES ("couch", "red", "plaid"), ("chair", "white", "red");

CREATE TABLE userItems
(
	username 	VARCHAR(255),
    item		VARCHAR(255),
    CONSTRAINT ui_user_fk FOREIGN KEY (username) REFERENCES ac_user(username),
    CONSTRAINT ui_item_fk FOREIGN KEY (item) REFERENCES item(itemName)
);








