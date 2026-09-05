# IMPL > scdev:-/rebuild
# warning/list_refs/each
#--------------------
# ../do
#--------------------

data modify storage scdev:_ v.rebuild.this_ref set from storage scdev:_ v.rebuild.list[-1]

execute store success score *rebuild.installed _scdev run function scdev:_/impl/-/rebuild/warning/list_refs/check_installed with storage scdev:_ v.rebuild.this_ref

execute if score *rebuild.installed _scdev matches 1 run function scdev:_/impl/-/rebuild/warning/list_refs/installed
execute if score *rebuild.installed _scdev matches 0 run function scdev:_/impl/-/rebuild/warning/list_refs/not_installed

data remove storage scdev:_ v.rebuild.list[-1]
execute if data storage scdev:_ v.rebuild.list[0] run function scdev:_/impl/-/rebuild/warning/list_refs/each