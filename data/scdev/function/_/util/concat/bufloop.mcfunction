# UTIL > scdev :_/util/ concat
# do
#--------------------
# ./main
#--------------------
# should always start on a quote character

# get {..quote}:
data modify storage scdev:_ u.concat.quote set from storage scdev:_ u.concat.buffer[-1]
data remove storage scdev:_ u.concat.buffer[-1]

# get {..string}:
data modify storage scdev:_ u.concat.string set from storage scdev:_ u.concat.buffer[-1]
data remove storage scdev:_ u.concat.buffer[-1]

# fix {..string} if wrong quote type:
data modify storage scdev:_ x.quote set from storage scdev:_ u.concat.quote
execute store result score *concat.fix_quote _scdev run data modify storage scdev:_ x.quote set from storage scdev:_ u.concat.acc_quote
execute if score *concat.fix_quote _scdev matches 1 run function scdev:_/util/concat/fix_string with storage scdev:_ u.concat

# DEBUG:
tellraw @a ["ACC: ", {'storage':'scdev:_', 'nbt':'u.concat.acc'}]
tellraw @a ["STRING: ", {'storage':'scdev:_', 'nbt':'u.concat.string'}]

# concat to {..acc}:
function scdev:_/util/concat/concat with storage scdev:_ u.concat

# update {..acc_quote}:
execute if score *concat.fix_quote _scdev matches 1 run data modify entity @s text set value {plain:true, storage:"scdev:_", nbt:"u.concat.acc"}
execute if score *concat.fix_quote _scdev matches 1 run data modify storage scdev:_ u.concat.acc_quote set from entity @s text.extra[0]

# remove quote, "", " ", and ",":
data remove storage scdev:_ u.concat.buffer[-1]
data remove storage scdev:_ u.concat.buffer[-1]
data remove storage scdev:_ u.concat.buffer[-1]
data remove storage scdev:_ u.concat.buffer[-1]

execute if data storage scdev:_ u.concat.buffer[0] run function scdev:_/util/concat/bufloop