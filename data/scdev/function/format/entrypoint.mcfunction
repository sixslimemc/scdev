#> scdev : format/entrypoint

data remove storage scdev:out entrypoint

scoreboard players set *entrypoint.use_self _scdev 0
execute if data storage scdev:in entrypoint{use_this_entity:true} if entity @s[type=text_display] run scoreboard players set *entrypoint.use_self _scdev 1

execute if score *entrypoint.use_self _scdev matches 1 run function scdev:_/impl/format/entrypoint/main
execute if score *entrypoint.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/entrypoint/main

data remove storage scdev:_ v.entrypoint
data remove storage scdev:in entrypoint
scoreboard players reset *entrypoint.use_self _scdev

return 1