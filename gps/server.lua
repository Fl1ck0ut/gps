local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_firework") 
vRP = Proxy.getInterface("vRP")

vRP.defInventoryItem({'gps','GPS','Sætter GPS til Kokain mark', function(args)
    local choices = {}
    choices['> Brug'] = {function(player,choice,mod)
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
			vRP.tryGetInventoryItem({user_id,"gps",1,true})
			TriggerClientEvent('flicks-gps:start', player)
            vRP.closeMenu({player})
        end
    end}
    return choices
end, 0.50})