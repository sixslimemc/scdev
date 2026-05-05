# UTIL > scdev :_/util/ concat
# do
#--------------------
# ./main
#--------------------
# should always start on a quote character

# get {..quote}:
data modify storage scdev:_ v.concat.quote set from storage scdev:_ v.concat.buffer[-1]
data remove storage scdev:_ v.concat.buffer[-1]

# get {..string}:
data modify storage scdev:_ v.concat.string set from storage scdev:_ v.concat.buffer[-1]
data remove storage scdev:_ v.concat.buffer[-1]

# fix {..string} if wrong quote type:
data modify storage scdev:_ x.quote set from storage scdev:_ v.concat.quote
execute store result score *x _scdev run data modify storage scdev:_ x.quote set from storage scdev:_ v.concat.acc_quote
execute if score *x _scdev matches 1 run function scdev:_/util/concat/fix_string with storage scdev:_ v.concat

# concat to {..acc}:
function scdev:_/util/concat/concat with storage scdev:_ v.concat

# update {..acc_quote}:
data modify entity @s text set value {plain:true, storage:"scdev:_", nbt:"v.concat.acc"}
data modify storage scdev:_ v.concat.acc_quote set from entity @s text.extra[0]

# remove quote, "", " ", and ",":
data remove storage scdev:_ v.concat.buffer[-1]
data remove storage scdev:_ v.concat.buffer[-1]
data remove storage scdev:_ v.concat.buffer[-1]
data remove storage scdev:_ v.concat.buffer[-1]

execute if data storage scdev:_ v.concat.buffer[0] run function scdev:_/util/concat/bufloop