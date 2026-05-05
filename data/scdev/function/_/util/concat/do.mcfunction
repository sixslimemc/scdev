# UTIL > scdev :_/util/ concat
# do
#--------------------
# ./main
#--------------------
kill @s

# get {..buffer}:
data modify entity @s text set value {plain:true, storage:"scdev:_/in", nbt:"concat.strings"}
data modify storage scdev:_ v.concat.buffer set from entity @s text.extra

# remove "]":
data remove storage scdev:_ v.concat.buffer[-1]

data modify storage scdev:_ v.concat.acc set value ""
data modify storage scdev:_ v.concat.acc_quote set value '"'

# accumulate string into {..acc}:
execute if data storage scdev:_ v.concat.buffer[0] run function scdev:_/util/concat/bufloop

# set out:
data modify storage scdev:_/out concat.result set from storage scdev:_ v.concat.acc