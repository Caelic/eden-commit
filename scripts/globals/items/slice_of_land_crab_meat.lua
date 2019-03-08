-----------------------------------------
-- ID: 4400
-- Item: slice_of_land_crab_meat
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -4
-- Vitality 3
-- Defense % 14
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.MITHRA) then
        result = 247
    end
    if (target:getMod(dsp.mod.EAT_RAW_FISH) == 1) then
        result = 0
    end
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4400)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, -4)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FOOD_DEFP, 14)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -4)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FOOD_DEFP, 14)
end