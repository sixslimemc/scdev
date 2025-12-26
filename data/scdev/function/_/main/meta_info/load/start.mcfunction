#> scdev:_/main/meta_info/load/start
#--------------------
# HOOK: slimecore::meta_info/load/start
#--------------------

tellraw @a[tag=scdev.watch] {text:"--[ Load Order ]--------", bold:true, color:gold}

tellraw @a[tag=scdev.watch] {text:" [Preload Entrypoints]", color:blue, bold:true}
data modify storage scdev:_ t.load.preloads set from storage slimecore:data build.order.preload_entrypoints
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each

tellraw @a[tag=scdev.watch] {text:" [Loads]", color:blue, bold:true, bold:true}
data modify storage scdev:_ t.load.loads set from storage slimecore:data build.order.load
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each

tellraw @a[tag=scdev.watch] {text:" [Entrypoints]", color:blue}
data modify storage scdev:_ t.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each

tellraw @a[tag=scdev.watch] {text:"\n------------------------", bold:true, color:gold}

data remove storage scdev:_ t.load