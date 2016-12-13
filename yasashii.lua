local discordia = require('discordia')
local general = require('./commands/')
local prefix = "."

_G.client = discordia.Client()

client:on('ready', function()
  print(clien.userCount.." users, in "..client.channelCount.." channels of "..client.guildCount.."servers")
end)

client:on('messageCreate', function(msg)
  if (msg.author.bot == true) then return true end
  if (msg.channel.isPrivate == true) then return true end
    
  if (string.find(msg.content, ".", 1, 1)) then 
    local cmd = string.sub(string.match(msg.content, '(%S+) (.*)'), string.len(prefix)+1)
    local args = string.sub(msg.content, string.len(cmd)+2))
  end
end)

client:run(read_file("YasashiiToken.txt"))
