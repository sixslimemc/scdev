#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack
#--------------------
# ./each_entry
#--------------------

# DEBUG:
tellraw @a ["PACK: ", {'storage':'slimecore:_', 'nbt':'t.error.this_entry.packs[-1]'}]
data modify storage slimecore:_/in pack.manifest set from storage slimecore:_ t.error.this_entry.packs[-1]
function scdev:_/util/format/pack/main
data modify storage slimecore:_ x.pack_text set from storage slimecore:_/out pack.result

tellraw @a[tag=scdev.listener] [{text:"   - ", color:red}, {interpret:true, storage:"slimecore:_", nbt:"x.pack_text"}]

data remove storage slimecore:_ t.error.this_entry.packs[-1]
execute if data storage slimecore:_ t.error.this_entry.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack