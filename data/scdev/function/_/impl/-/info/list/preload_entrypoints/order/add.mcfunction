# IMPL > scdev :-/ info/list/preload_entrypoints
# order/add
#--------------------
# ./each
#--------------------

$execute if data storage scdev:_ v.preload_entrypoints.entrypoints[{pack_ref:"$(pack_ref)", id:"$(id)"}] run data modify storage scdev:_ v.preload_entrypoints.ordered append from storage scdev:_ v.preload_entrypoints.this_entrypoint