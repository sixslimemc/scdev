# IMPL > scdev:-/quick_deps
# each
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.quick_deps.pack_id set from storage scdev:_ v.quick_deps.packs[0]

function scdev:_/impl/-/quick_deps/each.1 with storage scdev:_ v.quick_deps

data remove storage scdev:_ v.quick_deps.packs[0]
execute if data storage scdev:_ v.quick_deps.packs[0] run function scdev:_/impl/-/quick_deps/each