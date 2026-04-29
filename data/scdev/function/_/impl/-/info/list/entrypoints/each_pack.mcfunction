# IMPL > scdev :-/ info/list/entrypoints
# each_pack
#--------------------
# ./main
#--------------------

$data modify storage scdev:_ v.entrypoints.pack_pool_map.'$(pack_id)' set value true

data remove storage scdev:_ v.entrypoints.pack_pool[-1]
execute if data storage scdev:_ v.entrypoints.pack_pool[0] run function scdev:_/impl/-/info/list/entrypoints/each_pack with storage scdev:_ v.entrypoints.pack_pool[-1]