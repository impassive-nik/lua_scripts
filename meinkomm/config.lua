local base_url = "https://raw.githubusercontent.com/impassive-nik/lua_scripts/master/meinkomm/"

local is_pda = false
local username = nil
if pocket then
  is_pda = true
  settings.load()
  settings.define("username", {
    description = "An example setting",
    default = nil,
    type = "string",
  })

  username = settings.get("username")
  while username == nil do
    print("Enter your username:")
    username = read()
    settings.set("username", username)
    settings.save()
  end
end

local chat_id = "meinkomm"

return { base_url=base_url, chat_id=chat_id, username=username, is_pda=is_pda }
