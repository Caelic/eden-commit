-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Twinkle Tree
-- Involved in Quest: To Catch a Falling Star
--  Note: EventID for Twinkle Tree is unknown. Quest funtions but the full event is not played.
-- !pos 156.003 -40.753 333.742 115
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
    if player:getQuestStatus(WINDURST, TO_CATCH_A_FALLIHG_STAR) == QUEST_ACCEPTED and VanadielHour() <= 3 then
        if npcUtil.tradeHas(trade, 868) and player:getVar("QuestCatchAFallingStar_prog") == 0 then
            player:messageSpecial(ID.text.FROST_DEPOSIT_TWINKLES)
            player:messageSpecial(ID.text.MELT_BARE_HANDS)
            if npcUtil.giveItem(player, 546) then
                player:confirmTrade()
                player:setVar("QuestCatchAFallingStar_prog", 1)
            end
        end
    end
end

function onTrigger(player,npc)
    if VanadielHour() <= 3 and player:getVar("QuestCatchAFallingStar_prog") == 0 then
        player:messageSpecial(ID.text.FROST_DEPOSIT_TWINKLES)
        player:messageSpecial(ID.text.MELT_BARE_HANDS)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end