while true do
  local has_block, data = turtle.inspect()
  if has_block and string.find(data.name, "turtle") then
    break
  end
  turtle.turnLeft()
  sleep(1)
end

local function get_slot_with(name, strict_comparison, min, max)
  for slot=1,16 do
    local item = turtle.getItemDetail(slot)
    if strict_comparison then
      if item.name == name and (min == nil or item.count >= min) and (max == nil or item.count <= max) then
        return slot
      end
    elseif string.find(item.name, name) and (min == nil or item.count >= min) and (max == nil or item.count <= max) then
      return slot
    end
  end
  return nil
end

local function harvest_cane()
  local has_block, data = turtle.inspect()
  if has_block and data.state ~= nil and data.state.age >= 3 then
    turtle.dig()
  end
  turtle.turnLeft()
end

local function harvest_wheat()
  local has_block, data = turtle.inspect()
  if has_block and data.state ~= nil and data.state.age >= 7 then
    turtle.dig()
    local slot = get_slot_with("seed", false)
    if slot ~= nil then
      turtle.select(slot)
      turtle.place()
      turtle.select(1)
    end
  end
  turtle.turnLeft()
end

while true do
  turtle.turnLeft()
  harvest_wheat()
  harvest_wheat()
  harvest_wheat()
  turtle.drop()
  sleep(60)
end