local mt = require("mterm")

term.redirect(mt)
term.clear()
term.setCursorPos(1, 1)

print("You can try any of this: 'time', 'worm', 'dj' or 'paint'!")
print("Type 'programs' to see the complete list")

while true do
  term.write("> ")
  term.setCursorBlink(true)
  cmd = read()
  term.setCursorBlink(false)
  if cmd == "exit" then
    break
  end
  shell.run(cmd)
end