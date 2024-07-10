local conf = require("config")

local chest = peripheral.wrap(conf.chest_side)

local function get_items()
  local items = {}
  for slot, item in pairs(chest.list()) do
    if items[item.name] ~= nil then
      local t = items[item.name]
      table.insert(t.slots, slot)
      t.count = t.count + item.count
    else
      items[item.name] = {name=item.name,
                          displayName=chest.getItemDetail(slot).displayName,
                          slots={slot},
                          count=item.count}
    end
  end
  return items
end

local function find_items(name, strict_comparison, items)
  if items == nil then
    items = get_items()
  end

  if strict_comparison then
    if items[name] ~= nil then
      return items[name]
    end
    return nil
  end

  for item_name, item in pairs(items) do
    if string.find(item_name, name) then
      return item
    end
  end
  return nil
end

local function get_name()
  return peripheral.getName(chest)
end

return { peripheral=chest,
         get_name=get_name,
         get_items=get_items,
         find_items=find_items }