#> scdev : util/pack_refs

data remove storage scdev:out pack_refs

execute store result score *x _scdev run function scdev:_/impl/util/pack_refs/main

data remove storage scdev:_ v.pack_refs
data remove storage scdev:in pack_refs

return 1