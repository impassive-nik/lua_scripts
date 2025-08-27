local config = require("config")

if config.is_pda then
  shell.run("chat", "join", config.chat_id, config.username)
else
  shell.run("chat", "host", config.chat_id)
end