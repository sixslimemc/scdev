#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each_pack
#--------------------
# ./each
#--------------------

data modify storage scdev:_ t.error.dep set from storage scdev:_ t.error.entry.cycle[0]

tellraw @s [{text:"  - ", color:red}, {storage:"scdev:_", nbt:"t.error.dep.pack_ref", color:yellow}]

data remove storage scdev:_ t.error.entry.cycle[0]
execute if data storage scdev:_ t.error.entry.cycle[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each_pack