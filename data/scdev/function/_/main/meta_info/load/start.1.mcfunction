#> scdev:_/main/meta_info/load/start.1
kill @s

tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:":"}]
tellraw @a[tag=scdev.listener] {text:"--[ Loading ]-------", bold:true, color:blue}

tellraw @a[tag=scdev.listener] {text:" Preload Entrypoints:", color:white, bold:true}
data modify storage scdev:_ t.load.preloads set from storage slimecore:data build.order.preload_entrypoints
execute unless data storage scdev:_ t.load.preloads[0] run tellraw @a[tag=scdev.listener] {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each

tellraw @a[tag=scdev.listener] {text:" Packs:", color:white, bold:true, bold:true}
data modify storage scdev:_ t.load.loads set from storage slimecore:data build.order.load
execute unless data storage scdev:_ t.load.loads[0] run tellraw @a[tag=scdev.listener] {text:"  (none)", italic:true, color:dark_gray}
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each

tellraw @a[tag=scdev.listener] {text:" Entrypoints:", color:white, bold:true}
data modify storage scdev:_ t.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute unless data storage scdev:_ t.load.entrypoints[0] run tellraw @a[tag=scdev.listener] {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each

tellraw @a[tag=scdev.listener] {text:"--------------------", bold:true, color:blue}

tellraw @a[tag=scdev.listener] {text:"\"", color:blue, extra:[{text:"Loading finished.\" should be sent below.", color:blue}], hover_event:{action:"show_text", value:[{text:"If no message is sent:\n - 'max_command_sequence_length' gamerule may need to be increased.\n - One or more packs may have an infinite loop in their entrypoint/load function(s).", color:gray}]}}

data remove storage scdev:_ t.load