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

        function point:nearby()
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 58, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 80, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 250, true)
            DisableControlAction(0, 257, true)
         end

        function point:onEnter()
            lib.notify({
                title = 'Safezone',
                description = 'Beléptél '.. safezone.name.. ' safezoneba',
                type = 'inform'
            })
        end

        function point:onExit()
            lib.notify({
                title = 'Safezone',
                description = 'Kiléptél '.. safezone.name.. ' safezoneból',
                type = 'inform'
            })
        end


    end 
end)