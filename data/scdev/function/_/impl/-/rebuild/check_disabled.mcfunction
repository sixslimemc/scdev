# IMPL > scdev:-/rebuild
# check_disabled
#--------------------
# ./disables/each
#--------------------

$execute if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:false} run return 0
$execute if data storage scdev:_ v.rebuild.warning.already_disabled[{pack_ref:'$(pack_ref)'}] run return 1

$data modify storage scdev:_ v.rebuild.warning.already_disabled append value {pack_ref:'$(pack_ref)'}

return 1