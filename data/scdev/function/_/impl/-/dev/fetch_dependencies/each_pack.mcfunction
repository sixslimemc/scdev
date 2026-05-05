# IMPL > scdev :-/ fetch_dependencies
# each_pack
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.fetch.this_pack set from storage scdev:_ v.fetch.packs[-1]

data modify storage scdev:_ v.fetch.macro set from storage scdev:_ v.fetch.this_pack
data modify storage scdev:_ v.fetch.macro.ver_major set from storage scdev:_ v.fetch.this_pack.version.major
data modify storage scdev:_ v.fetch.macro.ver_minor set from storage scdev:_ v.fetch.this_pack.version.minor
data modify storage scdev:_ v.fetch.macro.ver_patch set from storage scdev:_ v.fetch.this_pack.version.patch
function scdev:_/impl/-/dev/fetch_dependencies/each_pack.1 with storage scdev:_ v.fetch.macro

data remove storage scdev:_ v.fetch.packs[-1]
execute if data storage scdev:_ v.fetch.packs[0] run function scdev:_/impl/-/dev/fetch_dependencies/each_pack