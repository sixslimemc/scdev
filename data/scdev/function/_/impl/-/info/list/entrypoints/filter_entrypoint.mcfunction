# IMPL > scdev :-/ info/list/entrypoints
# filter_entrypoint
#--------------------
# ./main
#--------------------
# forward iter

$execute if data storage scdev:_ v.entrypoints.pack_pool_map{'$(pack_ref)':true} run data modify storage scdev:_ v.entrypoints.entrypoints append from storage scdev:_ v.entrypoints.entrypoint_iter[0]

$execute store success score *x _scdev if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:false}
execute if score *x _scdev matches 1 run scoreboard players add *entrypoints.total_enabled _scdev 1
execute if score *x _scdev matches 0 run scoreboard players add *entrypoints.total_disabled _scdev 1


data remove storage scdev:_ v.entrypoints.entrypoint_iter[0]
execute if data storage scdev:_ v.entrypoints.entrypoint_iter[0] run function scdev:_/impl/-/info/list/entrypoints/filter_entrypoint with storage scdev:_ v.entrypoints.entrypoint_iter[0]