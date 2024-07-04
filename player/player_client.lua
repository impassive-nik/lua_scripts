peripheral.find("modem", rednet.open)

print("Example commands:")
print("play <number 1-13>")
print("stop")

while true do
  write("> ")
  song = read()
  rednet.broadcast(song, "music")
end