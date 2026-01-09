#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/packs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.entry.source set from storage scdev:_ t.error.entry.sources[-1]

tellraw @s [{text:"  ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.source.pack_ref", color:yellow}]

data remove storage scdev:_ t.error.entry.sources[-1]
execute if data storage scdev:_ t.error.entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/packs/each