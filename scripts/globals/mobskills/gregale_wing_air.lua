---------------------------------------------
--  Gregale Wing
--
--  Description: An icy wind deals Ice damage to enemies within a very wide area of effect. Additional effect: Paralyze
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only Jormungand and Isgebind
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() ~= 1) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PARALYSIS

    MobStatusEffectMove(mob, target, typeEffect, 40, 0, 120)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,dsp.magic.ele.ICE,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.ICE,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.ICE)
    return dmg
end