local ESX = exports['es_extended']:getSharedObject()
local parlandoInRadio = false
local prop
local animr
local display = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.TriggerServerCallback("snake:radioo", function(animazione)
        animr = animazione
        ESX.ShowNotification("Impostazioni radio caricate. Il tuo attuale stile di radio è "..animazione)
    end)
    Wait(500)
end)

startRadioAnim = function()
    Citizen.CreateThread(function()
        while parlandoInRadio do
            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(1, 22)
            Citizen.Wait(1)
        end
        DisablePlayerFiring(PlayerId(), false)
    end)
end

RegisterNetEvent('aprinui')
AddEventHandler('aprinui', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool })
end )

RegisterNUICallback('stile1', function()
    animr = 'stile1'
    TriggerEvent('aprinui', false)
end)

RegisterNUICallback('stile2', function()
    animr = 'stile2'
    TriggerEvent('aprinui', false)
end)

RegisterNUICallback('stile3', function()
    animr = 'stile3'
    TriggerEvent('aprinui', false)
end)

RegisterNUICallback('exit', function()
    TriggerEvent('aprinui', false)
end)

RegisterCommand('radiomenu', function()
    CreateThread(function()
        TriggerEvent('aprinui', true)
        while display do 
            DisableControlAction(0,1, display)
            DisableControlAction(0,142, display)
            DisableControlAction(0,18, display)
            DisableControlAction(0,322, display)
            DisableControlAction(0,2, display)
            DisableControlAction(0,106, display)
            Wait(0)
        end
    end)
end)

RegisterNetEvent("saltychat:animazioneRadio",function(bool)
    if animr == "stile1" then
        if bool then
            RequestAnimDict("random@arrests");
            while not HasAnimDictLoaded("random@arrests") do Wait(5) end
            TaskPlayAnim(PlayerPedId(),"random@arrests", "generic_radio_chatter", 8.0, 0.0, -1, 50, 0, 0, 0, 0);
            parlandoInRadio = true
            startRadioAnim()
        else
            parlandoInRadio = false
            StopAnimTask(PlayerPedId(), "random@arrests", "generic_radio_chatter", -4.0)			
        end
    elseif animr == "stile2" then
            if bool then
                RequestAnimDict("amb@code_human_police_investigate@idle_a");
                while not HasAnimDictLoaded("amb@code_human_police_investigate@idle_a") do Wait(5) end
                TaskPlayAnim(PlayerPedId(),"amb@code_human_police_investigate@idle_a","idle_b", 8.0, 0.0, -1, 49, 0, 0, 0, 0);
                parlandoInRadio = true
                startRadioAnim()
            else
                parlandoInRadio = false
                StopAnimTask(PlayerPedId(), "amb@code_human_police_investigate@idle_a","idle_b", -4.0)			
            end
    elseif animr == "stile3" then
        if bool then
            RequestAnimDict("cellphone@");
            while not HasAnimDictLoaded("cellphone@") do Wait(5) end
            TaskPlayAnim(PlayerPedId(),"cellphone@","cellphone_text_to_call", 7.0, 0.0, -1, 50, 0, 0, 0, 0);
            prop = CreateObject(GetHashKey('prop_cs_hand_radio'),0.0 ,0.0, 0.0, true, true, true)
            SetEntityCollision(prop,false,false)
            AttachEntityToEntity(prop,PlayerPedId(),GetPedBoneIndex(PlayerPedId(),28422),0.0, -0.01, 0.0, 13.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
            parlandoInRadio = true
            startRadioAnim()
        else
            parlandoInRadio = false
            StopAnimTask(PlayerPedId(), "cellphone@","cellphone_text_to_call", -4.0)			
            DeleteEntity(prop)
        end
    end
end)


