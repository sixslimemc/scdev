#> scdev : format/pack

data remove storage scdev:out pack

scoreboard players set *pack.use_self _scdev 0
execute if data storage scdev:in pack{use_this_entity:true} run scoreboard players set *pack.use_self _scdev 1

execute if score *pack.use_self _scdev matches 1 run function scdev:_/impl/format/pack/main
execute if score *pack.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/pack/main

data remove storage scdev:_ v.pack
data remove storage scdev:in pack
scoreboard players reset *pack.use_self _scdev
scoreboard players reset *pack.is_direct _scdev
scoreboard players reset *pack.disabled _scdev
scoreboard players reset *pack.library _scdev

return 1