local conf = require("config")

local furnace = peripheral.wrap(conf.furnace_side)

local item_slot = 1
local fuel_slot = 2

local function get_items()
  return furnace.getItemDetail(item_slot)
end

local function get_fuel()
  return furnace.getItemDetail(fuel_slot)
end

local function get_name()
  return peripheral.getName(furnace)
end

return { peripheral=furnace,
         get_name=get_name,
         item_slot, fuel_slot,
         get_items=get_items,
         get_fuel=get_fuel }