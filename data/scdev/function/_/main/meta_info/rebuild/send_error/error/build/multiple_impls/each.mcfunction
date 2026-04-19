#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_/in abstract.abstract set from storage scdev:_ t.error.entry.of
function scdev:_/util/format/abstract/main
data modify storage scdev:_ x.abstract_text set from storage scdev:_/out abstract.result

tellraw @a[tag=scdev.listener] [{text: " - Abstract interface ", color:red}, {interpret:true, storage:"scdev:_", nbt:"x.abstract_text"}, {text: " is implemented by multiple packs:", color:red}]

execute if data storage scdev:_ t.error.entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/packs/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/each