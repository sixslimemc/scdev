# UTIL > scdev :_/util/ index_order
# fill_buffer_each
#--------------------
# ./main
#--------------------

$data modify storage scdev:_ u.index_order.buffer[$(index)] set from storage scdev:_ u.index_order.list[-1]

data remove storage scdev:_ u.index_order.list[-1]
execute if data storage scdev:_ u.index_order.list[0] run function scdev:_/util/index_order/fill_buffer_each with storage scdev:_ u.index_order.list[-1]