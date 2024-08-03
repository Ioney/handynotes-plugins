-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local Class = ns.Class
local Group = ns.Group
local L = ns.locale
local Map = ns.Map

local Collectible = ns.node.Collectible
local NPC = ns.node.NPC
local Rare = ns.node.Rare

local Achievement = ns.reward.Achievement
local Transmog = ns.reward.Transmog

local POI = ns.poi.POI
local Path = ns.poi.Path

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({id = 198, settings = true})
local mf = Map({id = 338, settings = true}) -- Molten Front

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

ns.groups.UNBEATABLE_PTERODACTYL = Group('unbeatable_pterodactyl', 132200, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5860,
    label = '{achievement:5860}'
})

ns.groups.LUDICROUS_SPEED = Group('ludicrous_speed', 132172, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5862,
    label = '{achievement:5862}'
})

ns.groups.HAVE_WE_MET = Group('have_we_met', 135646, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5865,
    label = '{achievement:5865}'
})

ns.groups.SPIDER_HILL = Group('spider_hill', 132196, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5872,
    label = '{achievement:5872}'
})

ns.groups.R4R_2 = Group('r4r_2', 135789, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5873,
    label = '{achievement:5873}'
})

ns.groups.FLAWLESS_VICTORY = Group('flawless_victory', 459027, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5867,
    label = '{achievement:5867}'
})

ns.groups.GANG_WAR = Group('gang_war', 135415, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5864,
    label = '{achievement:5864}'
})

ns.groups.MOLTEN_FLOW_MASTER = Group('molten_flow_master', 135822, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5871,
    label = '{achievement:5871}'
})

ns.groups.CRITTER_REVENGE = Group('critter_revenge', 132200, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5868,
    label = '{achievement:5868}'
})

ns.groups.FIERY_LORDS = Group('fiery_lords', 135790, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5861,
    label = '{achievement:5861}'
})

ns.groups.INFERNAL_AMBASSADORS = Group('infernal_ambassadors', 236191, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5869,
    label = '{achievement:5869}'
})

ns.groups.FIRESIDE_CHAT = Group('fireside_chat', 236450, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5870,
    label = '{achievement:5870}'
})

ns.groups.GANG_WAR = Group('gang_war', 135415, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5864,
    label = '{achievement:5864}'
})
ns.groups.DEATH_FROM_ABOVE = Group('death_from_above', 512904, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 5874,
    label = '{achievement:5874}'
})

-------------------------------------------------------------------------------
--------------------------------- PHASE NODES ---------------------------------
-------------------------------------------------------------------------------

local HyjalPhase = Class('HyjalPhase', ns.requirement.Requirement)

function HyjalPhase:Initialize(phase) self.phase = phase end

function HyjalPhase:GetText()
    local phase = {
        [0] = L['hyjal_phase0'],
        [1] = L['hyjal_phase1'],
        [2] = L['hyjal_phase2'],
        [3] = L['hyjal_phase3'],
        [41] = L['hyjal_phase4a'],
        [42] = L['hyjal_phase4b'],
        [5] = L['hyjal_phase5']
    }
    return phase[self.phase] or UNKNOWN
end

function HyjalPhase:IsMet()
    local qc = C_QuestLog.IsQuestFlaggedCompleted
    if self.phase == 0 and qc(25372) then return true end -- Phase 0 - Pre Invasion
    if self.phase == 1 and qc(29389) then return true end -- Phase 1 - Invasion
    if self.phase == 2 and qc(29198) then return true end -- Phase 2 - The Sanctuary of Malorne
    if self.phase == 3 and qc(29201) then return true end -- Phase 3 - The Molten Front
    if self.phase == 41 and qc(29182) then return true end -- Phase 4a - The Druids of the Talon Area
    if self.phase == 42 and qc(29215) then return true end -- Phase 4b - The Shadow Wardens Area
    if self.phase == 5 and qc(29182) and qc(29215) then return true end -- Phase 5 - The Regrowth
    return false
end

map.nodes[19563787] = ns.node.Intro({
    note = L['hyjal_phase1_note'],
    quest = 29389,
    requires = HyjalPhase(0)
}) -- starts Phase 1 - Invasion

map.nodes[27116281] = NPC({
    id = 52135, -- review
    note = L['hyjal_phase2_note'],
    icon = 513195,
    quest = 29198,
    requires = HyjalPhase(1)
}) -- starts Phase 2 - The Sanctuary of Malorne

map.nodes[27116282] = NPC({
    id = 52135, -- review
    note = L['hyjal_phase3_note'],
    icon = 513195,
    quest = 29201,
    requires = HyjalPhase(2)
}) -- starts Phase 3 - The Molten Front

mf.nodes[47039139] = NPC({
    id = 52135,
    note = L['hyjal_phase4_note'],
    icon = 513195,
    quest = {29182, 29215},
    requires = HyjalPhase(3),
    rewards = {Achievement({id = 5870, criteria = 17878})}
}) -- starts Phase 4a/b - The Druids of the Talon Area / The Shadow Wardens Area

mf.nodes[10001400] = ns.node.Node({
    label = L['hyjal_phase5'],
    note = L['hyjal_phase5_note'],
    icon = 513195,
    quest = {29182, 29215},
    requires = {HyjalPhase(41), HyjalPhase(42)}
}) -- changes Molten Front to Phase 5 - The Regrowth

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[50453327] = Rare({
    id = 50053,
    rewards = {Transmog({item = 67234, slot = L['leather']})},
    pois = {
        Path({
            59033759, 58053582, 56883404, 56993140, 57572894, 56342791,
            55072888, 52243056, 50453327, 48363441, 46373314, 44773216,
            42583190, 41222983, 39912578, 38982323, 36162274, 34102488
        })
    }
}) -- Thartuk the Exile

map.nodes[37107233] = Rare({
    id = 50056,
    rewards = {
        Transmog({item = 69842, slot = L['plate']}),
        Transmog({item = 67148, slot = L['mail']}),
        Transmog({item = 67131, slot = L['cloak']}),
        Transmog({item = 67143, slot = L['plate']}),
        Transmog({item = 67135, slot = L['leather']}),
        Transmog({item = 67133, slot = L['cloth']}),
        Transmog({item = 67140, slot = L['cloak']})
    },
    pois = {
        Path({
            37107233, 37287552, 38077817, 38308154, 38938338, 40478252,
            40278044, 38927892, 38077817
        })
    }
}) -- Garr

map.nodes[47795645] = Rare({
    id = 50057,
    rewards = {Transmog({item = 67236, slot = L['leather']})},
    pois = {
        Path({
            69415618, 66105467, 63505657, 60415847, 58105628, 54815508,
            50675482, 48075604, 47795645, 45805957, 43296079
        })
    }
}) -- Blazewing

-------------------------------------------------------------------------------
-------------------------------- FIRESIDE CHAT --------------------------------
-------------------------------------------------------------------------------

local FiresideChat = Class('FiresideChat', Collectible,
    {icon = 236450, group = ns.groups.FIRESIDE_CHAT})

map.nodes[27176257] = FiresideChat({
    id = 52669,
    requires = HyjalPhase(1),
    rewards = {Achievement({id = 5870, criteria = 17879})}
}) -- Matoclaw

map.nodes[27536251] = FiresideChat({
    id = 52986,
    requires = HyjalPhase(1),
    rewards = {Achievement({id = 5870, criteria = 17882})}
}) -- Dorda'en Nightweaver

mf.nodes[47458356] = FiresideChat({
    id = 52134,
    requires = HyjalPhase(3),
    rewards = {Achievement({id = 5870, criteria = 17880})},
    pois = {
        Path({
            47169110, 47318695, 49688553, 45548439, 45158286, 45808403,
            47458356, 47318695
        })
    }
}) -- Commander Jarod Shadowsong

mf.nodes[10001000] = FiresideChat({ -- TODO
    id = 52444,
    requires = HyjalPhase(41),
    rewards = {Achievement({id = 5870, criteria = 17883})}
}) -- Thisalee Crow

mf.nodes[11501000] = FiresideChat({ -- TODO
    id = 53259,
    requires = HyjalPhase(41),
    rewards = {Achievement({id = 5870, criteria = 17884})}
}) -- Arthorn Windsong

mf.nodes[13001000] = FiresideChat({ -- TODO
    id = 52921,
    requires = HyjalPhase(41),
    rewards = {Achievement({id = 5870, criteria = 17886})}
}) -- Deldren Ravenelm

mf.nodes[45598583] = FiresideChat({
    id = 52921,
    requires = HyjalPhase(3),
    rewards = {Achievement({id = 5870, criteria = 17889})}
}) -- General Taldris Moonfall

-------------------------------------------------------------------------------
---------------------------- INFERNAL AMBASSADORS -----------------------------
-------------------------------------------------------------------------------

local Ambassador = Class('Ambassador', Collectible, {
    icon = 236191,
    group = ns.groups.INFERNAL_AMBASSADORS
})

map.nodes[13294490] = Ambassador({
    id = 52749,
    quest = 29162,
    requires = {
        HyjalPhase(2), ns.requirement.Quest(29161, nil, true) -- Those Bears Up There
    },
    rewards = {Achievement({id = 5869, criteria = 17829})}
}) -- Pyrachnis

map.nodes[13184472] = Ambassador({
    id = 52649,
    quest = 29148,
    requires = {
        HyjalPhase(2), ns.requirement.Quest(29147, nil, true) -- Call the Flock
    },
    rewards = {Achievement({id = 5869, criteria = 17831})}
}) -- Millagazor

map.nodes[41945604] = Ambassador({
    id = 52766,
    quest = 29165,
    requires = {
        HyjalPhase(2), ns.requirement.Quest(29164, nil, true) -- Perfecting Your Howl
    },
    rewards = {Achievement({id = 5869, criteria = 17832})}
}) -- Lylagar

map.nodes[41795575] = Ambassador({
    id = 52399,
    quest = 19126,
    requires = {
        HyjalPhase(2), ns.requirement.Quest(29125, nil, true) -- Between the Trees
    },
    rewards = {Achievement({id = 5869, criteria = 17833})}
}) -- Galenges

map.nodes[24785525] = Ambassador({
    id = 52383,
    quest = 29122,
    requires = {
        HyjalPhase(2), ns.requirement.Quest(29101, nil, true) -- Punting Season
    },
    rewards = {Achievement({id = 5869, criteria = 17834})}
}) -- Nemesis

-------------------------------------------------------------------------------
--------------------- THE FIERY LORDS OF SETHRIA'S ROOST ----------------------
-------------------------------------------------------------------------------

local FieryLord = Class('FieryLord', Collectible, {
    note = L['fiery_lords_note'],
    icon = 135790,
    group = ns.groups.FIERY_LORDS,
    requires = {HyjalPhase(3)}
})

map.nodes[35509781] = FieryLord({
    id = 53264,
    rewards = {Achievement({id = 5861, criteria = 17799})},
    pois = {Path({35509781, 31979504})}
}) -- Searris

map.nodes[30528090] = FieryLord({
    id = 53265,
    rewards = {Achievement({id = 5861, criteria = 17800})}
}) -- Kelbnar

map.nodes[34649194] = FieryLord({
    id = 53267,
    rewards = {Achievement({id = 5861, criteria = 17801})},
    pois = {
        Path({
            36269911, 34159810, 32119636, 31339394, 31498842, 31868415,
            32137795, 31457410, 30557450, 29907795, 29898221, 30668611,
            32268927, 34649194, 36179395, 36599663, 36959928, 36269911
        })
    }
}) -- Andrazor

map.nodes[30858706] = FieryLord({
    id = 53271,
    rewards = {Achievement({id = 5861, criteria = 17802})}
}) -- Fah Jarakk

-------------------------------------------------------------------------------
--------------------- AND THE MEEK SHALL INHERIT KALIMDOR ---------------------
-------------------------------------------------------------------------------

local CritterRevenge = Class('CritterRevenge', Collectible, {
    icon = 132328,
    group = ns.groups.CRITTER_REVENGE,
    requires = {HyjalPhase(3)}
})

map.nodes[40835715] = CritterRevenge({
    id = 52195,
    note = L['angry_little_squirrel_note'],
    rewards = {Achievement({id = 5868, criteria = 17824})}
}) -- Angry Little Squirrel

map.nodes[13184473] = CritterRevenge({
    id = 52649,
    rewards = {Achievement({id = 5868, criteria = 17826})}
}) -- Alpine Songbird

Achievement({id = 5868, criteria = 17826})

map.nodes[14303313] = CritterRevenge({
    id = 52688,
    note = L['hyjal_bear_cub_note'],
    rewards = {Achievement({id = 5868, criteria = 17825})}
}) -- Hyjal Bear Cub

map.nodes[23285899] = CritterRevenge({
    id = 52688,
    note = L['child_of_tortolla_note'],
    rewards = {Achievement({id = 5868, criteria = 17827})}
}) -- Child of Tortolla

-------------------------------------------------------------------------------
------------------------------ DEATH FROM ABOVE -------------------------------
-------------------------------------------------------------------------------

local dfa = Class('death_from_above', Collectible, {
    icon = 512904,
    note = L['death_from_above_note'],
    requires = {HyjalPhase(41)}
})

mf.nodes[10001200] = dfa({
    id = 54252,
    rewards = {Achievement({id = 5874, criteria = 17857})}
}) -- Ragepyre

mf.nodes[11501200] = dfa({
    id = 54254,
    rewards = {Achievement({id = 5874, criteria = 17859})}
}) -- Flashfire

mf.nodes[13001200] = dfa({
    id = 54256,
    rewards = {Achievement({id = 5874, criteria = 17861})}
}) -- Heatflayer

mf.nodes[14501200] = dfa({
    id = 54253,
    rewards = {Achievement({id = 5874, criteria = 17858})}
}) -- Blazefury

mf.nodes[16001200] = dfa({
    id = 54255,
    rewards = {Achievement({id = 5874, criteria = 17860})}
}) -- Hatespark

mf.nodes[17501200] = dfa({
    id = 54257,
    rewards = {Achievement({id = 5874, criteria = 17862})}
}) -- Singeslayer

-------------------------------------------------------------------------------
-------------------------- MASTER OF THE MOLTEN FLOW --------------------------
-------------------------------------------------------------------------------

local MoltenFlowMaster = Class('MoltenFlowMaster', NPC, {
    icon = 135822,
    group = ns.groups.MOLTEN_FLOW_MASTER,
    requires = {HyjalPhase(41), ns.requirement.Quest(29206)},
    pois = {Path({ns.poi.Circle({origin = 48005000, radius = 10})})}
})

mf.nodes[46005000] = MoltenFlowMaster({
    id = 53085,
    note = L['flamewaker_sentinel_note'],
    rewards = {Achievement({id = 5871, criteria = 17836})}
}) -- Sentinel

mf.nodes[48005000] = MoltenFlowMaster({
    id = 53093,
    note = L['flamewaker_shaman_note'],
    rewards = {Achievement({id = 5871, criteria = 17835})}
}) -- Shaman

mf.nodes[50005000] = MoltenFlowMaster({
    id = 53143,
    rewards = {Achievement({id = 5871, criteria = 17837})}
}) -- Hunter

-------------------------------------------------------------------------------
------------------------------------ MISC -------------------------------------
-------------------------------------------------------------------------------

map.nodes[27495634] = ns.node.Node({
    label = L['portal_molten_front'],
    icon = 'portal_rd',
    scale = 2,
    requires = {HyjalPhase(1), ns.requirement.Quest(29200)},
    rewards = {
        Achievement({id = 5867}),
        Achievement(
            {id = 5870, criteria = {17878, 17880, 17883, 17884, 17886, 17889}}),
        Achievement({id = 5872}),
        Achievement({id = 5873, criteria = {17840, 17841, 17842, 17843, 17844}}),
        Achievement(
            {id = 5874, criteria = {17857, 17859, 17861, 17858, 17860, 17862}})
    },
    OnClick = function() WorldMapFrame:SetMapID(mf.id) end,
    clabel = L['change_map']
}) -- Portal to the Molten Front

mf.nodes[54308550] = ns.node.Node({
    label = L['portal_mount_hyjal'],
    scale = 2,
    icon = 'portal_rd',
    OnClick = function() WorldMapFrame:SetMapID(map.id) end,
    clabel = L['change_map']
})

map.nodes[37225618] = Collectible({
    id = 40578,
    quest = 29177,
    icon = 132200,
    group = ns.groups.UNBEATABLE_PTERODACTYL,
    requires = {
        HyjalPhase(1), -- review
        ns.requirement.Quest(25560)
    },
    rewards = {Achievement({id = 5860, criteria = {id = 17798, qty = true}})},
    pois = {POI({39185826, icon = 'portal_bl'})}
}) -- The 'Unbeatable?' Pterodactyl: BEATEN.

map.nodes[12003900] = Collectible({
    id = 40578,
    note = L['ludicrous_speed_note'],
    quest = 29177,
    icon = 132172,
    group = ns.groups.LUDICROUS_SPEED,
    requires = {HyjalPhase(3)},
    rewards = {Achievement({id = 5862})},
    pois = {Path({ns.poi.Circle({origin = 12003900, radius = 5})})}
}) -- Ludicrous Speed

map.nodes[27336160] = Collectible({
    id = 53073,
    quest = 29128,
    icon = 135646,
    note = L['have_we_met_note'],
    group = ns.groups.HAVE_WE_MET,
    requires = {HyjalPhase(3)},
    rewards = {
        Achievement({id = 5865, criteria = {17806, 17807, 17808, 17809, 17810}})
    },
    pois = {Path({26746181, 27336160, 27816159})}
}) -- Have... Have We Met?

mf.nodes[66035682] = Collectible({
    label = '{achievement:5872}',
    note = L['spider_hill_note'],
    icon = 132196,
    group = ns.groups.SPIDER_HILL,
    requires = {HyjalPhase(3)},
    rewards = {Achievement({id = 5872})},
    pois = {Path({ns.poi.Circle({origin = 66035600, radius = 2.25})})}
}) -- King of the Spider-Hill

mf.nodes[50381958] = Collectible({
    label = '{achievement:5873}',
    note = L['ready_for_raiding_2_note'],
    icon = 135789,
    group = ns.groups.R4R_2,
    requires = {HyjalPhase(5), ns.requirement.Quest(29244)},
    rewards = {
        Achievement({id = 5873, criteria = {17840, 17841, 17842, 17843, 17844}})
    }
}) -- Ready for Raiding II

mf.nodes[44004900] = Collectible({
    id = 52552,
    icon = 459027,
    note = L['flawless_victory_note'],
    group = ns.groups.FLAWLESS_VICTORY,
    requires = {HyjalPhase(3)},
    rewards = {Achievement({id = 5867})}
}) -- Flawless Victory

map.nodes[31007700] = Collectible({
    label = '{achievement:5864}',
    icon = 135415,
    note = L['gang_war_note'],
    group = ns.groups.GANG_WAR,
    requires = {HyjalPhase(3)},
    rewards = {Achievement({id = 5864})}
}) -- Gang War
