#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/each_pack
#--------------------
# ./each_set
#--------------------

data modify storage scdev:_ t.error.this_pack set from storage scdev:_ t.error.this_set.packs[-1]

# get pack text:
data modify storage scdev:in pack.pack set from storage scdev:_ t.error.this_pack
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.pack_text set from storage scdev:out pack.result

tellraw @a[tag=scdev.listener] [{text:"   - ", color:red}, {interpret:true, storage:"scdev:_", nbt:"t.error.pack_text"}]

data remove storage scdev:_ t.error.this_set.packs[-1]
execute if data storage scdev:_ t.error.this_set.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_pack