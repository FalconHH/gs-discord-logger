local QBCore = exports['qb-core']:GetCoreObject()
local discordWebhookURLlogin = "your_webhook"
local discordWebhookURLchat = "your_webhook"


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


AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local playerName = GetPlayerName(source)
    local message = playerName .. " Joined server"
    login("Player Joined", message, 65280) 
end)


AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    local message = playerName .. " Left server. Reason: " .. reason
    login("Player Left", message, 16711680)
end)


AddEventHandler('chatMessage', function(source, name, message)
    CancelEvent()
    local playerName = GetPlayerName(source)
    local messageContent = playerName .. ": " .. message
    chat("Chat Message", messageContent, 3447003) 
end)
