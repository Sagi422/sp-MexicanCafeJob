local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('sp-MexicanCafeJob:checkitem', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

RegisterServerEvent('sp-MexicanCafeJob:deleteitem')
AddEventHandler('sp-MexicanCafeJob:deleteitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        if player.Functions.GetItemByName(item) ~= nil then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1) 
            player.Functions.RemoveItem(item, count)
        else
            TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
        end
    end
end)

RegisterServerEvent('sp-MexicanCafeJob:giveitem')
AddEventHandler('sp-MexicanCafeJob:giveitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        player.Functions.AddItem(item, count)
    end
end)

RegisterServerEvent("sp-MexicanCafeJob:ReturnVehicleServer")
AddEventHandler("sp-MexicanCafeJob:ReturnVehicleServer", function(netId)
    local vehicle = NetworkGetEntityFromNetworkId(netId)

    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
        TriggerClientEvent("QBCore:Notify", -1, "Vehicle Returned!", "success")
    end
end)
