# UTIL > scdev :_/util/ index_order
# max_index_each
#--------------------
# ./main
#--------------------

execute store result score *x _scdev run data get storage scdev:_ u.index_order.list[-1].index
execute if score *x _scdev > *max_index _scdev run scoreboard players operation *max_index _scdev = *x _scdev

data remove storage scdev:_ u.index_order.list[-1]
execute if data storage scdev:_ u.index_order.list[0] run function scdev:_/util/index_order/max_index_each