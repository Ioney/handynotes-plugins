-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

local Achievement = ns.reward.Achievement
local Pet = ns.reward.Pet

local POI = ns.poi.POI

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = ns.Map({id = 25, settings = true})

-------------------------------------------------------------------------------
------------------------------- CRYZY FOR CATS --------------------------------
-------------------------------------------------------------------------------

map.nodes[40404740] = ns.node.CrazyForCats({
    id = 49116,
    faction = 'Horde',
    note = L['cfc_blacktabby'],
    fgroup = 'blacktabby',
    rewards = {
        Achievement({id = 8397, criteria = 23577, oneline = true}),
        Pet({item = 8491, id = 42})
    },
    pois = {
        POI({
            color = 'Red',
            points = {
                39404820, 39404880, 39604960, 40404740, 40404780, 40404860,
                40604860, 40804800, 41404740, 41604740, 41604780
            }
        })
    }
}) -- Black Tabby Cat

map.nodes[39405920] = ns.node.CrazyForCats({
    id = 48017,
    note = L['cfc_blacktabby'],
    fgroup = 'blacktabby',
    rewards = {
        Achievement({id = 8397, criteria = 23577, oneline = true}),
        Pet({item = 8491, id = 42})
    },
    pois = {
        POI({
            color = 'Green',
            points = {
                38205900, 38406020, 39206060, 39405920, 39405960, 39605920,
                39606020
            }
        })
    }
}) -- Black Tabby Cat

map.nodes[45605280] = ns.node.CrazyForCats({
    id = 2248,
    note = L['cfc_blacktabby'],
    fgroup = 'blacktabby',
    rewards = {
        Achievement({id = 8397, criteria = 23577, oneline = true}),
        Pet({item = 8491, id = 42})
    },
    pois = {
        POI({
            color = 'Blue',
            points = {
                44005340, 44205460, 44405400, 44805320, 45205120, 45205380,
                45404980, 45405240, 45605020, 45605280, 45605380, 45805220,
                45805560, 46005540, 46605440, 46605460, 46605560, 46805340,
                47605360
            }
        })
    }
}) -- Black Tabby Cat
