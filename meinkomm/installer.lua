local base_url = "https://raw.githubusercontent.com/impassive-nik/lua_scripts/master/meinkomm/"
local files = { "config.lua", "startup.lua", "update.lua" }

for _, f in ipairs(files) do
  if fs.exists(f) then
    fs.delete(f)
  end
  shell.run("wget", base_url .. f)
end
