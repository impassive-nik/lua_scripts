local conf = require("config")

local dropper = peripheral.wrap(conf.dropper_side)

local function get_name()
  return peripheral.getName(dropper)
end

return { peripheral=dropper,
         get_name=get_name }