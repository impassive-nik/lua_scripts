local base_url = require("installer").base_url
shell.run("wget", "run", base_url .. "installer.lua")