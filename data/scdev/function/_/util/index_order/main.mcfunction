#> scdev :_/util/ index_order
# ^T : {index: int, ...}
#--------------------
# -> list: [T]
#--------------------
# <- result: [T]
#--------------------
# orders <list> by the 'index' key.
# absolutely atrocious.
#--------------------
# 1: 
#--------------------

# DEBUG:
tellraw @a ["IN: ", {'storage':'scdev:_/in', 'nbt':'index_order.list'}]
data modify storage scdev:_/out index_order set value {result:[]}

# get max index:
scoreboard players set *max_index _scdev -1
data modify storage scdev:_ u.index_order.list set from storage scdev:_/in index_order.list
execute if data storage scdev:_ u.index_order.list[0] run function scdev:_/util/index_order/max_index_each

# initialize buffer:
data modify storage scdev:_ u.index_order.buffer set value []
execute if score *max_index _scdev matches 0.. run function scdev:_/util/index_order/initialize_buffer

# DEBUG:
tellraw @a ["PRE: ", {'storage':'scdev:_', 'nbt':'u.index_order.buffer'}]
# fill buffer:
data modify storage scdev:_ u.index_order.list set from storage scdev:_/in index_order.list
execute if data storage scdev:_ u.index_order.list[0] run function scdev:_/util/index_order/fill_buffer_each with storage scdev:_ u.index_order.list[-1]

# DEBUG:
tellraw @a ["POST: ", {'storage':'scdev:_', 'nbt':'u.index_order.buffer'}]
# flush buffer (set out):
execute if data storage scdev:_ u.index_order.buffer[0] run function scdev:_/util/index_order/flush_buffer_each

data remove storage scdev:_ u.index_order
data remove storage scdev:_/in index_order
scoreboard players reset *max_index _scdev

return 1