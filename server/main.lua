local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('sp-donutjob:server:giveitem')
AddEventHandler('sp-donutjob:server:giveitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) 
        player.Functions.AddItem(item, count)
    end
end)

RegisterServerEvent('sp-donutjob:server:deleteitem')
AddEventHandler('sp-donutjob:server:deleteitem', function(item, count)
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

RegisterServerEvent('sp-donutjob:server:deductMoney')
AddEventHandler('sp-donutjob:server:deductMoney', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveMoney('cash', amount, 'donutshop')
    end
end)