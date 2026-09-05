#> scdev :_/util/ text/send
# % AS self
#--------------------
# -> lines: [Text]
# => to: $selector = "@s"
# => source: string = "scdev"
#--------------------
# .
#--------------------
# - Sends <lines> as a message from <source> to [self], or listeners if <to_listeners>.
#--------------------
# 1.
#--------------------

execute unless data storage scdev:_/in send.to run data modify storage scdev:_/in send.to set value '@s'

execute unless data storage scdev:_/in send.source run data modify storage scdev:_/in send.source set value "scdev"
execute store result score *send.count _scdev if data storage scdev:_/in send.lines[]

data modify storage scdev:_ u.send.sends set value [{text:"", color:gray, extra:[{text:"["}, {text:"SOURCE"}, {text:"]"}]}]
data modify storage scdev:_ u.send.sends[0].extra[1].text set from storage scdev:_/in send.source

execute if score *send.count _scdev matches ..1 run data modify storage scdev:_ u.send.sends[0].extra append value {text:" "}
execute if score *send.count _scdev matches 2.. run data modify storage scdev:_ u.send.sends[0].extra append value {text:":"}

execute if score *send.count _scdev matches ..1 run data modify storage scdev:_ u.send.sends append from storage scdev:_/in send.lines[0]
execute if score *send.count _scdev matches 2.. run function scdev:_/util/text/send/each

function scdev:_/util/text/send/tell with storage scdev:_/in send

data remove storage scdev:_ u.send
data remove storage scdev:_/in send

return 1