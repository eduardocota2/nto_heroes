-- local combat = Combat()
-- -- local combat = createCombatObject()
-- setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
-- setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
-- setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
-- setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

-- function onGetFormulaValues(cid, level, maglevel)
-- 	local min = ((level*11)+(maglevel*7))
-- 	local max = ((level*12)+(maglevel*8)) -- 4000 =  Lv 150 + Nin 150 
-- 	return min, max
-- end

-- setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- function onCastSpell(cid, var)
-- 	doCombat(cid, combat, var)
-- end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = ((level*11)+(maglevel*7))
	local max = ((level*12)+(maglevel*8)) -- 4000 =  Lv 150 + Nin 150 
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

-- 	local waittime = 1 -- Tempo de exhaustion
-- 	local storage = 8205

-- if exhaustion.check(cid, storage) then
-- 	return false
-- end
-- 	exhaustion.set(cid, storage, waittime)
-- 	return doCombat(cid, combat, var)
-- end

