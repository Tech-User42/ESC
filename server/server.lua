VehicleSirenState = {}


RegisterNetEvent("gyro:setSirenState_s")
AddEventHandler("gyro:setSirenState_s", function(newstate,vehicle)
    local source = source
    if(VehicleSirenState[vehicle] == nil) then
        VehicleSirenState[vehicle] = newstate
        TriggerClientEvent("gyro:setSirenState_c", -1, source,VehicleSirenState[vehicle], vehicle)
    else
        if(VehicleSirenState[vehicle] == newstate) then
            TriggerClientEvent("gyro:setSirenState_c", source, source,VehicleSirenState[vehicle], vehicle)
        else
            VehicleSirenState[vehicle] = newstate
            TriggerClientEvent("gyro:setSirenState_c", -1, source,VehicleSirenState[vehicle], vehicle)
        end
    end
end)

