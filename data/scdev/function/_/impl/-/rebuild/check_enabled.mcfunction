# IMPL > scdev:-/rebuild
# check_enabled
#--------------------
# ./enables/each
#--------------------

$execute unless data storage slimecore:data world.aux.installed_map.'$(pack_ref)' run return 0
$execute if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:true} run return 0
$execute if data storage scdev:_ v.rebuild.warning.already_enabled[{pack_ref:'$(pack_ref)'}] run return 1

$data modify storage scdev:_ v.rebuild.warning.already_enabled append value {pack_ref:'$(pack_ref)'}

return 1