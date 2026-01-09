#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each_pack
#--------------------
# ./each
#--------------------

data modify storage scdev:_ t.error.entrypoint set from storage scdev:_ t.error.entry.conflicting_group[0]

tellraw @s [{text:"  - ", color:red}, {storage:"scdev:_", nbt:"t.error.entrypoint.pack_ref", color:yellow}, {text:":", color:"gray"}, {storage:"scdev:_", nbt:"t.error.entrypoint.id", color:dark_green}]

data remove storage scdev:_ t.error.entry.conflicting_group[0]
execute if data storage scdev:_ t.error.entry.conflicting_group[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each_pack