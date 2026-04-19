#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_/in abstract.abstract set from storage scdev:_ t.error.entry
function scdev:_/util/format/abstract/main
data modify storage scdev:_ x.abstract_text set from storage scdev:_/out abstract.result

tellraw @a[tag=scdev.listener] [{text:" - ", color:red}, {interpret:true, storage:"scdev:_", nbt:"x.abstract_text"}]

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each