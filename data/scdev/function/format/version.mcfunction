#> scdev : format/version

data remove storage scdev:out version

scoreboard players set *version.use_self _scdev 0
execute if data storage scdev:in version{use_this_entity:true} run scoreboard players set *version.use_self _scdev 1

execute if score *version.use_self _scdev matches 1 run function scdev:_/impl/format/version/main
execute if score *version.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/version/main

data remove storage scdev:_ v.version
data remove storage scdev:in version
scoreboard players reset *version.use_self _scdev

return 1