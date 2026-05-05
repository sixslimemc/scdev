# UTIL > scdev :_/util/ concat
# cycle_next
#--------------------
# ./do
#--------------------

execute unless data storage scdev:_ u.concat.buffer[0] run return 0

execute store result score *x _scdev run data modify storage scdev:_ v.concat.buffer[-1] set value ","
data remove storage scdev:_ v.concat.buffer[-1]
execute if score *x _scdev matches 1 run function scdev:_/util/concat/cycle_next