local ESX = exports["es_extended"]:getSharedObject()

lib.callback.register('krs_notepad:getName', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    return name
end)

RegisterNetEvent("krs_notepad:createItems", function(data)
    local data = data
    local source = source

    local ox_inventory = exports.ox_inventory

    ox_inventory:AddItem(source, Krs.Item, 1, data)
end)