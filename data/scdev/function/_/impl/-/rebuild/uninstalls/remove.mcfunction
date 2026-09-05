# IMPL > scdev:-/rebuild
# uninstalls/remove
#--------------------
# ./each
#--------------------

$data remove storage scdev:_ v.rebuild.refs.enable[{pack_ref:'$(pack_ref)'}]
$data remove storage scdev:_ v.rebuild.refs.disable[{pack_ref:'$(pack_ref)'}]
$data remove storage scdev:_ v.rebuild.refs.uninstall[{pack_ref:'$(pack_ref)'}]