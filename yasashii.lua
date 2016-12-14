-- Modules -- 
local discordia = require('discordia')
local general = require('./commands/')
local prefix = "."

-- Global vars --
_G.client = discordia.Client()

-- Function --
function read_file(path)
	local file = io.open(path, "rb")
	if not file then return nil end
	local content = file:read "*a"
	file:close()
	return content
end

-- Discordia Event : Ready --
client:on('ready', function()
  print(clien.userCount.." users, in "..client.channelCount.." channels of "..client.guildCount.."servers")
end)

-- Discordia Event : MessageCreate --
client:on('messageCreate', function(msg)
  if (msg.author.bot == true) then return true end
  if (msg.channel.isPrivate == true) then return true end
    
  if (string.find(msg.content, ".", 1, 1)) then 
    local cmd = string.sub(string.match(msg.content, '(%S+) (.*)'), string.len(prefix)+1)
    local args = string.sub(msg.content, string.len(cmd)+2))
    local cmds = read_file("./commands/"..cmd..".lua")
    if cmds ~= "" and cmds ~= nil then
      print('Work !)
      return  
    end
  end
end)

client:run(read_file("YasashiiToken.txt"))
