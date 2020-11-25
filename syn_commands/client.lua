

RegisterCommand("Stinky",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, -166523388 , 1, 1, 0, 0)
end)

RegisterCommand("tip",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, -1457020913 , 1, 1, 0, 0)
end)--TipHat

RegisterCommand("Slit",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 1256841324 , 1, 1, 0, 0)
end)--Slit Throut

RegisterCommand("SlwClp",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 1023735814 , 1, 1, 0, 0)
end)--Slow Clap

RegisterCommand("Smh",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, -653113914 , 1, 1, 0, 0)
end)--smh

RegisterCommand("Spit",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, -2106738342, 1, 1, 0, 0)
end)--Spit

RegisterCommand("No",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 1509171361, 1, 1, 0, 0)
end)--Thumbs Down

RegisterCommand("Yes",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 425751659, 1, 1, 0, 0)
end)--Thumbs Up

RegisterCommand("Wave",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, -339257980, 1, 1, 0, 0)
end)--wave

RegisterCommand("Bird",function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 969312568 , 1, 1, 0, 0)
end)--smh

RegisterCommand("dv", function()--Delete Vehicle
    local playerPed = PlayerPedId()
    local vehicle   = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed, true) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    end

    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    end
end)

RegisterNetEvent('syn_commands:heal')
AddEventHandler('syn_commands:heal', function(id)
    local closestPlayerPed = GetPlayerPed(id)
    print(closestPlayerPed)
    local health = GetAttributeCoreValue(closestPlayerPed, 0)
    local newHealth = health + 100
    local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
    local newStamina = stamina + 100
    local health2 = GetEntityHealth(closestPlayerPed)
    local newHealth2 = health2 + 100
    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
    TriggerEvent("srp:drink", 100)
    TriggerEvent("srp:eat", 100)
    SetEntityHealth(closestPlayerPed, newHealth2)
end)

RegisterNetEvent('syn_commands:tpm')
AddEventHandler('syn_commands:tpm', function(source)
    local playerped = GetPlayerPed(source)
    local waypt = GetWaypointCoords()
     for height = 1, 1000 do
        SetEntityCoords(playerped, waypt.x, waypt.y, height + 0.0, true, true, true, false)
        local foundGround, zPos = GetGroundZAndNormalFor_3dCoord(waypt.x, waypt.y, height + 0.0)
        if foundGround then
            SetEntityCoords(playerped, waypt.x, waypt.y, height + 0.0, true, true, true, false)
            break
        end
        Citizen.Wait(5)
    end 
end)
