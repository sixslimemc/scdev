# IMPL > scdev:-/rebuild
# enables/each
#--------------------
# ../main
#--------------------

data modify storage scdev:_ v.rebuild.this_ref set from storage scdev:_ v.rebuild.refs.enable[-1]

# check installed:
function scdev:_/impl/-/rebuild/check_not_installed with storage scdev:_ v.rebuild.this_ref

# check enabled:
function scdev:_/impl/-/rebuild/check_enabled with storage scdev:_ v.rebuild.this_ref

# remove from refs:
function scdev:_/impl/-/rebuild/enables/remove with storage scdev:_ v.rebuild.this_ref

execute if data storage scdev:_ v.rebuild.refs.enable[0] run function scdev:_/impl/-/rebuild/enables/each