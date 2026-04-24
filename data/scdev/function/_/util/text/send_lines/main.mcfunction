#> scdev :_/util/ text/send_lines
# % AS self
#--------------------
# -> lines: [Text]
# => to_listeners: boolean = false
#--------------------
# .
#--------------------
# - Sends <lines> as a multiline scdev message to [self], or listeners if <to_listeners>.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/in send_lines.lines prepend value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:":", color:gray}]

data modify storage scdev:_ u.send_lines.sends set value [{text:"", extra:[{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:":", color:gray}]}]
execute if data storage scdev:_/in send_lines.lines[0] run function scdev:_/util/text/send_lines/each

execute if data storage scdev:_/in send_lines{to_listeners:true} run tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"u.send_lines.sends"}
execute unless data storage scdev:_/in send_lines{to_listeners:true} run tellraw @s {interpret:true, storage:"scdev:_", nbt:"u.send_lines.sends"}

data remove storage scdev:_ u.send_lines
data remove storage scdev:_/in send_lines

return 1