# IMPL > scdev:-/rebuild
# enables/remove
#--------------------
# ./each
#--------------------

$data remove storage scdev:_ v.rebuild.refs.enable[{pack_ref:'$(pack_ref)'}]
$data remove storage scdev:_ v.rebuild.refs.disable[{pack_ref:'$(pack_ref)'}]