local message = [[
 
- Recompensas de Gradua��o -

Pegue o certificado de sua gradua��o que est� em cima
da mesa do Hokage Naruto.

Para isso, voc� deve completar as miss�es necess�rias
e evoluir seu n�vel de gradua��o.

Voc� pode resgatar presentes para cada gradua��o, como
genin, chunin, jounin e kage.

Quer saber mais ? Fa�a parte da nossa comunidade forumeiros !

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end