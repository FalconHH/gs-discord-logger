local QBCore = exports['qb-core']:GetCoreObject()
local discordWebhookURL = "YOUR_DISCORD_WEBHOOK_LINK"


local function sendToDiscord(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "GammaV Notification"
            },
        }
    }
    PerformHttpRequest(discordWebhookURL, function(err, text, headers)
        print("Discord Webhook response: ", err, text) -- Debug print
    end, 'POST', json.encode({username = "GammaV Login Logger", embeds = connect}), { ['Content-Type'] = 'application/json' })
end


AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local playerName = GetPlayerName(source)
    local playerID = source
    local message = playerName .. " Logged in"

    sendToDiscord("Player Join", message, 65280) -- Green color
end)


AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    local playerID = source
    local message = playerName .. " Logged out. Reason: " .. reason

    sendToDiscord("Player Left", message, 16711680) -- Red color
end)
