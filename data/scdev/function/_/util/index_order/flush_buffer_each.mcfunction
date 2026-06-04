# UTIL > scdev :_/util/ index_order
# fill_buffer_each
#--------------------
# ./main
#--------------------
# forward iter

execute if data storage scdev:_ u.index_order.buffer[0].index run data modify storage scdev:_/out index_order.result append from storage scdev:_ u.index_order.buffer[0]

data remove storage scdev:_ u.index_order.buffer[0]
execute if data storage scdev:_ u.index_order.buffer[0] run function scdev:_/util/index_order/flush_buffer_each