CreateThread(function()
    for _, safezone in ipairs(Safezones) do 
        local point = lib.points.new({
            coords = safezone.coord,
            distance = safezone.radius
        })

        local safe = AddBlipForCoord(safezone.coord)
        SetBlipSprite(safe, safezone.blip) 
        SetBlipDisplay(safe, 4)
        SetBlipScale(safe, 0.8)
        SetBlipColour(safe, safezone.color) 
        SetBlipAsShortRange(safe, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(safezone.name)
        EndTextCommandSetBlipName(safe)
        local radius = AddBlipForRadius(safezone.coord.x, safezone.coord.y, safezone.coord.z, safezone.radius)
        SetBlipAlpha(radius,80)

        function point:onEnter()
            lib.notify({
                title = 'Safezone',
                description = 'Beléptél '.. safezone.name.. ' safezoneba',
                type = 'inform'
            })
            SetLocalPlayerAsGhost(true)
            NetworkSetPlayerIsPassive(true)
        end

        function point:onExit()
            lib.notify({
                title = 'Safezone',
                description = 'Kiléptél '.. safezone.name.. ' safezoneból',
                type = 'inform'
            })
            SetLocalPlayerAsGhost(false)
            NetworkSetPlayerIsPassive(false)
        end
    end 
end)
