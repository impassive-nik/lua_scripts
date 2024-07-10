local cfg = require("config")
local chest = require("chest")
local dropper = require("dropper")

local function give_item(item)
  if item == nil then
    return
  end

  chest.peripheral.pushItems(dropper.get_name(),
                             item.slots[1],
                             1,
                             5)
  redstone.setOutput(cfg.dropper_side, true)
  sleep(0.5)
  redstone.setOutput(cfg.dropper_side, false)
end

local monitor = peripheral.wrap(cfg.monitor_side)
local width, height = monitor.getSize()

while true do
  monitor.clear()
  monitor.setCursorPos(1, 1)
  monitor.write("Today for sale:")

  local items = chest.get_items()
  local line = 3
  local menu = {}
  for item_name, item in pairs(items) do
    monitor.setCursorPos(2, line)
    monitor.write(item.count)
    monitor.write("-")
    monitor.write(item.displayName)
    menu[line] = item
    line = line + 1
  end

  if next(menu) == nil then
    monitor.write("Sorry, come back later!")
    sleep(10)
  else
    monitor.setCursorPos(1, height)
    monitor.write("Click RMB to buy!    ")

    local event = {os.pullEvent()}

    if event[1] == "monitor_touch" then
      local event, side, x, y = unpack(event)
      if menu[y] ~= nil then
        monitor.setCursorPos(1, height)
        monitor.write("Catch it!        ")
        give_item(menu[y])
      else
        monitor.setCursorPos(1, height)
        monitor.write("Click on an item!")
      end
      sleep(2)
    end
  end

  sleep(1)
end