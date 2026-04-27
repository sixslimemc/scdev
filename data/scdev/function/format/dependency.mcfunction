#> scdev : format/dependency

data remove storage scdev:out dependency

scoreboard players set *dependency.use_self _scdev 0
execute if data storage scdev:in dependency{use_this_entity:true} if entity @s[type=text_display] run scoreboard players set *dependency.use_self _scdev 1

execute if score *dependency.use_self _scdev matches 1 run function scdev:_/impl/format/dependency/main
execute if score *dependency.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/dependency/main

data remove storage scdev:_ v.dependency
data remove storage scdev:in dependency
scoreboard players reset *dependency.use_self _scdev
scoreboard players reset *dependency.optional _scdev

return 1