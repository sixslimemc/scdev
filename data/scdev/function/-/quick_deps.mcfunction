#> scdev : quick_deps

$data modify storage scdev:_ v.quick_deps.packs set value $(packs)

execute store result score *x _scdev run function scdev:_/impl/-/quick_deps/main

data remove storage scdev:_ v.quick_deps

return run scoreboard players get *x _scdev