#> scdev : format/preload_entrypoint

data remove storage scdev:out preload_entrypoint

scoreboard players set *preload_entrypoint.use_self _scdev 0
execute if data storage scdev:in preload_entrypoint{use_this_entity:true} run scoreboard players set *preload_entrypoint.use_self _scdev 1

execute if score *preload_entrypoint.use_self _scdev matches 1 run function scdev:_/impl/format/preload_entrypoint/main
execute if score *preload_entrypoint.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/preload_entrypoint/main

data remove storage scdev:_ v.preload_entrypoint
data remove storage scdev:in preload_entrypoint
scoreboard players reset *preload_entrypoint.use_self _scdev

return 1