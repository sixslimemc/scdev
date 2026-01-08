# IMPL > scdev:-/rebuild
# main

# {..disables}:
data modify storage scdev:in pack_refs.pack_ids set value []
data modify storage scdev:in pack_refs.pack_ids append from storage slimecore:data world.disabled_packs[].pack_id
data modify storage scdev:in pack_refs.pack_ids append from storage scdev:_ v.rebuild.args.disable[]
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.disables set from storage scdev:out pack_refs.result

# remove {..args.enable} from {..disables}:
execute if data storage scdev:_ v.rebuild.args.enable[0] run function scdev:_/impl/-/rebuild/enables/each

# {..uninstalls}:
data modify storage scdev:in pack_refs.pack_ids set from storage scdev:_ v.rebuild.args.uninstall
function scdev:util/pack_refs
data modify storage scdev:_ v.rebuild.uninstalls set from storage scdev:out pack_refs.result

# rebuild:
data modify storage slimecore:in rebuild.force_clean set from storage scdev:_ v.rebuild.args.clean
data modify storage slimecore:in rebuild.disable set from storage scdev:_ v.rebuild.disables
data modify storage slimecore:in rebuild.uninstall set from storage scdev:_ v.rebuild.uninstalls
function slimecore:rebuild