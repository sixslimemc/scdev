# IMPL > scdev:-/rebuild
# disables/each
#--------------------
# ../main
#--------------------

data modify storage scdev:_ v.rebuild.this_ref set from storage scdev:_ v.rebuild.refs.uninstall[-1]

# check installed:
function scdev:_/impl/-/rebuild/check_not_installed with storage scdev:_ v.rebuild.this_ref

# remove from refs:
function scdev:_/impl/-/rebuild/uninstalls/remove with storage scdev:_ v.rebuild.this_ref

# add to in:
data modify storage slimecore:in rebuild.uninstall append from storage scdev:_ v.rebuild.this_ref

execute if data storage scdev:_ v.rebuild.refs.uninstall[0] run function scdev:_/impl/-/rebuild/uninstalls/each