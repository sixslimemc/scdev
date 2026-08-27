#> scdev : format/entrypoint
#+ [reentrant]

data remove storage scdev:out entrypoint

data modify storage scdev:_ eval append value {in:{}, out:{}, v:{}}
data modify storage scdev:_ eval[-1].in set from storage scdev:in entrypoint
data remove storage scdev:in entrypoint

execute if data storage scdev:_ eval[-1].in{use_this_entity:true} run function scdev:_/impl/format/entrypoint/main
execute unless data storage scdev:_ eval[-1].in{use_this_entity:true} summon text_display run function scdev:_/impl/format/entrypoint/main

data modify storage scdev:out entrypoint set from storage scdev:_ eval[-1].out
data remove storage scdev:_ eval[-1]

return 1