#> scdev:_/main/meta_info/rebuild/send_success/send_message/do
#--------------------
# ../do
#--------------------

data modify storage scdev:_ t.success.lines set value []

scoreboard players set *success.any_changes _scdev 0

# header:
data modify storage scdev:_ t.success.lines append value {text:"--[ Rebuilt ]-------", bold:true, color:green}

# build header:
scoreboard players set *x _scdev 0
execute if data storage scdev:_ t.success.enables[0] run scoreboard players set *x _scdev 1
execute if data storage scdev:_ t.success.disables[0] run scoreboard players set *x _scdev 1
execute if score *x _scdev matches 1 run data modify storage scdev:_ t.success.lines append value {text:"Build:", color:white, bold:true}

# enables:
data modify storage scdev:_ t.success.packs set from storage scdev:_ t.success.enables
data modify storage scdev:_ t.success.list_symbol set value {text:"+", color:green, hover_event:{action:'show_text', value:{text:"Enabled", color:green}}}
execute if data storage scdev:_ t.success.packs[0] run scoreboard players set *success.any_changes _scdev 1
execute if data storage scdev:_ t.success.packs[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_packs/each

# disables:
data modify storage scdev:_ t.success.packs set from storage scdev:_ t.success.disables
data modify storage scdev:_ t.success.list_symbol set value {text:"-", color:red, hover_event:{action:'show_text', value:{text:"Disabled", color:red}}}
execute if data storage scdev:_ t.success.packs[0] run scoreboard players set *success.any_changes _scdev 1
execute if data storage scdev:_ t.success.packs[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_packs/each

# world header:
scoreboard players set *x _scdev 0
execute if data storage scdev:_ t.success.installs[0] run scoreboard players set *x _scdev 1
execute if data storage scdev:_ t.success.uninstalls[0] run scoreboard players set *x _scdev 1
execute if score *x _scdev matches 1 run data modify storage scdev:_ t.success.lines append value {text:"World:", color:white, bold:true}

# installs:
data modify storage scdev:_ t.success.entries set from storage scdev:_ t.success.installs
data modify storage scdev:_ t.success.list_symbol set value {text:"*", color:dark_green, hover_event:{action:'show_text', value:{text:"Installed", color:dark_green}}}
execute if data storage scdev:_ t.success.entries[0] run scoreboard players set *success.any_changes _scdev 1
execute if data storage scdev:_ t.success.entries[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_entries/each

# uninstalls:
data modify storage scdev:_ t.success.entries set from storage scdev:_ t.success.uninstalls
data modify storage scdev:_ t.success.list_symbol set value {text:"~", color:dark_red, hover_event:{action:'show_text', value:{text:"Uninstalled", color:dark_red}}}
execute if data storage scdev:_ t.success.entries[0] run scoreboard players set *success.any_changes _scdev 1
execute if data storage scdev:_ t.success.entries[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_entries/each

# manifest changes:
data modify storage scdev:_ t.success.packs set from storage scdev:_ t.success.manifest_changes
data modify storage scdev:_ t.success.list_symbol set value {text:"&", color:light_purple, hover_event:{action:'show_text', value:{text:"Manifest changed", color:light_purple}}}
execute if data storage scdev:_ t.success.packs[0] run data modify storage scdev:_ t.success.lines append value {text:"Manifest Changes:", color:white, bold:true}
execute if data storage scdev:_ t.success.packs[0] run scoreboard players set *success.any_changes _scdev 1
execute if data storage scdev:_ t.success.packs[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_packs/each

# if no changes:
execute if score *success.any_changes _scdev matches 0 run data modify storage scdev:_ t.success.lines append value {text:"(no changes)", color:dark_gray}

data modify storage scdev:_ t.success.lines append value {text:"--------------------", bold:true, color:green}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ t.success.lines
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main

kill @s
