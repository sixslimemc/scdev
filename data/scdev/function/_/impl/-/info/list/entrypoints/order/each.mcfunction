# IMPL > scdev :-/ info/list/entrypoints
# order/each
#--------------------
# ../main
#--------------------
# forward order

data modify storage scdev:_ v.entrypoints.this_entrypoint set from storage scdev:_ v.entrypoints.order[0]

function scdev:_/impl/-/info/list/entrypoints/order/add with storage scdev:_ v.entrypoints.this_entrypoint

data remove storage scdev:_ v.entrypoints.order[0]
execute if data storage scdev:_ v.entrypoints.order[0] run function scdev:_/impl/-/info/list/entrypoints/order/each