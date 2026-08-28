#> scdev : format/contract

data remove storage scdev:out contract

scoreboard players set *contract.use_self _scdev 0
execute if data storage scdev:in contract{use_this_entity:true} run scoreboard players set *contract.use_self _scdev 1

execute if score *contract.use_self _scdev matches 1 run function scdev:_/impl/format/contract/main
execute if score *contract.use_self _scdev matches 0 summon text_display run function scdev:_/impl/format/contract/main

data remove storage scdev:_ v.contract
data remove storage scdev:in contract
scoreboard players reset *contract.use_self _scdev
scoreboard players reset *contract.asource _scdev

return 1