#> scdev : format/version_req

data remove storage scdev:out version_req

scoreboard players set *version_req.use_self _scdev 0
execute if data storage scdev:in version_req{use_this_entity:true} run scoreboard players set *version_req.use_self _scdev 1

execute if score *version_req.use_self _scdev matches 1 run function scdev:_/impl/format/version_req/main
execute if score *version_req.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/version_req/main

data remove storage scdev:_ v.version_req
data remove storage scdev:in version_req
scoreboard players reset *version_req.use_self _scdev

return 1