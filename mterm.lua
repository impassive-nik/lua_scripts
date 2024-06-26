terms = {}

local function detect_terms()
  terms = {term.current()}
  local monitor = peripheral.find("monitor")
  if monitor ~= nil then
    table.insert(terms, monitor)
  end
  return terms
end

local function get_terms()
  return terms
end

local function write(message)
  for _, t in ipairs(terms) do
    t.write(message)
  end
end

local function scroll(y)
  for _, t in ipairs(terms) do
    t.scroll(y)
  end
end

local function getCursorPos()
  for _, t in ipairs(terms) do
    return t.getCursorPos()
  end
end

local function setCursorPos(x, y)
  for _, t in ipairs(terms) do
    t.setCursorPos(x, y)
  end
end

local function getCursorBlink()
  for _, t in ipairs(terms) do
    return t.getCursorBlink()
  end
end

local function setCursorBlink(blink)
  for _, t in ipairs(terms) do
    t.setCursorBlink(blink)
  end
end

local function getSize()
  width  = 999999999
  height = 999999999
  for _, t in ipairs(terms) do
    w, h = t.getSize()
    if w < width then
      width = w
    end
    if h < height then
      height = h
    end
  end
  return width, height
end

local function clear()
  for _, t in ipairs(terms) do
    t.clear()
  end
end

local function clearLine()
  for _, t in ipairs(terms) do
    t.clearLine()
  end
end

local function getTextColour()
  for _, t in ipairs(terms) do
    return t.getTextColour()
  end
end

local function getTextColor()
  for _, t in ipairs(terms) do
    return t.getTextColor()
  end
end

local function setTextColour(colour)
  for _, t in ipairs(terms) do
    t.setTextColour(colour)
  end
end

local function setTextColor(color)
  for _, t in ipairs(terms) do
    t.setTextColor(color)
  end
end

local function getBackgroundColour()
  for _, t in ipairs(terms) do
    return t.getBackgroundColour()
  end
end

local function getBackgroundColor()
  for _, t in ipairs(terms) do
    return t.getBackgroundColor()
  end
end

local function setBackgroundColour(colour)
  for _, t in ipairs(terms) do
    t.setBackgroundColour(colour)
  end
end

local function setBackgroundColor(colour)
  for _, t in ipairs(terms) do
    t.setBackgroundColor(colour)
  end
end

local function isColour()
  for _, t in ipairs(terms) do
    return t.isColour()
  end
end

local function isColor()
  for _, t in ipairs(terms) do
    return t.isColor()
  end
end

local function blit(text, textColour, backgroundColour)
  for _, t in ipairs(terms) do
    t.blit(text, textColour, backgroundColour)
  end
end

local function getPaletteColour(colour)
  for _, t in ipairs(terms) do
    return t.getPaletteColour(colour)
  end
end

local function getPaletteColor(colour)
  for _, t in ipairs(terms) do
    return t.getPaletteColor(color)
  end
end

local function setPaletteColour(...)
  for _, t in ipairs(terms) do
    return t.setPaletteColour(unpack(arg))
  end
end
local function setPaletteColor(...)
  for _, t in ipairs(terms) do
    return t.setPaletteColour(unpack(arg))
  end
end

  

detect_terms()

return {
 get_terms=get_terms,
 detect_terms=detect_terms,
 write=write,
 scroll=scroll,
 getCursorPos=getCursorPos,
 setCursorPos=setCursorPos,
 getCursorBlink=getCursorBlink,
 setCursorBlink=setCursorBlink,
 getSize=getSize,
 clear=clear,
 clearLine=clearLine,
 getTextColour=getTextColour,
 getTextColor=getTextColor,
 setTextColour=setTextColour,
 setTextColor=setTextColor,
 getBackgroundColour=getBackgroundColour,
 getBackgroundColor=getBackgroundColor,
 setBackgroundColour=setBackgroundColour,
 setBackgroundColor=setBackgroundColor,
 isColour=isColour,
 isColor=isColor,
 blit=blit,
 getPaletteColour=getPaletteColour,
 getPaletteColor=getPaletteColor,
 setPaletteColour=setPaletteColour,
 setPaletteColor=setPaletteColor
}
