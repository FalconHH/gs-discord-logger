local QBCore = exports['qb-core']:GetCoreObject()
local discordWebhookURLlogin = "https://discord.com/api/webhooks/1262811919551828069/wOWa9bMzGWiNiYHm5lwHE2SdVTNpVxLI1UXRRk4u1Sd5JURYfqrAOxYD5_PLk_vf-WF6"
local discordWebhookURLchat = "https://discord.com/api/webhooks/1262811482513604680/m9TtDwoMBNDgJazHYTes1VgHqou8dM1EU-q9R_Itk5CbxTq_NYCK8-4LI2aBjqB5xT9m"


local function login(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "GammaV Logger"
            },
        }
    }
    PerformHttpRequest(discordWebhookURLlogin, function(err, text, headers) end, 'POST', json.encode({username = "Server Bot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end

local function chat(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "GammaV Logger"
            },
        }
    }
    PerformHttpRequest(discordWebhookURLchat, function(err, text, headers) end, 'POST', json.encode({username = "Server Bot", embeds = connect}), { ['Content-Type'] = 'application/json' })
end

-- Event when a player joins
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local playerName = GetPlayerName(source)
    local message = playerName .. " Sunucuya giriş yaptı."
    login("Oyuncu Katıldı", message, 65280) -- Green color
end)

-- Event when a player disconnects
AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)

    if string.sub(reason, 1, 29) == "[txAdmin] Sunucu yeniden başlatılıyor." then
        login("Sunucu yeniden başlatılıyor", "Sunucu yeniden başlatılıyor.", 16776960) -- Yellow color
    else
        local message = playerName .. " Sunucudan ayrıldı. Sebep: " .. reason
        login("Oyuncu Ayrıldı", message, 16711680) -- Red color
    end
end)

-- Event for chat messages
AddEventHandler('chatMessage', function(source, name, message)
    -- Prevent the default chat message
    CancelEvent()

    -- Format the message to be sent to Discord
    local playerName = GetPlayerName(source)
    local messageContent = playerName .. ": " .. message

    chat("Chat Message", messageContent, 3447003) -- Blue color (you can choose your own color)

end)