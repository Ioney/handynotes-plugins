-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale
local Map = ns.Map

local Rare = ns.node.Rare

local Achievement = ns.reward.Achievement
local Transmog = ns.reward.Transmog

local POI = ns.poi.POI

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = ns.Map({id = 249, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[38206028] = Rare({
    id = 50063,
    rewards = {
        Transmog({item = 69877, slot = L['leather']}),
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
    }
}) -- Akma'hat

map.nodes[45054255] = Rare({
    id = 50065,
    rewards = {Transmog({item = 67243, slot = L['2h_mace']})}
}) -- Armagedillo

local Cyrus = Rare({
    id = 50064,
    fgroup = 'cyrus',
    rewards = {Transmog({item = 67242, slot = L['mail']})}
}) -- Cyrus the Black

map.nodes[58406160] = Cyrus
map.nodes[66606800] = Cyrus
map.nodes[70807420] = Cyrus
map.nodes[58008260] = Cyrus

-------------------------------------------------------------------------------
-------------------------- MYSTERIOUS CAMEL FIGURINE --------------------------
-------------------------------------------------------------------------------

local Camel = ns.node.Collectible({
    id = 50409,
    icon = 454772,
    fgroup = 'camel',
    rewards = {
        Achievement({id = 5767}), ns.reward.Mount({item = 63046, id = 400}),
        ns.reward.Title({id = 143, pattern = '{player}, {title}'})
    }
}) -- Mysterious Camel Figurine

map.nodes[50503150] = Camel
map.nodes[52202800] = Camel
map.nodes[45201600] = Camel
map.nodes[34301960] = Camel
map.nodes[34402130] = Camel
map.nodes[33702540] = Camel
map.nodes[33202810] = Camel
map.nodes[29902490] = Camel
map.nodes[29902050] = Camel
map.nodes[32004530] = Camel
map.nodes[32704760] = Camel
map.nodes[25405110] = Camel
map.nodes[24406000] = Camel
map.nodes[22106410] = Camel
map.nodes[25606590] = Camel
map.nodes[26306510] = Camel
map.nodes[28506370] = Camel
map.nodes[30406270] = Camel
map.nodes[30606050] = Camel
map.nodes[33106010] = Camel
map.nodes[33206280] = Camel
map.nodes[31006640] = Camel
map.nodes[31006750] = Camel
map.nodes[31506930] = Camel
map.nodes[33207200] = Camel
map.nodes[33306780] = Camel
map.nodes[37106410] = Camel
map.nodes[38306070] = Camel
map.nodes[38505490] = Camel
map.nodes[40804980] = Camel
map.nodes[40004500] = Camel
map.nodes[40104340] = Camel
map.nodes[40203840] = Camel
map.nodes[46304460] = Camel
map.nodes[48204640] = Camel
map.nodes[51804930] = Camel
map.nodes[51005080] = Camel
map.nodes[50505070] = Camel
map.nodes[51505120] = Camel
map.nodes[52105120] = Camel
map.nodes[51907080] = Camel
map.nodes[50407220] = Camel
map.nodes[50207370] = Camel
map.nodes[49107590] = Camel
map.nodes[47307670] = Camel
map.nodes[51107980] = Camel
map.nodes[73407360] = Camel
map.nodes[69905810] = Camel
map.nodes[72004390] = Camel
map.nodes[64703030] = Camel
