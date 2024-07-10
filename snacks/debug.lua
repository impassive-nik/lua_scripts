local function print_contents(side, debug)
  local chest = peripheral.wrap(side)

  for slot, item in pairs(chest.list()) do
    if debug then
      print(textutils.serialize(item))
    else
      print(("%d x %s in slot %d"):format(item.count, item.name, slot))
    end
  end
end

return { print_contents=print_contents }