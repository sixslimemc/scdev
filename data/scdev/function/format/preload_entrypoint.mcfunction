#> scdev : format/preload_entrypoint
#+ [reentrant]

data remove storage scdev:out preload_entrypoint

data modify storage scdev:_ eval append value {in:{}, out:{}, v:{}}
data modify storage scdev:_ eval[-1].in set from storage scdev:in preload_entrypoint
data remove storage scdev:in preload_entrypoint

execute if data storage scdev:_ eval[-1].in{use_this_entity:true} run function scdev:_/impl/format/preload_entrypoint/main
execute unless data storage scdev:_ eval[-1].in{use_this_entity:true} summon text_display run function scdev:_/impl/format/preload_entrypoint/main

data modify storage scdev:out preload_entrypoint set from storage scdev:_ eval[-1].out
data remove storage scdev:_ eval[-1]

return 1