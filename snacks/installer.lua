local base_url = "https://raw.githubusercontent.com/impassive-nik/lua_scripts/master/snacks/"
local files = {
  "chest.lua",
  "config.lua",
  "debug.lua",
  "dropper.lua",
  "furnace.lua",
  "installer.lua",
  "master.lua",
  "startup.lua",
  "update.lua" }

for _, f in ipairs(files) do
  if fs.exists(f) then
    fs.delete(f)
  end
  shell.run("wget", base_url .. f)
end

return {base_url=base_url, files=files}