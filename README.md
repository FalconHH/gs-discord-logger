# GammaScript Logger - FiveM Lua Script

## Overview

The GammaScript Logger is a FiveM Lua script designed to log player connections, disconnections, and chat messages to a Discord channel using webhooks. This script integrates with the `qb-core` framework and sends notifications to Discord whenever a player joins or leaves the server, or sends a chat message.

## Features

- **Player Connection Logging**: Sends a message to Discord when a player connects to the server.
- **Player Disconnection Logging**: Sends a message to Discord when a player disconnects from the server.
- **Chat Message Logging**: Sends chat messages to Discord with player names.

## Requirements

- **FiveM**: Ensure you have a FiveM server set up.
- **QBcore**: This script requires the `qb-core` framework.
- **Discord Webhooks**: You need Discord webhook URLs to send messages.

## Installation

1. **Download**: Clone or download the repository.

   ```bash
   git clone https://github.com/yourusername/gammascript-logger.git
   ```

2. **Configure Webhooks**: Replace `your_webhook` in the script with your actual Discord webhook URLs.

   ```lua
   local discordWebhookURLlogin = "your_webhook"
   local discordWebhookURLchat = "your_webhook"
   ```

3. **Add to Server**: Place the Lua script in your `resources` folder of the FiveM server.

4. **Start Script**: Add the following line to your `server.cfg` to start the script:

   ```bash
   start gammascript-logger
   ```

## Usage

- **Player Connection**: When a player connects to the server, a message will be sent to the configured `discordWebhookURLlogin`.
- **Player Disconnection**: When a player disconnects, a message will be sent to the configured `discordWebhookURLlogin`.
- **Chat Messages**: When a player sends a chat message, it will be sent to the configured `discordWebhookURLchat`.

## Customization

- **Webhook URLs**: Customize the webhook URLs for login and chat by changing the `discordWebhookURLlogin` and `discordWebhookURLchat` variables.
- **Embed Colors**: Modify the color values in the `login` and `chat` functions to change the embed colors.

## Contributing

Contributions are welcome! Feel free to fork the repository and submit pull requests for any improvements or bug fixes.

## Legal Note

This code is open for improvements and personal usage. Any contributions that enhance functionality are highly encouraged.
<p align="center">
<img src="https://ziadoua.github.io/m3-Markdown-Badges/badges/LicenceCCBYNCND/licenceccbyncnd1.svg">
</p>
