-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...

local L = ns.locale
local Class = ns.Class

-------------------------------------------------------------------------------
--------------------------------- REQUIREMENT ---------------------------------
-------------------------------------------------------------------------------

--[[

Base class for all node requirements.

    text (string): Requirement text

--]]

local Requirement = Class('Requirement', nil, {text = UNKNOWN})
function Requirement:GetText()
    local text = self.text
    if self.type then text = text .. ' (' .. self.type .. ')' end
    return text
end
function Requirement:IsMet() return false end

-------------------------------------------------------------------------------
--------------------------------- ACHIEVEMENT ---------------------------------
-------------------------------------------------------------------------------

local Achievement = Class('Achievement', Requirement, {type = L['achievement']})

function Achievement:Initialize(id)
    self.id = id
    self.text = string.format('{achievement:%d}', self.id)
end

function Achievement:IsMet()
    local _, _, _, completed = GetAchievementInfo(self.id)

    return completed
end

-------------------------------------------------------------------------------
---------------------------------- CURRENCY -----------------------------------
-------------------------------------------------------------------------------

local Currency = Class('Currency', Requirement, {type = L['currency']})

function Currency:Initialize(id, count)
    self.id, self.count = id, count
    self.text = string.format('{currency:%d} x%d', self.id, self.count)
end

function Currency:IsMet()
    local info = GetCurrencyInfo(self.id)
    return info and info[2] >= self.count
end

-------------------------------------------------------------------------------
------------------------------------ ITEM -------------------------------------
-------------------------------------------------------------------------------

local Item = Class('Item', Requirement, {type = L['item']})

-- Quality (optional - added in Dragnflight):
-- 1 = Bronze 1 diamond
-- 2 = Silver 2 diamonds
-- 3 = Gold 3 diamonds
-- 4 = Diamond 4 diamonds
-- 5 = Orange 1 large diamond
function Item:Initialize(id, count, quality)
    self.id, self.count, self.quality = id, count, quality
    self.text = string.format('{item:%d}', self.id)
    if self.quality ~= nil then
        self.text = self.text ..
                        C_Texture.GetCraftingReagentQualityChatIcon(self.quality)
    end
    if self.count and self.count > 1 then
        self.text = self.text .. ' x' .. self.count
    end
end

function Item:IsMet() return ns.PlayerHasItem(self.id, self.count) end

-------------------------------------------------------------------------------
--------------------------------- PROFESSION ----------------------------------
-------------------------------------------------------------------------------

local Profession = Class('Profession', Requirement)

function Profession:Initialize(skillID, variantID, level)
    self.skillID = skillID
    self.variantID = variantID
    self.level = level
    self.text = C_TradeSkillUI.GetTradeSkillDisplayName(variantID or skillID)

    if level then self.text = self.text .. ' (' .. level .. ')' end
end

function Profession:IsMet() return ns.PlayerHasProfession(self.skillID) end

-------------------------------------------------------------------------------
------------------------------------ QUEST ------------------------------------
-------------------------------------------------------------------------------

local Quest = Class('Quest', Requirement, {type = L['quest']})

function Quest:Initialize(id, text, repeatable)
    self.id = id
    self.text = text
    self.type = repeatable and L['quest_repeatable'] or self.type
end

function Quest:GetText()
    local text = C_QuestLog.GetQuestInfo(self.id) or self.text or UNKNOWN
    return ('%s (%s)'):format(text, self.type)
end

function Quest:IsMet() return C_QuestLog.IsQuestFlaggedCompleted(self.id) end

-------------------------------------------------------------------------------
--------------------------------- REPUTATION ----------------------------------
-------------------------------------------------------------------------------

local Reputation = Class('Reputation', Requirement)

-- @todo will cause problems when requiring lower / negative reputations. Maybe add comparison as optional parameter with default value '>='.
function Reputation:Initialize(id, level, isRenown)
    self.id, self.level, self.isRenown = id, level, isRenown
end

function Reputation:GetText()
    local level = self.level
    if self.isRenown then
        level = _G['COVENANT_SANCTUM_LEVEL']:format(level)
    else
        level = GetText('FACTION_STANDING_LABEL' .. level)
    end
    return ('%s (%s)'):format(ns.api.GetFactionInfoByID(self.id), level)
end

function Reputation:IsMet()
    local standingID = self.isRenown and
                           C_MajorFactions.GetCurrentRenownLevel(self.id) or
                           select(3, ns.api.GetFactionInfoByID(self.id))
    return standingID >= self.level
end

-------------------------------------------------------------------------------
------------------------------------ SPELL ------------------------------------
-------------------------------------------------------------------------------

local Spell = Class('Spell', Requirement, {type = L['spell']})

function Spell:Initialize(id)
    self.id = id
    self.text = string.format('{spell:%d}', self.id)
end

function Spell:IsMet() return C_UnitAuras.GetPlayerAuraBySpellID(self.id) ~= nil end

-------------------------------------------------------------------------------
------------------------------------- TOY -------------------------------------
-------------------------------------------------------------------------------

local Toy = Class('Toy', Item, {type = L['toy']})

function Toy:IsMet() return PlayerHasToy(self.id) end

-------------------------------------------------------------------------------

ns.requirement = {
    Achievement = Achievement,
    Currency = Currency,
    Item = Item,
    Profession = Profession,
    Quest = Quest,
    Reputation = Reputation,
    Requirement = Requirement,
    Spell = Spell,
    Toy = Toy
}
