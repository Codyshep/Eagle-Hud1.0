local hunger = nil
local thirst = nil


while true do
    Citizen.Wait(1000)
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            local decodedhunger = json.encode(status.val / 10000)
            local resulthunger = math.floor(decodedhunger)
            hunger = math.floor(resulthunger)
        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            local decodedthirst = json.encode(status.val / 10000)
            local resultthirst = math.floor(decodedthirst)
            thirst = math.floor(resultthirst)
        end)
    SendNUIMessage({
        type = "playerHealth", -- This type matches what you're expecting in JavaScript
        playerHealth = GetEntityHealth(GetPlayerPed(-1)) - 100,
        playerArmor = GetPedArmour(GetPlayerPed(-1)),
        playerHunger = hunger,
        playerThirst = thirst
    })
end