#> scdev :-/ info/list/packs

$data modify storage scdev:_ v.packs.args set value $(args)

execute store result score *x _scdev run function scdev:_/impl/-/info/list/packs/main

data remove storage scdev:_ v.packs

return run scoreboard players get *x _scdev