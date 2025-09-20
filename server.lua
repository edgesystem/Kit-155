local VehicleList = {} -- Lista para rastrear chaves temporárias

RegisterNetEvent('mm_carkeys:server:acquiretempvehiclekeys', function(plate)
    local src = source
    local citizenid = Bridge:GetPlayerCitizenId(src)
    
    if not plate then
        print("Erro: Nenhuma placa fornecida para o evento 'acquiretempvehiclekeys'")
        return
    end
    
    GiveTempKeys(src, plate)
end)

function GiveTempKeys(id, plate)
    local citizenid = Bridge:GetPlayerCitizenId(id)
    
    if not VehicleList[citizenid] then
        VehicleList[citizenid] = {}
    end

    plate = RemoveSpecialCharacter(plate)

    if Shared.keepKeysInVehicle then
        local info = { label = "CHAVE-" .. plate, plate = plate }
        Bridge:AddItem(id, 'vehiclekey', info) -- Adiciona a chave temporária ao inventário

        -- Notificações se apropriado
        local ndata = {
            title = 'Chave Temporária Adquirida',
            description = 'Você recebeu uma chave temporária para o veículo: ' .. plate,
            type = 'success'
        }
        TriggerClientEvent('ox_lib:notify', id, ndata)
    end

    -- Adiciona a placa à lista de chaves temporárias para o cidadão
    table.insert(VehicleList[citizenid], plate)

    -- Notifica o cliente
    TriggerClientEvent('mm_carkeys:client:addtempkeys', id, plate)
end

function RemoveSpecialCharacter(txt)
    return txt:gsub("%W", "")
end

print("✅ KIT 155 FREE Script carregado! Obrigado por usar meu script - Thug Developer - Edge System --> https://discord.gg/PetxZ3yXjZ")
