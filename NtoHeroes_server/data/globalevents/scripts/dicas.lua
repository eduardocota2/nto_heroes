local messages = {
"( Discord ) Hey, on discord you will find many tips, tutorials and even shinobis to accompany you on this journey! Access: https://discord.gg/VEXpYqh8Kf",

"( Loot / Money ) Have you learned how to use our autoloot system? Don't waste your time, the best way to make money is by selling Loot Items to NPC Buyers.",

"( Level ) On our server you can level up your character in many different ways: Hunts, Missions, Daily Battles, Kekkeis Generators, PVP Participations and others.",

"( Discord ) Hey, on discord you will find many tips, tutorials and even shinobis to accompany you on this journey! Access: https://discord.gg/VEXpYqh8Kf",

"( Skills ) Train your character, Ninjutsu is responsible for the damage of your Jutsus, Taijutsu is responsible for the speed of your physical attack, Agility and Dexterity are responsible for the damage of the physical attack.",

"( Set ) It is very important that you are using the Set equivalent to your Level, Set Level 1 = Level 10, Set Level 2 = Level 20. Always try to use the Set of your level to avoid trouble in PVE and PVP situations.",

"( Discord ) Ask questions, give suggestions, learn more about the game and make new friends! Access: https://discord.gg/VEXpYqh8Kf",

"( Play to Gain ) We are a classic server, we value playing time, we cultivate difficulty to offer everyone free of charge in the form of rewards the best items, exclusive characters and advantages that are found in our VIP Store.",

} 


local i = 0

function onThink(interval, lastExecution)

local message = messages[(i % #messages) + 1]

for _, pid in ipairs(getPlayersOnline()) do

doPlayerSendTextMessage(pid, 20, "Pan Deluxe [200]: ".. message ..". ") -- Exp , Dinheiro , Quest

i = i + 1

end

return TRUE

end