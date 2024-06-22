local QBCore = exports['qb-core']:GetCoreObject()
local spawnedProps = {}

-- Function to get ground Z coordinate
local function getGroundZ(x, y, z)
    local foundGround, groundZ = GetGroundZFor_3dCoord(x, y, z, false)
    while not foundGround do
        Citizen.Wait(100)
        z = z + 1.0
        foundGround, groundZ = GetGroundZFor_3dCoord(x, y, z, false)
    end
    return groundZ
end

-- Function to spawn a prop
local function spawnProp(propName, coords)
    local hash = GetHashKey(propName)
    print("Requesting model for prop: " .. propName)
    
    RequestModel(hash)
    local timeout = 0
    while not HasModelLoaded(hash) do
        Citizen.Wait(100)
        timeout = timeout + 1
        if timeout > 50 then -- Timeout after 5 seconds
            print("Failed to load model for prop: " .. propName)
            return
        end
    end

    print("Model loaded for prop: " .. propName)
    
    local groundZ = getGroundZ(coords.x, coords.y, coords.z)
    local prop = CreateObject(hash, coords.x, coords.y, groundZ, true, true, false)
    if prop then
        table.insert(spawnedProps, prop)
        print("Prop spawned: " .. propName .. " at " .. coords.x .. ", " .. coords.y .. ", " .. groundZ)
    else
        print("Failed to create object for prop: " .. propName)
    end
    
    SetModelAsNoLongerNeeded(hash)
end

-- Function to delete all spawned props
local function deleteAllProps()
    for _, prop in pairs(spawnedProps) do
        if DoesEntityExist(prop) then
            DeleteObject(prop)
        end
    end
    spawnedProps = {}
    print("All spawned props have been deleted.")
end

-- Function to open prop selection menu
local function openPropMenu()
    local categories = {}

    for _, prop in pairs(Config.Props) do
        if not categories[prop.category] then
            categories[prop.category] = {}
        end
        table.insert(categories[prop.category], prop)
    end

    local menuOptions = {}

    for category, props in pairs(categories) do
        table.insert(menuOptions, {
            header = category,
            txt = "Select a prop from " .. category,
            params = {
                event = "t3_propspawn:openSubMenu",
                args = { props = props, category = category }
            }
        })
    end

    table.insert(menuOptions, {
        header = "Delete All Props",
        txt = "Delete all spawned props",
        params = {
            event = "t3_propspawn:deleteProps"
        }
    })

    exports['qb-menu']:openMenu(menuOptions)
end

-- Function to open submenu for a category
RegisterNetEvent('t3_propspawn:openSubMenu', function(data)
    local props = data.props
    local category = data.category
    local submenuOptions = {}

    for _, prop in pairs(props) do
        table.insert(submenuOptions, {
            header = prop.label,
            txt = "Spawn " .. prop.label,
            params = {
                event = "t3_propspawn:selectProp",
                args = { propName = prop.name }
            }
        })
    end

    table.insert(submenuOptions, {
        header = "< Back",
        params = {
            event = "t3_propspawn:openMainMenu"
        }
    })

    exports['qb-menu']:openMenu(submenuOptions)
end)

-- Function to open the main menu again
RegisterNetEvent('t3_propspawn:openMainMenu', function()
    openPropMenu()
end)

-- Event to handle prop selection
RegisterNetEvent('t3_propspawn:selectProp', function(data)
    local propName = data.propName
    local playerCoords = GetEntityCoords(PlayerPedId())
    spawnProp(propName, playerCoords)
end)

-- Event to handle prop deletion
RegisterNetEvent('t3_propspawn:deleteProps', function()
    deleteAllProps()
end)

-- Command to open prop menu
RegisterCommand('propMenu', function()
    openPropMenu()
end, false)

-- Clean up spawned props on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    print("Resource stopping, cleaning up props...")
    deleteAllProps()
end)
