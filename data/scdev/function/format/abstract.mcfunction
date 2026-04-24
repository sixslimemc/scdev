#> scdev : format/abstract

data remove storage scdev:out abstract

scoreboard players set *abstract.use_self _scdev 0
execute if data storage scdev:in abstract{use_this_entity:true} if entity @s[type=text_display] run scoreboard players set *abstract.use_self _scdev 1

execute if score *abstract.use_self _scdev matches 1 run function scdev:_/impl/format/abstract/main
execute if score *abstract.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/abstract/main

data remove storage scdev:_ v.abstract
data remove storage scdev:in abstract
scoreboard players reset *abstract.use_self _scdev

return 1