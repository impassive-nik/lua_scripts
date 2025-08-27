local conf = require("config")
shell.run("wget", "run", conf.base_url .. "installer.lua")
