# IMPL > scdev:-/rebuild
# warning/do
#--------------------
# ../main
#--------------------

data modify storage scdev:_ v.rebuild.lines set value []

data modify storage scdev:_ v.rebuild.lines append value {text:"Warning(s):", color:gold, bold:true, hover_event:{action:'show_text', value:{text:"", color:gray, italic:false, extra:[{text:"Your input:\n"}, {}]}}}

# hover warning text:
data modify storage scdev:_ v.rebuild.input set value {}
data modify storage scdev:_ v.rebuild.input.args set from storage scdev:_ v.rebuild.args
data modify entity @s text set value {storage:'scdev:_', nbt:'v.rebuild.input', color:white}
data modify storage scdev:_ v.rebuild.lines[-1].hover_event.value.extra[1] set from entity @s text

# enabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.already_enabled
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:"> Would be enabling packs that are already enabled:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# disabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.already_disabled
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:"> Would be disabling packs that are already disabled:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# disabled:
data remove storage scdev:_ v.rebuild.list
data modify storage scdev:_ v.rebuild.list set from storage scdev:_ v.rebuild.warning.not_installed
execute if data storage scdev:_ v.rebuild.list[0] run data modify storage scdev:_ v.rebuild.lines append value {text:"> No installed packs have the following pack IDs:", color:gold}
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each

# ignore info line:
execute unless data storage scdev:_ v.rebuild.args{ignore_warnings:true} run data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, italic:true, extra:[{text:"Rebuild aborted due to warnings."}], hover_event:{action:'show_text', value:{text:"", color:gray, extra:[{text:"Set "}, {text:"{args:{ignore_warnings:true}}", color:dark_aqua}, {text:" to rebuild regardless of warnings--okay to do if your input is intentional."}]}}}
execute if data storage scdev:_ v.rebuild.args{ignore_warnings:true} run data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, italic:true, extra:[{text:"Rebuilding anyway."}], hover_event:{action:'show_text', value:{text:"", color:gray, extra:[{text:"{args:{ignore_warnings:true}}", color:dark_aqua}, {text:" was set."}]}}}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.rebuild.lines
data modify storage scdev:_/in send.source set value "scdev:-/rebuild"
execute as @p[tag=_scdev.executor] at @s run function scdev:_/util/text/send/main

tag @a remove _scdev.executor
kill @s