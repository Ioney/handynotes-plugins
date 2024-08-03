-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Spacer = ns.reward.Spacer
local Toy = ns.reward.Toy
local Transmog = ns.reward.Transmog

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = ns.Map({id = 1446, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[64405070] = ns.node.AnniversaryRare({
    id = 167749,
    quest = 60214,
    rewards = {
        Transmog({item = 186460, slot = L['cloth']}), -- Anger-Spark Gloves
        Transmog({item = 186461, slot = L['cloth']}), -- Gilded Trousers of Benediction
        Transmog({item = 186463, slot = L['leather']}), -- Terrorweave Tunic
        Transmog({item = 186475, slot = L['leather']}), -- Hellstiched Mantle
        Transmog({item = 186464, slot = L['mail']}), -- Fathom-Helm of the Deeps
        Transmog({item = 186481, slot = L['mail']}), -- Darkcrest Waistguard
        Transmog({item = 186465, slot = L['plate']}), -- Faceguard of the Endless Watch
        Transmog({item = 186484, slot = L['plate']}), -- Voidforged Greaves
        Transmog({item = 186462, slot = L['cloak']}), -- Black-Iron Battlecloak
        Transmog({item = 186506, slot = L['1h_axe']}), -- Akama's Edge
        Transmog({item = 186467, slot = L['gun']}), -- Barrel-Blade Longrifle
        Transmog({item = 186466, slot = L['2h_axe']}), -- Ethereum Nexus-Reaver
        Transmog({item = 186468, slot = L['dagger']}), -- Talon of the Tempest
        Spacer(), Mount({item = 186469, id = 293}), -- Illidari Doomhawk
        Toy({item = 186501}) -- Doomwalker Trophy Stand
    }
}) -- Doomwalker

map.nodes[50704110] = ns.node.AnniversaryNPC({ -- TODO: if Anniversary Event is relevant for Classic: coords need to be updated. was moved from caverns of time.
    id = 158061,
    icon = 136235,
    rewards = {
        Transmog({item = 147885}), -- Bronze-Tinted Sunglasses
        Transmog({item = 178514, slot = L['cloak']}), -- Crafted Cloak of War
        Pet({item = 136925, id = 1890}), -- Corgi Pup
        Pet({item = 186556, id = 3100}) -- Timeless Mechanical Dragonling
    }
}) -- Historian Ma'di
