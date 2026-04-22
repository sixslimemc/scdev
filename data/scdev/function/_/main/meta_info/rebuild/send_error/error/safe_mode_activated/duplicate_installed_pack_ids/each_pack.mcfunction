#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack
#--------------------
# ./each_entry
#--------------------

data modify storage scdev:_/in pack.manifest set from storage scdev:_ t.error.this_entry.packs[-1]
function scdev:_/util/format/pack/main
data modify storage scdev:_ x.pack_text set from storage scdev:_/out pack.result

tellraw @a[tag=scdev.listener] [{text:"   - ", color:red}, {interpret:true, storage:"scdev:_", nbt:"x.pack_text"}]

data remove storage scdev:_ t.error.this_entry.packs[-1]
execute if data storage scdev:_ t.error.this_entry.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack