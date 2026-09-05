# IMPL > scdev:-/rebuild
# main

data modify storage scdev:_ v.rebuild.refs set value {disable:[], enable:[], uninstall:[]}

# validate that inputs are lists:
scoreboard players set *x _scdev 2
execute if data storage scdev:_ v.rebuild.args.enable store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.enable append value ""
execute if score *x _scdev matches 0 run return run function scdev:_/impl/-/rebuild/quick_error {line:{text:"", color:red, extra:[{text:"Argument "}, {text:"args.enable", color:yellow}, {text:" must be a list of pack IDs ("}, {text:"[a, b, ...]", color:yellow}, {text:")."}]}}
data remove storage scdev:_ v.rebuild.args.enable[-1]

scoreboard players set *x _scdev 2
execute if data storage scdev:_ v.rebuild.args.disable store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.disable append value ""
execute if score *x _scdev matches 0 run return run function scdev:_/impl/-/rebuild/quick_error {line:{text:"", color:red, extra:[{text:"Argument "}, {text:"args.disable", color:yellow}, {text:" must be a list of pack IDs ("}, {text:"[a, b, ...]", color:yellow}, {text:")."}]}}
data remove storage scdev:_ v.rebuild.args.disable[-1]

scoreboard players set *x _scdev 2
execute if data storage scdev:_ v.rebuild.args.uninstall store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.uninstall append value ""
execute if score *x _scdev matches 0 run return run function scdev:_/impl/-/rebuild/quick_error {line:{text:"", color:red, extra:[{text:"Argument "}, {text:"args.uninstall", color:yellow}, {text:" must be a list of pack IDs ("}, {text:"[a, b, ...]", color:yellow}, {text:")."}]}}
data remove storage scdev:_ v.rebuild.args.uninstall[-1]

# set {..refs.disable}:
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.disable
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.refs.disable set from storage scdev:out pack_refs.result

# set {..refs.enable}:
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.enable
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.refs.enable set from storage scdev:out pack_refs.result

# set {..refs.uninstall}:
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.uninstall
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.refs.uninstall set from storage scdev:out pack_refs.result

# doc {..warning} structure:
data modify storage scdev:_ v.rebuild.warning.not_installed set value []
data modify storage scdev:_ v.rebuild.warning.already_enabled set value []
data modify storage scdev:_ v.rebuild.warning.already_disabled set value []
data remove storage scdev:_ v.rebuild.warning

# init {..call}:
data modify storage scdev:_ v.rebuild.call set value {disable:[], uninstall:[], wipe_memory:false}
data modify storage scdev:_ v.rebuild.call.wipe_memory set from storage scdev:_ v.rebuild.args.wipe_memory

# each uninstall:
execute if data storage scdev:_ v.rebuild.refs.uninstall[0] run function scdev:_/impl/-/rebuild/uninstalls/each

# each enable:
execute if data storage scdev:_ v.rebuild.refs.enable[0] run function scdev:_/impl/-/rebuild/enables/each

# each disable:
execute if data storage scdev:_ v.rebuild.refs.disable[0] run function scdev:_/impl/-/rebuild/disables/each

# warning:
tag @s add _scdev.executor
execute if data storage scdev:_ v.rebuild.warning summon minecraft:text_display run function scdev:_/impl/-/rebuild/warning/do
execute if data storage scdev:_ v.rebuild.warning unless data storage scdev:_ v.rebuild.args{ignore_warnings:true} run return fail

# add already disabled packs to {..call.disable}:
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids append from storage slimecore:data world.installed[{disabled:true}].pack.pack_id
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.call.disable append from storage scdev:out pack_refs.result

# rebuild:
data modify storage slimecore:in rebuild set from storage scdev:_ v.rebuild.call
function slimecore:rebuild