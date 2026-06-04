# UTIL > scdev :_/util/ index_order
# initialize_buffer
#--------------------
# ./main
#--------------------

data modify storage scdev:_ u.index_order.buffer append value false
scoreboard players remove *max_index _scdev 1

execute if score *max_index _scdev matches 0.. run function scdev:_/util/index_order/initialize_buffer
