#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/packs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.entry.source set from storage scdev:_ t.error.entry.sources[-1]

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_/in pack.manifest set from storage slimecore:hook end.result.error.manifests[{pack_id:'", 2:true, 3:"'}]"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ t.error.entry.source.pack_ref
function scdev:_/util/mline/3 with storage scdev:_ x.mline
function scdev:_/util/format/pack/main
data modify storage scdev:_ x.pack_text set from storage scdev:_/out pack.result

tellraw @a[tag=scdev.listener] [{text:"   - ", color:red}, {interpret:true, storage:"scdev:_", nbt:"x.pack_text"}]

data remove storage scdev:_ t.error.entry.sources[-1]
execute if data storage scdev:_ t.error.entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/packs/each