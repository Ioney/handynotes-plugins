-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--------------------------------- PROFESSIONS ---------------------------------
-------------------------------------------------------------------------------

-- LuaFormatter off
ns.professions = {
    ALCHEMY = {
        name = 'Alchemy',
        icon = 4620669,
        skillID = 171,
        variantID = {2485, 2484, 2483, 2482}
    },
    ARCHAEOLOGY = {
        name = 'Archaeology',
        icon = 441139,
        skillID = 794
    },
    BLACKSMITHING = {
        name = 'Blacksmithing',
        icon = 4620670,
        skillID = 164,
        variantID = {2477, 2476, 2475, 2474}
    },
    COOKING = {
        name = 'Cooking',
        icon = 4620671,
        skillID = 185,
        variantID = {2548, 2547, 2546, 2545}
    },
    ENCHANTING = {
        name = 'Enchanting',
        icon = 4620672,
        skillID = 333,
        variantID = {2494, 2493, 2492, 2491}
    },
    ENGINEERING = {
        name = 'Engineering',
        icon = 4620673,
        skillID = 202,
        variantID = {2506, 2505, 2504, 2503}
    },
    FISHING = {
        name = 'Fishing',
        icon = 4620674,
        skillID = 356,
        variantID = {2592, 2591, 2590, 2589}
    },
    HERBALISM = {
        name = 'Herbalism',
        icon = 4620675,
        skillID = 182,
        variantID = {2556, 2555, 2554, 2553}
    },
    INSCRIPTION = {
        name = 'Inscription',
        icon = 4620676,
        skillID = 773,
        variantID = {2514, 2513, 2512, 2511}
    },
    JEWELCRAFTING = {
        name = 'Jewelcrafting',
        icon = 4620677,
        skillID = 755,
        variantID = {2524, 2523, 2522, 2521}
    },
    LEATHERWORKING = {
        name = 'Leatherworking',
        icon = 4620678,
        skillID = 165,
        variantID = {2532, 2531, 2530, 2529}
    },
    MINING = {
        name = 'Mining',
        icon = 4620679,
        skillID = 186,
        variantID = {2572, 2571, 2570, 2569}
    },
    SKINNING = {
        name = 'Skinning',
        icon = 4620680,
        skillID = 393,
        variantID = {2564, 2563, 2562, 2561}
    },
    TAILORING = {
        name = 'Tailoring',
        icon = 4620681,
        skillID = 197,
        variantID = {2540, 2539, 2538, 2537}
    }
}
-- LuaFormatter on

-------------------------------------------------------------------------------

local function GetName(self)
    return C_TradeSkillUI.GetTradeSkillDisplayName(self.skillID)
end

local function HasProfession(self) return ns.PlayerHasProfession(self.skillID) end

for name, profession in pairs(ns.professions) do
    profession.GetName = GetName
    profession.HasProfession = HasProfession
end
