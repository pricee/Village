USE village;
-- returns true if login successful, false if unsuccessful
DROP FUNCTION IF EXISTS login;
DELIMITER $$
CREATE FUNCTION login
(
	usernm		VARCHAR(40),
    pass		VARCHAR(40)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	RETURN (SELECT pword FROM users WHERE usernm = username) = pass;
END$$
DELIMITER ;

PREPARE tryLogin FROM 'SELECT login(?,?)';

-- adds a user
DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$
CREATE PROCEDURE addUser 
(
	username		VARCHAR(40),
    pword			VARCHAR(40),
    characterName	VARCHAR(40)
)
BEGIN
	INSERT INTO users VALUES (username, pword, characterName, 0);
END$$
DELIMITER ;

-- gives money to user every 5 minutes
/*DROP TRIGGER IF EXISTS payUsers;
DELIMITER $$
CREATE TRIGGER payUsers
AFTER */

DROP FUNCTION IF EXISTS buyItem;
DELIMITER $$
CREATE FUNCTION buyItem
(
	item		VARCHAR(40),
    usernm	VARCHAR(40)
)
RETURNS VARCHAR(40)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE accountBal INT;
    DECLARE itemCost INT;
    SET accountBal = (SELECT account_bal FROM users WHERE username = usernm);
    SET itemCost = (SELECT cost FROM item WHERE itemName = item);
	IF itemCost <= accountBal THEN 
        INSERT INTO userItems VALUES (usernm, item);
        UPDATE users SET account_bal = accountBal - itemCost WHERE username = usernm;
        RETURN "Item bought!";
    ELSE 
		RETURN "You don't have enough money!";
	END IF;
END$$
DELIMITER ;

-- does the given villager like the given item?
DROP FUNCTION IF EXISTS villagerLikes;
DELIMITER $$
CREATE FUNCTION villagerLikes
(
	villagerName 	VARCHAR(255),
    item			VARCHAR(255)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE itemStyle VARCHAR(255);
    DECLARE itemColor1 VARCHAR(255);
    DECLARE itemColor2 VARCHAR(255);
    DECLARE villagerStyle VARCHAR(255);
    DECLARE villagerColor VARCHAR(255);
    SET itemStyle = (SELECT style FROM item WHERE item = itemName);
    SET itemColor1 = (SELECT color1 FROM item JOIN furniture ON itemName = furnitureName WHERE item = itemName);
    SET itemColor2 = (SELECT color2 FROM item JOIN furniture ON itemName = furnitureName WHERE item = itemName);
    SET villagerStyle = (SELECT preferred_style FROM villager WHERE villagerName = villager_name);
    SET villagerColor = (SELECT preferred_color FROM villager WHERE villagerName = villager_name);
    RETURN itemStyle = villagerStyle OR itemColor1 = villagerColor OR itemColor2 = villagerColor;
END$$
DELIMITER ;

-- gives item to villager
DROP FUNCTION IF EXISTS giveToVillager;
DELIMITER $$
CREATE FUNCTION giveToVillager
(
	villagerName	VARCHAR(40),
    userNm			VARCHAR(40),
    itemName			VARCHAR(40)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DELETE FROM userItems WHERE username = userNm AND item = itemName;
    RETURN (SELECT villagerLikes(villagerName,itemName));
END$$
DELIMITER ;






