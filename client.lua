-- Função para alertar a polícia sobre um roubo
function AlertPolice(vehicle)
    exports['ps-dispatch']:VehicleTheft(vehicle)
end

-- Evento para ligar o carro com hotwire e dar chaves
RegisterNetEvent('kit155:hotwire:client', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle and vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        local isEngineRunning = GetIsVehicleEngineRunning(vehicle)

        if not isEngineRunning then
            -- Animação de ligação direta
            local animDict = "veh@break_in@0h@p_m_one@"
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do Wait(10) end

            -- Toca a animação
            TaskPlayAnim(playerPed, animDict, "low_force_entry_ds", 1.0, -1.0, 5000, 16, 0, false, false, false)

            -- Mostra a progressbar com o mesmo tempo da animação
            local success = lib.progressBar({
                duration = 5000,
                label = 'Fazendo ligação direta...',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                }
            })

            -- Limpa animação
            ClearPedTasks(playerPed)

            if success then
                -- Liga o carro
                SetVehicleEngineOn(vehicle, true, false, true)

                -- Dá as chaves temporárias
                TriggerServerEvent('mm_carkeys:server:acquiretempvehiclekeys', plate)

                -- Alerta polícia
                AlertPolice(vehicle)

                -- Feedback
                TriggerEvent('chat:addMessage', {
                    args = {"🔧 Você fez a ligação direta e ligou o carro com sucesso!"}
                })
            else
                TriggerEvent('chat:addMessage', {
                    args = {"❌ Ligação direta cancelada."}
                })
            end
        else
            TriggerEvent('chat:addMessage', {
                args = {"⚠️ O motor já está ligado."}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            args = {"🚗 Você não está dentro de um veículo."}
        })
    end
end)
