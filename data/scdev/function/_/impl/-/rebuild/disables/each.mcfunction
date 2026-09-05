# IMPL > scdev:-/rebuild
# disables/each
#--------------------
# ../main
#--------------------

data modify storage scdev:_ v.rebuild.this_ref set from storage scdev:_ v.rebuild.refs.disable[-1]

# check installed:
function scdev:_/impl/-/rebuild/check_not_installed with storage scdev:_ v.rebuild.this_ref

# check disabled:
function scdev:_/impl/-/rebuild/check_disabled with storage scdev:_ v.rebuild.this_ref

# remove from refs:
function scdev:_/impl/-/rebuild/disables/remove with storage scdev:_ v.rebuild.this_ref

# add to in:
data modify storage slimecore:in rebuild.disable append from storage scdev:_ v.rebuild.this_ref

execute if data storage scdev:_ v.rebuild.refs.disable[0] run function scdev:_/impl/-/rebuild/disables/each