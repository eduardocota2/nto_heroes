local messages = {
"( Discord )Ei, no discord voc� encontrar� v�rias Dicas, Tutoriais e at� mesmo Shinobis para te acompanhar nessa jornada ! Acesse : https://discord.gg/tN2MWVr",

"( Loot / Dinheiro ) J� aprendeu a utilizar nosso sistema !autoloot ? N�o perca tempo, a melhor forma de se fazer dinheiro � vendendo Item's Loot para NPC's Compradores.",

"( Upar ) Em nosso servidor voc� pode upar eu personagem com in�meras formas diferentes : Hunts, Miss�es, Batalhas Di�rias, Kekkeis Generators, Participa��es PVP e outras.",

"( Discord )Ei, no discord voc� encontrar� v�rias Dicas, Tutoriais e at� mesmo Shinobis para te acompanhar nessa jornada ! Acesse : https://discord.gg/tN2MWVr",

"( Skills ) Treine seu personagem, o Ninjutsu � respons�vel pelo dano de seus Jutsus, Taijutsu � respons�vel pela velocidade do seu ataque f�sico, Agilidade e Destreza s�o respons�veis pelo Dano do ataque f�sico.",

"( Set ) � muito importante que voc� esteja utilizando o Set equivalente ao seu Level, Set Nivel 1 = Level 10, Set Nivel 2 = Level 20. Busque sempre utilizar o Set do Seu level para evitar apuros em situa��es PVE e PVP.",

"( Discord ) Tire d�vidas, D� sugest�es, Aprenda mais sobre o jogo e Fa�a novos amigos ! Acesse : https://discord.gg/tN2MWVr ",

"( Play to Gain ) Somos um servidor cl�ssico, valorizamos o tempo de jogo, cultivamos a dificuldade para oferecer a todos gratuitamente em forma de recompensa os melhores items, personagens exclusivos e vantagens que s�o encontradas em nossa Loja VIP.",

} 


local i = 0

function onThink(interval, lastExecution)

local message = messages[(i % #messages) + 1]

for _, pid in ipairs(getPlayersOnline()) do

doPlayerSendTextMessage(pid, 20, "Hardinho [110]: ".. message ..". ") -- Exp , Dinheiro , Quest

i = i + 1

end

return TRUE

end