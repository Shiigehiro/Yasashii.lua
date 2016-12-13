local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
  --console.log(`${bot.users.size} users, in ${bot.channels.size} channels of ${bot.guilds.size} servers`);
  print(clien.userCount.." users, in "..client.channelCount.." channels of "..client.guildCount.."servers")
end)

client:on('messageCreate', function(message)
  if message.content == '!ping' then
    message.channel:sendMessage('!pong')
  end
end)

client:run(read_file("YasashiiToken.txt"))
