ESX = exports.es_extended:getSharedObject()

RegisterServerEvent("snake:setRadio")
AddEventHandler("snake:setRadio", function(RadioAnim)
    local ply = ESX.GetPlayerFromId(source)
    MySQL.Async.execute("UPDATE users SET radio = @Anim WHERE identifier = @iden", {
        ["@iden"] = ply.getIdentifier(),
        ["@Anim"] = RadioAnim
    })
end)

ESX.RegisterServerCallback("snake:radioo", function(source, cb)
    local src = source
    local ply = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @iden', {['@iden'] = ply.getIdentifier()},function(res)
        if res[1] then
            for kappa, vu in pairs(res) do
                cb(vu.radio)
            end
        else
            cb(false)
        end
    end)
end)

