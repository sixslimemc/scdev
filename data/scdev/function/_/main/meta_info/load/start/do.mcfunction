#> scdev:_/main/meta_info/load/start/do
#--------------------
# ../start
#--------------------
kill @s

data modify storage scdev:_ t.load.lines set value []
data modify storage scdev:_ t.load.lines append value {text:"--[ Loading ]-------", bold:true, color:blue}

# preload entrypoints:
data modify storage scdev:_ t.load.lines append value {text:" Preload Entrypoints:", color:white, bold:true}
data modify storage scdev:_ t.load.preloads set from storage slimecore:data build.order.preload_entrypoints
execute unless data storage scdev:_ t.load.preloads[0] run data modify storage scdev:_ t.load.lines append value {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each

# packs:
data modify storage scdev:_ t.load.lines append value {text:" Packs:", color:white, bold:true, bold:true}
data modify storage scdev:_ t.load.loads set from storage slimecore:data build.order.load
execute unless data storage scdev:_ t.load.loads[0] run data modify storage scdev:_ t.load.lines append value {text:"  (none)", italic:true, color:dark_gray}
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each

# entrypoints:
data modify storage scdev:_ t.load.lines append value {text:" Entrypoints:", color:white, bold:true}
data modify storage scdev:_ t.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute unless data storage scdev:_ t.load.entrypoints[0] run data modify storage scdev:_ t.load.lines append value {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each

data modify storage scdev:_ t.load.lines append value {text:"--------------------", bold:true, color:blue}

data modify storage scdev:_ t.load.lines append value {text:"\"", color:white, extra:[{text:"Loading finished.\" should be sent below."}], hover_event:{action:"show_text", value:[{text:"If no message is sent:\n - 'max_command_sequence_length' gamerule may need to be increased.\n - One or more packs may have an infinite loop in their entrypoint/load function(s).", color:gray}]}}

data modify storage scdev:_/in send.lines set from storage scdev:_ t.load.lines
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen]'
function scdev:_/util/text/send/main

data remove storage scdev:_ t.load