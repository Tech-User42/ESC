RegisterNetEvent("gyro:setSirenState_s")
AddEventHandler("gyro:setSirenState_s", function(newstate,dict_veh,liste_vehicule)
    TriggerClientEvent("gyro:setSirenState_c", -1, source, newstate,dict_veh,liste_vehicule)
end)