#> scdev :-/ info/pack

$data modify storage scdev:_ v.pack.args set value $(args)

execute store result score *x _scdev run function scdev:_/impl/-/info/pack/main

data remove storage scdev:_ v.pack

return run scoreboard players get *x _scdev