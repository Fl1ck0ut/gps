--[[
 _                             _                _  _     ____  _____   ____  _____ 
| |                           | |             _| || |_  / ___||  _  | / ___||  _  |
| |__    __ _  _ __ ___     __| |  ___  _ __ |_  __  _|/ /___ | |_| |/ /___ | |_| |
| '_ \  / _` || '_ ` _ \   / _` | / _ \| '__| _| || |_ | ___ \\____ || ___ \\____ |
| | | || (_| || | | | | | | (_| ||  __/| |   |_  __  _|| \_/ |.___/ /| \_/ |.___/ /
|_| |_| \__,_||_| |_| |_|  \__,_| \___||_|     |_||_|  \_____/\____/ \_____/\____/ 
                                                                                   
                                                                                                                                                                                                                                                                                                                    
]]

local player = GetPlayerPed()

RegisterNetEvent('flicks-gps:start') --finder event
AddEventHandler('flicks-gps:start', function()

	exports['progressBars']:startUI(4500, "Sætter GPS") --Progressbar
	FreezeEntityPosition(player, true) --fryser spiller
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true) --laver emote
	Citizen.Wait(4500)
	FreezeEntityPosition(player, false) --unfryser spiller
	SetNewWaypoint(1216.4000244141+0.0001,-2947.0124511719+0.0001) --Sætter GPS
	exports['mythic_notify']:DoCustomHudText('inform', 'Du satte GPS')
	ClearPedTasks(player)

end)

