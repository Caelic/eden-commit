-----------------------------------
-- Area: South Gustaberg
--  NPC: ???
-- Involved in Quest: Smoke on the Mountain
-- !pos 461 -21 -580 107
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:needToZone() == false) then
        player:setVar("SGusta_Sausage_Timer", 0);
    end

    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);

    if (SmokeOnTheMountain == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4372,1) and trade:getItemCount() == 1) then
            if (player:getVar("SGusta_Sausage_Timer") == 0) then
                -- player puts sheep meat on the fire
                player:messageSpecial(ID.text.FIRE_PUT, 4372);
                player:tradeComplete();
                player:setVar("SGusta_Sausage_Timer", os.time() + 3456); -- 57 minutes 36 seconds, 1 Vana'diel Day
                player:needToZone(true);
            else
                -- message given if sheep meat is already on the fire
                player:messageSpecial(ID.text.MEAT_ALREADY_PUT, 4372)
            end
        end
    end
end;

function onTrigger(player,npc)
    if (player:needToZone() == false) then
        player:setVar("SGusta_Sausage_Timer", 0);
    end

    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);
    local sausageTimer = player:getVar("SGusta_Sausage_Timer");

    if (SmokeOnTheMountain ~= QUEST_AVAILABLE and sausageTimer ~= 0) then
        if (sausageTimer >= os.time()) then
            player:messageSpecial(ID.text.FIRE_LONGER, 4372);
        elseif (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 4395);
        elseif (sausageTimer < os.time()) then
            player:setVar("SGusta_Sausage_Timer", 0);
            player:messageSpecial(ID.text.FIRE_TAKE, 4395);
            player:addItem(4395);
        end
    elseif (SmokeOnTheMountain ~= QUEST_AVAILABLE and sausageTimer == 0) then
        player:messageSpecial(ID.text.FIRE_GOOD);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;