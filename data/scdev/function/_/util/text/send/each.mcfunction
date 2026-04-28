# UTIL > scdev :_/util/ text/send
# each
#--------------------
# ./main
#--------------------

data modify storage scdev:_ u.send.sends append value {text:"\n ", extra:[{}]}
data modify storage scdev:_ u.send.sends[-1].extra[0] set from storage scdev:_/in send.lines[0]

data remove storage scdev:_/in send.lines[0]
execute if data storage scdev:_/in send.lines[0] run function scdev:_/util/text/send/each