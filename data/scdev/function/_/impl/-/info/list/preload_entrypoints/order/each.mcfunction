# IMPL > scdev :-/ info/list/preload_entrypoints
# order/each
#--------------------
# ../main
#--------------------
# forward order

data modify storage scdev:_ v.preload_entrypoints.this_entrypoint set from storage scdev:_ v.preload_entrypoints.order[0]

function scdev:_/impl/-/info/list/preload_entrypoints/order/add with storage scdev:_ v.preload_entrypoints.this_entrypoint

data remove storage scdev:_ v.preload_entrypoints.order[0]
execute if data storage scdev:_ v.preload_entrypoints.order[0] run function scdev:_/impl/-/info/list/preload_entrypoints/order/each