local function get_slot_with(name, strict_comparison, min, max)
  for slot=1,16 do
    local item = turtle.getItemDetail(slot)
    if item ~= nil and strict_comparison then
      if item.name == name and (min == nil or item.count >= min) and (max == nil or item.count <= max) then
        return slot
      end
    elseif item ~= nil and string.find(item.name, name) and (min == nil or item.count >= min) and (max == nil or item.count <= max) then
      return slot
    end
  end
  return nil
end

local function send_bread()
  local slot = get_slot_with("bread")
  if slot ~= nil then
    turtle.select(slot)
    turtle.drop()
  end
  turtle.select(1)
end

local function craft_bread()
  local i1 = turtle.getItemDetail(1)
  local i2 = turtle.getItemDetail(2)
  local i3 = turtle.getItemDetail(3)

  i1 = i1 and i1.count or 0
  i2 = i2 and i2.count or 0
  i3 = i3 and i3.count or 0

  local total = i1 + i2 + i3

  if total < 3 or i1 < 1 then
    return
  end

  if i2 == 0 and i1 > 1 then
    turtle.transferTo(2, 1)
    i1 = i1 - 1
    i2 = i2 + 1
  end
  if i3 == 0 and i1 > 1 then
    turtle.transferTo(3, 1)
    i1 = i1 - 1
    i3 = i3 + 1
  end
  turtle.craft()
  send_bread()
end

send_bread()
while true do
  craft_bread()
  os.pullEvent("turtle_inventory")
end