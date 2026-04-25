#> scdev :-/ info/pack

$data modify storage scdev:_ v.pack.args set value $(args)

execute store result score *x _scdev summon text_display run function scdev:_/impl/-/info/pack/main

data remove storage scdev:_ v.pack
scoreboard players reset *pack.disabled _scdev
scoreboard players reset *pack.library _scdev

return run scoreboard players get *x _scdev