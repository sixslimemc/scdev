#> scdev:_/main/meta_info/load/start
#--------------------
# HOOK: slimecore::meta_info/load/start
#--------------------

tellraw @a[tag=scdev.watch] {text:"--[ Loading ]-------", bold:true, color:gray}

tellraw @a[tag=scdev.watch] {text:" Preload Entrypoints", color:white, bold:true}
data modify storage scdev:_ t.load.preloads set from storage slimecore:data build.order.preload_entrypoints
execute unless data storage scdev:_ t.load.preloads[0] run tellraw @a[tag=scdev.watch] {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each

tellraw @a[tag=scdev.watch] {text:" Packs", color:white, bold:true, bold:true}
data modify storage scdev:_ t.load.loads set from storage slimecore:data build.order.load
execute unless data storage scdev:_ t.load.loads[0] run tellraw @a[tag=scdev.watch] {text:"  (none)", italic:true, color:dark_gray}
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each

tellraw @a[tag=scdev.watch] {text:" Entrypoints", color:white, bold:true}
data modify storage scdev:_ t.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute unless data storage scdev:_ t.load.entrypoints[0] run tellraw @a[tag=scdev.watch] {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each

tellraw @a[tag=scdev.watch] {text:"--------------------", bold:true, color:gray}

data remove storage scdev:_ t.load