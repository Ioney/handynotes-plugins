-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

local Achievement = ns.reward.Achievement
local Pet = ns.reward.Pet

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = ns.Map({id = 37, settings = true})
-- local northshire = ns.Map({id = 425, settings = true})
local stormwind = ns.Map({id = 84, settings = true})

-------------------------------------------------------------------------------
------------------------------- CRAZY FOR CATS --------------------------------
-------------------------------------------------------------------------------

map.nodes[44215344] = ns.node.CrazyForCats({
    faction = 'Alliance',
    id = 6367,
    rewards = {
        ns.reward.Achievement({
            id = 8397,
            criteria = {23587, 23578, 23582, 23592},
            oneline = true
        }), Pet({item = 8485, id = 40}), Pet({item = 8486, id = 41}),
        Pet({item = 8487, id = 43}), Pet({item = 8488, id = 45})
    }
}) -- Donni Anthania - Cat Carrier (Bombay), Cat Carrier (Cornish Rex), Cat Carrier (Orange Tabby), Cat Carrier (Silver Tabby)

stormwind.nodes[44215344] = ns.node.CrazyForCats({
    -- parent = map.id,
    faction = 'Alliance',
    note = L['cfc_lil_timmy'],
    id = 8666,
    rewards = {
        Achievement({
            id = 8397,
            criteria = {23587, 23578, 23582, 23592},
            oneline = true
        }), Pet({item = 8485, id = 40}), Pet({item = 8486, id = 41}),
        Pet({item = 8487, id = 43}), Pet({item = 8488, id = 45})
    }
}) -- Lil Timmy - White Kitten
