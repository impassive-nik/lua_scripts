function play(sound)
  if sound == nil then
    print("The sound is not found")
    return
  end
  local speaker = peripheral.find("speaker")
  if speaker == nil then
    print("The speaker is not found")
    return
  end
  speaker.playSound(sound, 2.0)
end

function stop()
  local speaker = peripheral.find("speaker")
  if speaker == nil then
    print("The speaker is not found")
    return
  end
  speaker.stop()
end

local music_table = {
  "music_disc.13",
  "music_disc.blocks",
  "music_disc.cat",
  "music_disc.chirp",
  "music_disc.far",
  "music_disc.mall",
  "music_disc.mellohi",
  "music_disc.pigstep",
  "music_disc.stal",
  "music_disc.strad",
  "music_disc.wait",
  "music_disc.ward",
  "music_disc.11"
}

peripheral.find("modem", rednet.open)

while true do
  local event, sender, message, protocol = os.pullEvent("rednet_message")
  if protocol == "music" then
    cmd, arg = message:match("%s*(%S*)%s*(%d*)")
    if cmd == "play" then
      print("Now playing", arg)
      song = tonumber(arg)
      play(music_table[song])
    elseif cmd == "stop" then
      stop()
    else
      print("Unrecognized command", cmd)
    end
  end
end

