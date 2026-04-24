#> scdev :_/util/ text/send_lines
#--------------------
# -> lines: [Text]
#--------------------
# .
#--------------------
# - Sends <lines> as a multiline scdev message.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/in send_lines.lines prepend value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:":", color:gray}]

data modify storage scdev:_ u.send_lines.sends set value [{text:"", extra:[{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:":", color:gray}]}]
execute if data storage scdev:_/in send_lines.lines[0] run function scdev:_/util/text/send_lines/each

tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"u.send_lines.sends"}

data remove storage scdev:_ u.send_lines
data remove storage scdev:_/in send_lines

return 1