# IMPL > scdev:-/rebuild
# warning/do
#--------------------
# ../main
#--------------------

data modify storage scdev:_ v.rebuild.lines set value []

data modify storage scdev:_ v.rebuild.lines append value {text:"Warnings:", color:gold, bold:true}

# enabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.already_enabled
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:"> Trying to enable packs that are already enabled:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# disabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.already_disabled
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:" > Trying to disable packs that are already disabled:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# disabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.not_installed
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:" > No packs with the following pack IDs are installed:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# ignore info line:
execute unless data storage scdev:_ v.rebuild.args{ignore_warnings:true} run data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, italic:false, extra:[{text:"Rebuild aborted due to warnings. (Set "}, {text:"{args:{ignore_warnings:true}}", color:white}, {text:" to rebuild anyway.)"}]}
execute if data storage scdev:_ v.rebuild.args{ignore_warnings:true} run data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, italic:false, extra:[{text:"Rebuilding anyway. ("}, {text:"{args:{ignore_warnings:true}}", color:yellow}, {text:" is set.)"}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.rebuild.lines
data modify storage scdev:_/in send.source set value "scdev:-/rebuild"
execute as @p[tag=_scdev.executor] at @s run function scdev:_/util/text/send/main

tag @a remove _scdev.executor
kill @s