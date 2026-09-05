# IMPL > scdev:-/rebuild
# main

data modify storage scdev:_ v.rebuild.refs set value {disable:[], enable:[], uninstall:[]}

# validate that inputs are lists:
scoreboard players set *x _scdev 0
execute if data storage scdev:_ v.rebuild.args.enable store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.enable append value ""
execute if score *x _scdev matches 1 run return run function scdev:_/impl/-/rebuild/quick_error {text:"Argument 'args.enable' must be a list ([a, b, ...]) of pack IDs ."}
data remove storage scdev:_ v.rebuild.args.enable[-1]
scoreboard players set *x _scdev 0
execute if data storage scdev:_ v.rebuild.args.disable store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.disable append value ""
execute if score *x _scdev matches 1 run return run function scdev:_/impl/-/rebuild/quick_error {text:"Argument 'args.disable' must be a list ([a, b, ...]) of pack IDs."}
data remove storage scdev:_ v.rebuild.args.disable[-1]
scoreboard players set *x _scdev 0
execute if data storage scdev:_ v.rebuild.args.uninstall store success score *x _scdev run data modify storage scdev:_ v.rebuild.args.uninstall append value ""
execute if score *x _scdev matches 1 run return run function scdev:_/impl/-/rebuild/quick_error {text:"Argument 'args.uninstall' must be a list ([a, b, ...]) of pack IDs."}
data remove storage scdev:_ v.rebuild.args.uninstall[-1]

# set {..refs.disable}
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.disable
function scdev:util/pack_refs
data modify storage scdev:in pack_refs.pack_ids append from storage slimecore:data world.installed[{disabled:true}].pack.pack_id
data modify storage scdev:_ v.rebuild.refs.disable set from storage scdev:out pack_refs.result

# set {..refs.enable}
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.enable
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.refs.enable set from storage scdev:out pack_refs.result

# set {..refs.uninstall}
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.uninstall
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.refs.uninstall set from storage scdev:out pack_refs.result

# declare warnings:
data modify storage scdev:_ v.rebuild.warning.not_installed set value []
data modify storage scdev:_ v.rebuild.warning.already_enabled set value []
data modify storage scdev:_ v.rebuild.warning.already_disabled set value []
data remove storage scdev:_ v.rebuild.warning

# init in:
data modify storage slimecore:in rebuild set value {disable:[], uninstall:[], wipe_memory:false}
data modify storage slimecore:in rebuild.wipe_memory set from storage scdev:_ v.rebuild.args.wipe_memory

# each uninstall:
execute if data storage scdev:_ v.rebuild.refs.uninstall[0] run function scdev:_/impl/-/rebuild/uninstalls/each

# 

# rebuild:
function slimecore:rebuild