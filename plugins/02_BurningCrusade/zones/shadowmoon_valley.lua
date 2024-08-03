-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

local Node = ns.node.Node
local Quest = ns.node.Quest
local Rare = ns.node.Rare

local Achievement = ns.reward.Achievement
local Mount = ns.reward.Mount
local Transmog = ns.reward.Transmog

local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = ns.Map({id = 104, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[71606180] = Rare({
    id = 18695,
    rewards = {
        Achievement({id = 1312, criteria = 4504}), -- Bloody Rare
        Transmog({item = 31225, slot = L['cloth']}), -- Illidari Bindings
        Transmog({item = 31224, slot = L['leather']}), -- Illidari Bracers
        Transmog({item = 31223, slot = L['mail']}), -- Illidari Wristguards
        Transmog({item = 31221, slot = L['plate']}) -- Illidari Vambraces
    },
    pois = {
        POI({
            28004840, 28204920, 29005500, 29205040, 29405100, 29605120,
            29605260, 29805180, 30605820, 45002880, 45003060, 45603120,
            46202880, 46402800, 46406600, 46406940, 46407020, 46602620,
            46602760, 46607100, 46802660, 47206560, 47206860, 47806720,
            55803800, 56203560, 57003860, 57403500, 57403700, 57403840,
            57603660, 57803600, 57803780, 58603640, 58603660, 68006120,
            68406200, 68805980, 68806180, 71006220
        })
    }
}) -- Ambassador Jerrikar

map.nodes[73602900] = Rare({
    id = 18694,
    rewards = {
        Achievement({id = 1312, criteria = 4508}), -- Bloody Rare
        Transmog({item = 31220, slot = L['cloth']}), -- Amethyst Beholder Eye
        Transmog({item = 31219, slot = L['leather']}), -- Emerald Beholder Eye
        Transmog({item = 31218, slot = L['mail']}), -- Fiery Beholder Eye
        Transmog({item = 31217, slot = L['plate']}) -- Crimson Beholder Eye
    },
    pois = {
        POI({
            36604500, 37004420, 37604320, 39404280, 40004380, 40204300,
            55007120, 58807040, 59207060, 66602620, 67202320, 70602880, 73003020
        })
    }
}) -- Collidus the Warp-Watcher

map.nodes[59604660] = Rare({
    id = 18696,
    rewards = {
        Achievement({id = 1312, criteria = 4515}), -- Bloody Rare
        Transmog({item = 31216, slot = L['cloth']}), -- Abyssal Cloth Footwraps
        Transmog({item = 31215, slot = L['leather']}), -- Abyssal Leather Treads
        Transmog({item = 31214, slot = L['mail']}), -- Abyssal Mail Greaves
        Transmog({item = 31213, slot = L['plate']}) -- Abyssal Plate Sabatons
    },
    pois = {
        POI({
            31004520, 31004580, 41804060, 42003940, 42004040, 42006880,
            42406840, 45401240, 45401260, 45601240, 45601260, 59404640,
            59404680, 59604640
        })
    }
}) -- Kraator

-------------------------------------------------------------------------------
---------------------------- NETHERWING REP RELATED ---------------------------
-------------------------------------------------------------------------------

map.nodes[61885948] = Quest({
    label = '{npc:22113}',
    icon = 132250,
    quest = 10804,
    note = '{npc:22113} starts the questline to get your reputation of {note:Netherwing} from Hated to Neutral to unlock repeatable quests on the island to the south.',
    rewards = {
        ns.reward.Quest({id = 10804}), --  Kindness
        ns.reward.Quest({id = 10811}), --  Seek Out Neltharaku
        ns.reward.Quest({id = 10814}), --  Neltharaku's Tale
        ns.reward.Quest({id = 10836}), --  Infiltrating Dragonmaw Fortress
        ns.reward.Quest({id = 10837}), --  To Netherwing Ledge!
        ns.reward.Quest({id = 10854}), --  The Force of Neltharaku
        ns.reward.Quest({id = 10858}), --  Karynaku
        ns.reward.Quest({id = 10866}), --  Zuluhed the Whacked
        ns.reward.Quest({id = 10870}), --  Ally of the Netherwing
        ns.reward.Quest({id = 11012}), --  Blood Oath of the Netherwing
        ns.reward.Quest({id = 11013}) --  In Service of the Illidari
    },
    pois = {
        Path({
            63176028, 62756000, 62325974, 61885948, 61455919, 61005896,
            60825848, 60615798, 60705850, 60275875, 59775872, 59245871
        })
    }
}) -- Mordenai

map.nodes[71986485] = Quest({
    icon = 132526,
    questDeps = {11013}, -- In Service of the Illidari
    quest = 11035,
    note = 'This is a good spot to farm the {item:32509}. A {npc:23188} spawns regularly to the north above the building and flys directly over you to be killed by a range attack.',
    rewards = {
        ns.reward.Quest({id = 11035}), -- The Not-So-Friendly Skies...
        ns.reward.Item({item = 32509}) -- Netherwing Relic
    }
}) -- The Not-So-Friendly Skies...

map.nodes[71986485] = Quest({
    icon = 132526,
    questDeps = {11013}, -- In Service of the Illidari
    quest = 11035,
    note = 'This is a good spot to farm the {item:32509}. A {npc:23188} spawns regularly to the north above the building and flys directly over you to be killed by a range attack.',
    rewards = {
        ns.reward.Quest({id = 11035}), -- The Not-So-Friendly Skies...
        ns.reward.Item({item = 32509}) -- Netherwing Relic
    }
}) -- The Not-So-Friendly Skies...

map.nodes[65598595] = ns.node.Collectible({
    id = 23489,
    icon = 'peg_bl',
    scale = 2,
    questDeps = {11013}, -- In Service of the Illidari
    requires = {
        ns.requirement.Reputation(1015, 8) -- Netherwing, Exalted
    },
    rewards = {
        Achievement({id = 9713, criteria = 26800}), -- Awake the Drakes
        Mount({item = 32858, id = 1736}), -- Reins of the Azure Netherwing Drake
        Mount({item = 32859, id = 1736}), -- Reins of the Cobalt Netherwing Drake
        Mount({item = 32857, id = 1736}), -- Reins of the Onyx Netherwing Drake
        Mount({item = 32860, id = 1736}), -- Reins of the Purple Netherwing Drake
        Mount({item = 32861, id = 1736}), -- Reins of the Veridian Netherwing Drake
        Mount({item = 32862, id = 1736}) -- Reins of the Violet Netherwing Drake
    }
})

------------------------------- NETHERWING EGGS -------------------------------

local NetherwingEgg = ns.Class('NetherwingEgg', Node, {
    label = L['netherwing_egg'],
    note = 'Bring it to {npc:23141} to gain 250 reputation.',
    icon = 'peg_gn',
    questDeps = {11013}, -- In Service of the Illidari
    group = ns.groups.NETHERWING_EGGS,
    rewards = {
        ns.reward.Item({item = 32506}) -- Netherwing Egg
    },
    pois = {POI({66008647, color = 'Green'})}
})

map.nodes[59847826] = NetherwingEgg()
map.nodes[60218708] = NetherwingEgg()
map.nodes[62308947] = NetherwingEgg()
map.nodes[62807478] = NetherwingEgg()
map.nodes[63448289] = NetherwingEgg()
map.nodes[63948604] = NetherwingEgg()
map.nodes[63968740] = NetherwingEgg()
map.nodes[64098403] = NetherwingEgg()
map.nodes[64198674] = NetherwingEgg()
map.nodes[64588643] = NetherwingEgg()
map.nodes[64608732] = NetherwingEgg()
map.nodes[64668312] = NetherwingEgg()
map.nodes[64758520] = NetherwingEgg()
map.nodes[64928377] = NetherwingEgg()
map.nodes[64929095] = NetherwingEgg()
map.nodes[65068213] = NetherwingEgg()
map.nodes[65168586] = NetherwingEgg()
map.nodes[65178491] = NetherwingEgg()
map.nodes[65468866] = NetherwingEgg()
map.nodes[65498475] = NetherwingEgg()
map.nodes[65638773] = NetherwingEgg()
map.nodes[65688419] = NetherwingEgg()
map.nodes[65689408] = NetherwingEgg()
map.nodes[65968055] = NetherwingEgg()
map.nodes[66108388] = NetherwingEgg()
map.nodes[66288222] = NetherwingEgg()
map.nodes[66928201] = NetherwingEgg()
map.nodes[66929153] = NetherwingEgg()
map.nodes[67157962] = NetherwingEgg()
map.nodes[67226134] = NetherwingEgg()
map.nodes[67246236] = NetherwingEgg()
map.nodes[67278623] = NetherwingEgg()
map.nodes[67878737] = NetherwingEgg()
map.nodes[67888544] = NetherwingEgg()
map.nodes[67958247] = NetherwingEgg()
map.nodes[68055974] = NetherwingEgg()
map.nodes[68138182] = NetherwingEgg()
map.nodes[68149467] = NetherwingEgg()
map.nodes[68295981] = NetherwingEgg()
map.nodes[68317932] = NetherwingEgg()
map.nodes[68536115] = NetherwingEgg()
map.nodes[68628290] = NetherwingEgg()
map.nodes[68688362] = NetherwingEgg()
map.nodes[68838579] = NetherwingEgg()
map.nodes[68876249] = NetherwingEgg()
map.nodes[68898358] = NetherwingEgg()
map.nodes[69068137] = NetherwingEgg()
map.nodes[69108822] = NetherwingEgg()
map.nodes[69268432] = NetherwingEgg()
map.nodes[69338656] = NetherwingEgg()
map.nodes[69386377] = NetherwingEgg()
map.nodes[69468006] = NetherwingEgg()
map.nodes[69625854] = NetherwingEgg()
map.nodes[69678434] = NetherwingEgg()
map.nodes[69858208] = NetherwingEgg()
map.nodes[70076201] = NetherwingEgg()
map.nodes[70086030] = NetherwingEgg()
map.nodes[70218812] = NetherwingEgg()
map.nodes[70278392] = NetherwingEgg()
map.nodes[70408697] = NetherwingEgg()
map.nodes[70518397] = NetherwingEgg()
map.nodes[70718568] = NetherwingEgg()
map.nodes[70888218] = NetherwingEgg()
map.nodes[70916264] = NetherwingEgg()
map.nodes[70948145] = NetherwingEgg()
map.nodes[70968911] = NetherwingEgg()
map.nodes[71058081] = NetherwingEgg()
map.nodes[71148469] = NetherwingEgg()
map.nodes[71376074] = NetherwingEgg()
map.nodes[71458645] = NetherwingEgg()
map.nodes[71558410] = NetherwingEgg()
map.nodes[71588129] = NetherwingEgg()
map.nodes[72007470] = NetherwingEgg()
map.nodes[72248790] = NetherwingEgg()
map.nodes[72278638] = NetherwingEgg()
map.nodes[72508373] = NetherwingEgg()
map.nodes[72598373] = NetherwingEgg()
map.nodes[72648886] = NetherwingEgg()
map.nodes[72829032] = NetherwingEgg()
map.nodes[72898217] = NetherwingEgg()
map.nodes[73218428] = NetherwingEgg()
map.nodes[73308573] = NetherwingEgg()
map.nodes[73358715] = NetherwingEgg()
map.nodes[73429035] = NetherwingEgg()
map.nodes[73588511] = NetherwingEgg()
map.nodes[73808599] = NetherwingEgg()
map.nodes[73978306] = NetherwingEgg()
map.nodes[74068587] = NetherwingEgg()
map.nodes[74208239] = NetherwingEgg()
map.nodes[74288554] = NetherwingEgg()
map.nodes[74318974] = NetherwingEgg()
map.nodes[74348729] = NetherwingEgg()
map.nodes[74588840] = NetherwingEgg()
map.nodes[74618466] = NetherwingEgg()
map.nodes[75198645] = NetherwingEgg()
map.nodes[75228248] = NetherwingEgg()
map.nodes[75658606] = NetherwingEgg()
map.nodes[75769165] = NetherwingEgg()
map.nodes[76068134] = NetherwingEgg()
map.nodes[76408566] = NetherwingEgg()
map.nodes[76558335] = NetherwingEgg()
map.nodes[77269548] = NetherwingEgg()
map.nodes[77368586] = NetherwingEgg()
map.nodes[77619255] = NetherwingEgg()
map.nodes[78108112] = NetherwingEgg()
map.nodes[78828644] = NetherwingEgg()
map.nodes[78867961] = NetherwingEgg()
map.nodes[78888334] = NetherwingEgg()
map.nodes[79588800] = NetherwingEgg()
