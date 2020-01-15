# Village
A game where a user lives in a village
README:
We used JDBC for our application.
Put your SQL username and password in the application code where the TODO method is and change the connection url if needed. 
Run the main method.

Technical Specifications:
We used MySQL for our backend and Java for our front-end, using the console as our point of entry for a user
Each user of Village has a username and password for signing into the game and a name they give their character. They also have a bank account balance and a number keeping track of how many items they own. All of these cannot be null. Within the game, there are also villagers that are controlled by the computer. Each villager has a name, birthday, preferred style, and preferred color, which all cannot be null. 
A user can buy and own items. Each item has a name and a cost, which cannot be null, and additionally may have a particular style (must be from the style table). An item is either a piece of clothing or furniture. A piece of clothing has an attributed length, and a piece of furniture has two colors.
A user can purchase an item if they have enough money in their bank account and room in their inventory (16 items).
Users get paid by going fishing. They can catch one of four types of fish or no fish at all. Each fish corresponds to a dollar value, and that is added to their account balance

User Flow:
Login: Allows a user to log in to their account
AddUser: Allows a user to create a new account
DeleteUser: Allows a user to delete their account
BuyItem: Allows a user to buy an item
GiveItem: Allows a user to give an item to a villager
Fish: Allows a user to earn money through fishing
AccountDetails: Allows a user to see their account details such as their username, account balance, furniture, and clothing
VillagerInfo: Shows all villagers in your town, their birthday, favorite color, and favorite style

Lessons Learned:
We learned how to make a useful application using a SQL database
We learned a little bit about html because the items from the csv’s are parsed from other databases  online. Originally, we included all the items in animal crossing and all the villagers but that was just too much data to neatly show. 
Alternative design:
Originally we wanted to include different towns. In animal crossing every user has their own town that can have up to 10 non-player character (NPC) villagers and 4 player-character users in the town.  However, that was really difficult for us to implement as we’d have to limit characters and villagers, and it was just significantly easier for us to have one big town. 

Further Work:
Besides playing our application for fun, because of copyright issues we probably won’t pursue this project much further. If we change all our data to be our own and not Animal Crossing’s data, however, it might be cool for us to continue building upon this game.
A potential area to add functionality is implementing the alternative design detailed above and within each town have a user be designated the mayor. This would potentially come with additional responsibilities (like making sure villagers are happy) and a salary.
We could also do something with villager birthday, like notify a user if it’s a villager’s birthday so that they can buy and send them a gift
