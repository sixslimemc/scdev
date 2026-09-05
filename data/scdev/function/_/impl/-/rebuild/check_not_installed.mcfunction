# IMPL > scdev:-/rebuild
# check_not_installed
#--------------------
# ./uninstalls/each
# ./disables/each
# ./enables/each
#--------------------

$execute if data storage slimecore:data world.aux.installed_map.'$(pack_ref)' run return 0
$execute if data storage scdev:_ v.rebuild.warning.not_installed[{pack_ref:'$(pack_ref)'}] run return 1

$data modify storage scdev:_ v.rebuild.warning.not_installed append value {pack_ref:'$(pack_ref)'}

return 1