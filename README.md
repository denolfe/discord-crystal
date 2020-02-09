# Discord Bot

General-use Discord bot written in Crystal

## Installation

- [Crystal-lang](https://crystal-lang.org/) needed for development
- Docker/docker-compose (optional)

### Configuration

Configuration is done through environment variables, `.env` file is read if it exists

- `DISCORD_TOKEN` - Discord token generated from your Discord developer console
- `PREFIX` - Command prefix, defaults to `!`

## Usage

- Clone then compile `shards build`
- `crystal run bin/bot`

### Commands

- choose - Chooses randomly between provided choices
- dadjoke - Random Dad Joke
- 8ball - Shake magic 8-ball
- flip - Choose a side and flip a coin
- help - Displays all commands or details about specific command
- ping - Pings the bot
- roll - Roll a 6-sided die
- time - Displays the bot's time
- uptime - Displays the bot's uptime
- ud - Urban Dictionary definition

### Auto-Reactions

- :beers: emoji reaction to anything saying "cheers"
- :peanuts: emoji reaction to any variation of "nuts", "nutty"

## Contributors

- [Elliot DeNolf](https://github.com/denolfe) - creator and maintainer
