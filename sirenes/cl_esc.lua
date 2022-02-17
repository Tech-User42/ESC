gyrophare = false
sirene = false
ui = false
m_soundID_veh = {}
m_siren_state = {}


RegisterNetEvent("gyro:setSirenState_c")
AddEventHandler("gyro:setSirenState_c", function(sender, newstate,dict_veh,liste_vehicule)
    local player_s = GetPlayerFromServerId(sender)
    if player_s ~= -1 then 
        local ped_s = GetPlayerPed(player_s)
        if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
            if IsPedInAnyVehicle(ped_s, false) then
                local veh = GetVehiclePedIsUsing(ped_s)
                if getSirenState(veh) == 1 then
                    setSirenState(veh, 0,dict_veh,liste_vehicule)
                else
                    setSirenState(veh, newstate,dict_veh,liste_vehicule)
                end
                
            end
        end
    end 
end)

function setSirenState(veh, newstate,dict_veh,liste_vehicule)


    if DoesEntityExist(veh) and not IsEntityDead(veh) then
        local index = 1
        for k in pairs(liste_vehicule) do
            if liste_vehicule[k] == GetEntityModel(veh) then
                index = k
                break 
            end
        end

        if newstate ~= m_siren_state[veh] then
                
            if m_soundID_veh[veh] ~= nil then
                StopSound(m_soundID_veh[veh])
                ReleaseSoundId(m_soundID_veh[veh])
                m_soundID_veh[veh] = nil
                sirene = false
            end
                        
            if newstate == 1 then

                m_soundID_veh[veh] = GetSoundId()
                PlaySoundFromEntity(m_soundID_veh[veh], dict_veh[index], veh, 0, 0, 0)
                sirene = not sirene
                
            elseif newstate == 3 then

                StopSound(m_soundID_veh[veh])
                ReleaseSoundId(m_soundID_veh[veh])
                m_soundID_veh[veh] = nil
                
            end
            m_siren_state[veh] = newstate
                
        end
    end
end
function getSirenState(veh)
    return m_siren_state[veh]
end
local CONTROLS = {
    TOGGLE = {"", 80 --[[INPUT_VEH_CIN_CAM]]},
    ENABLE = {"Passer en Code 3", 80 --[[INPUT_VEH_CIN_CAM]]},
    DISABLE = {"Passer en Code 2", 80 --[[INPUT_VEH_CIN_CAM]]},
    LIGHTS = {"Passer en Code 2", 86 --[[INPUT_VEH_HORN]]},
}
function ShowHelpNotification(msg, beep)
	local beep = beep
	if beep == nil then
		beep = true
	end
	AddTextEntry('HelpNotification', msg)
	DisplayHelpTextThisFrame('HelpNotification', false)
	BeginTextCommandDisplayHelp('HelpNotification')
	EndTextCommandDisplayHelp(0, false, beep, 1)
end

RegisterNetEvent('gyro:on')
AddEventHandler('gyro:on', function()
    if (true) then
        SendNUIMessage({
        type = "ui",
        display = true
        })
        ui = true
    end
  end)
RegisterNetEvent('gyro:off')
AddEventHandler('gyro:off', function()
    if (true) then
        SendNUIMessage({
        type = "ui",
        display = false
        })
    end
  end)
Citizen.CreateThread(function()
    local is_ui_enable = Config.UI
    if not is_ui_enable then
        TriggerEvent("gyro:off")
    end
    while(is_ui_enable == true) do
        if(gyrophare) then
            SendNUIMessage({
                type = "gyro",
                value = 2
            })
            if(sirene) then
            SendNUIMessage({
                type = "siren",
                value = 2
                })
            end
            Citizen.Wait(250)
            SendNUIMessage({
            type = "gyro",
            value = 1
            })
            SendNUIMessage({
                type = "siren",
                value = 1
                })
            Citizen.Wait(250)
            
        end
        Citizen.Wait(1)
    end
  end)

  function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
 function utils_Set(list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end
function RegisterCarNameAndSiren(...)
    local liste_sirene = {}
    for _,Vehicules in pairs(Config.Vehicules) do
        table.insert(liste_sirene, Vehicules.sirene)
        --print(Vehicules.sirene)
    end
    return liste_sirene
  end
Citizen.CreateThread(function()
    -- LOCAL OPTIMIZATION
    local Wait = Wait
    local GetVehiclePedIsUsing = GetVehiclePedIsUsing
    local PlayerPedId = PlayerPedId
    local IsVehicleSirenOn = IsVehicleSirenOn
    local DisableControlAction = DisableControlAction
    local IsDisabledControlJustPressed = IsDisabledControlJustPressed
    local DecorExistOn = DecorExistOn
    local DecorGetBool = DecorGetBool
    local DecorSetBool = DecorSetBool
    local PlaySoundFrontend = PlaySoundFrontend
    local liste_vehicule = {}
    for _,Vehicules in pairs(Config.Vehicules) do
        table.insert(liste_vehicule, GetHashKey(Vehicules.name))
    end
    dict_veh = RegisterCarNameAndSiren(Config.Vehicules)
    -- END LOCAL OPTIMIZATION
    AddTextEntry("ESC_ENABLE", CONTROLS['ENABLE'][1])
    AddTextEntry("ESC_DISABLE", CONTROLS['DISABLE'][1])
    AddTextEntry("ESC_LIGHTS", CONTROLS['LIGHTS'][1])
    DecorRegister("esc_siren_enabled", 2)
    DecorRegisterLock()
    _set = utils_Set(liste_vehicule)
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        local entit = GetEntityModel(veh)
        if _set[entit] then
            if Config.UI then
                TriggerEvent('gyro:on', true)
            end
            if IsVehicleSirenOn(veh) then
                gyrophare = true
                DisableControlAction(0, CONTROLS['TOGGLE'][2], true)
                if sirene == true then
                    ShowHelpNotification("~INPUT_VEH_CIN_CAM~ Couper le ~r~Code 3 ~s~", false)
                else
                    ShowHelpNotification("~INPUT_VEH_CIN_CAM~ Mettre le ~r~Code 3 ~s~", false)
                end
                if IsDisabledControlJustPressed(0, CONTROLS['TOGGLE'][2]) then
                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    TriggerServerEvent("gyro:setSirenState_s", 1,dict_veh,liste_vehicule)
                end
            else
                gyrophare = false
            end
        else
            if Config.UI then
                TriggerEvent('gyro:off', true)
            end
        end
    end
end)
Citizen.CreateThread(function()
    -- LOCAL OPTIMIZATION
    local EnumerateVehicles = EnumerateVehicles
    local DecorExistOn = DecorExistOn
    local DecorGetBool = DecorGetBool
    local DisableVehicleImpactExplosionActivation = DisableVehicleImpactExplosionActivation
    local Wait = Wait
    -- END LOCAL OPTIMIZATION
    while true do
        Wait(0)
        local _c = 0
        for veh in EnumerateVehicles() do
            if DecorExistOn(veh, "esc_siren_enabled") and DecorGetBool(veh, "esc_siren_enabled") then
                DisableVehicleImpactExplosionActivation(veh, false)
            else
                DisableVehicleImpactExplosionActivation(veh, true)
            end
            _c = (_c + 1) % 10
            if _c == 0 then
                Wait(0)
            end
        end
    end
end)
