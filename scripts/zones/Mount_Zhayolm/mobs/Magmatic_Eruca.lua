-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Magmatic Eruca
-- Note: Place Holder Energetic Eruca
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.ENERGETIC_ERUCA_PH,10,86400); -- 24 hours
end;