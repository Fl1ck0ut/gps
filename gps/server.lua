--[[
 _                             _                _  _     ____  _____   ____  _____ 
| |                           | |             _| || |_  / ___||  _  | / ___||  _  |
| |__    __ _  _ __ ___     __| |  ___  _ __ |_  __  _|/ /___ | |_| |/ /___ | |_| |
| '_ \  / _` || '_ ` _ \   / _` | / _ \| '__| _| || |_ | ___ \\____ || ___ \\____ |
| | | || (_| || | | | | | | (_| ||  __/| |   |_  __  _|| \_/ |.___/ /| \_/ |.___/ /
|_| |_| \__,_||_| |_| |_|  \__,_| \___||_|     |_||_|  \_____/\____/ \_____/\____/ 
                                                                                   
                                                                                                                                                                                                                                                                                                                    
]]
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_gps") 
vRP = Proxy.getInterface("vRP")

vRP.defInventoryItem({'gps','GPS','En anvanceret GPS', function(args)
    local choices = {}
    choices['> Brug'] = {function(player,choice,mod) --Laver Valgmulighed
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
			vRP.tryGetInventoryItem({user_id,"gps",1,true}) --tager item
			TriggerClientEvent('flicks-gps:start', player) --Køre eventet
            vRP.closeMenu({player})
        end
    end}
    return choices
end, 0.50}) --vægt af item