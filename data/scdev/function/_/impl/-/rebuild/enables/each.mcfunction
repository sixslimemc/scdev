# IMPL > scdev:-/rebuild
# enables/each
#--------------------
# ../main
#--------------------

data modify storage scdev:_ x.mline set value {1:"data remove storage scdev:_ v.rebuild.disables[{pack_ref:'", 2:true, 3:"']"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.rebuild.args.enable[-1]
function scdev:_/util/mline/3 with storage scdev:_ x.mline

data remove storage scdev:_ v.rebuild.args.enable[-1]
execute if data storage scdev:_ v.rebuild.args.enable[0] run function scdev:_/impl/-/rebuild/enables/each