checkWhitelistProps = function(props) -- creation of the function that checks the whitelist props
    for a,b in pairs(Config.PropsWhitelisted) do -- a loop is made on the variable propsWhitelisted to get the whitelist props in the table (for a,b = k,v)
        if props == GetHashKey(b) then -- if the props is whitelist we return true, so leave the props spawn
            return true -- its possible to spawn props
        end
    end
end

AddEventHandler('entityCreating', function(entity) -- event for onesync
    local entity_model = GetEntityModel(entity) -- to get the entity creating
    local check_props = checkWhitelistProps(entity_model) -- we call the function that checks the whitelist to see if the created entity is whitelist

    if GetEntityType(entity) == 3 then -- for objects ( 1 = ped, 2 = vehicle ), we therefore make this condition not to prevent entities other than objects
        if not check_props then -- if the props is not whitelist
            CancelEvent() -- we cancel the event, so we prevent the spawn (for the client, the modder its despawn instant, and the players do not see.)
        end
    end
end)

--[[
    For get the author of entity created, use the native « NetworkGetEntityOwner (in parameter put « entity » if we take the example above) »
]]