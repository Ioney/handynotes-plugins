-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local Class = ns.Class
local L = ns.locale

local Rare = ns.node.Rare

local Achievement = ns.reward.Achievement
local Transmog = ns.reward.Transmog

local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = ns.Map({id = 241, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[53230777] = Rare({
    id = 50089,
    rewards = {
        Transmog({item = 69844, slot = L['dagger']}),
        Transmog({item = 67131, slot = L['cloak']}),
        Transmog({item = 67132, slot = L['cloth']}),
        Transmog({item = 67133, slot = L['cloth']}),
        Transmog({item = 67134, slot = L['cloak']}),
        Transmog({item = 67135, slot = L['leather']}),
        Transmog({item = 67140, slot = L['cloak']}),
        Transmog({item = 67141, slot = L['plate']}),
        Transmog({item = 67142, slot = L['cloak']}),
        Transmog({item = 67143, slot = L['plate']}),
        Transmog({item = 67144, slot = L['plate']}),
        Transmog({item = 67145, slot = L['shield']}),
        Transmog({item = 67146, slot = L['cloth']}),
        Transmog({item = 67147, slot = L['cloth']}),
        Transmog({item = 67148, slot = L['mail']}),
        Transmog({item = 67149, slot = L['offhand']}),
        Transmog({item = 67150, slot = L['mail']})
    },
    pois = {Path({53230777, 52610873})}
}) -- Julak-Doom

map.nodes[57933373] = Rare({
    id = 50085,
    rewards = {Transmog({item = 67244, slot = L['cloth']})}
}) -- Overlord Sunderfury

map.nodes[50798236] = Rare({
    id = 50086,
    note = L['in_cave'],
    rewards = {Transmog({item = 67245, slot = L['leather']})},
    pois = {POI({55508360})}
}) -- Tarvus the Vile

local DragonmawDuty = Class('DragonmawDuty', Rare, {faction = 'Horde'})

map.nodes[45803310] = DragonmawDuty({
    id = 46885,
    rewards = {Achievement({id = 5482, criteria = 15952})}
}) -- High Shaman MacKilligan

map.nodes[45204315] = DragonmawDuty({
    id = 46376,
    rewards = {Achievement({id = 5482, criteria = 15954})}
}) -- Gunwald Greybeard

map.nodes[45903147] = DragonmawDuty({
    id = 47115,
    rewards = {Achievement({id = 5482, criteria = 15950})}
}) -- Black Recluse

map.nodes[46493720] = DragonmawDuty({
    id = 46378,
    rewards = {Achievement({id = 5482, criteria = 15953})}
}) -- Dillan MacHurley

map.nodes[51902780] = DragonmawDuty({
    id = 46377,
    rewards = {Achievement({id = 5482, criteria = 15955})}
}) -- Cliff Thundermar

map.nodes[52502810] = DragonmawDuty({
    id = 47171,
    rewards = {Achievement({id = 5482, criteria = 15951})}
}) -- Korthalon

local WildhammerDuty = Class('WildhammerDuty', Rare, {faction = 'Alliance'})

map.nodes[49073720] = WildhammerDuty({
    id = 46493,
    rewards = {Achievement({id = 5481, criteria = 15948})}
}) -- Warlord Halthar

map.nodes[45903148] = WildhammerDuty({
    id = 47115,
    rewards = {Achievement({id = 5481, criteria = 15950})}
}) -- Black Recluse

map.nodes[51203380] = WildhammerDuty({
    id = 46756,
    rewards = {Achievement({id = 5481, criteria = 15949})}
}) -- Karkrog the Exterminator

map.nodes[52502811] = WildhammerDuty({
    id = 47171,
    rewards = {Achievement({id = 5481, criteria = 15951})}
}) -- Korthalon

-------------------------------------------------------------------------------
------------------------------------ MISC -------------------------------------
-------------------------------------------------------------------------------

map.nodes[50745830] = ns.node.Collectible({
    id = 46935,
    icon = 132334,
    rewards = {
        Achievement({id = 4958, criteria = 3}), -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
        Achievement({id = 4960}) -- Round Three. Fight!
    }
}) -- Crucible of Carnage
