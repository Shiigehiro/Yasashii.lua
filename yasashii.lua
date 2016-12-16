-- Modules --
local discordia = require('discordia')
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
  print(client.userCount.." users, in "..client.channelCount.." channels of "..client.guildCount.." servers")
end)

-- Discordia Event : MessageCreate --
client:on('messageCreate', function(msg)
  if (msg.author.bot == true) then return true end
  if (msg.channel.isPrivate == true) then return true end

  if (string.find(msg.content, ".", 1, 1)) then
    local _cmd = string.sub(string.match(msg.content, '(%S+) (.*)'), string.len(prefix)+1)
    local args = string.sub(msg.content, string.len(_cmd)+3)
    local _cmds = read_file("./commands/".._cmd..".lua")
    if _cmds ~= "" and _cmds ~= nil then
      local line = "./commands/".._cmd..""
      local cmd = require (line)
        cmd.run(msg,args)
      return
    end
  end
end)

client:run(read_file("YasashiiToken.txt"))
