#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:in abstract.reference set from storage scdev:_ t.error.entry.of
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract
data modify storage scdev:_ x.abstract_text set from storage scdev:out abstract.result

tellraw @a[tag=scdev.listener] [{text: " - Abstract interface ", color:red}, {interpret:true, storage:"scdev:_", nbt:"x.abstract_text"}, {text: " is implemented by multiple packs:", color:red}]

execute if data storage scdev:_ t.error.entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/packs/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/each