#> scdev :-/ info/pack

$data modify storage scdev:_ v.packinfo.args set value $(args)

execute store result score *x _scdev summon text_display run function scdev:_/impl/-/info/pack/main

data remove storage scdev:_ v.packinfo
scoreboard players reset *packinfo.disabled _scdev
scoreboard players reset *packinfo.library _scdev

return run scoreboard players get *x _scdev