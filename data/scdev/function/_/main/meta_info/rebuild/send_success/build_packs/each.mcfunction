#> scdev:_/main/meta_info/rebuild/send_success/build_packs/each
#--------------------
# ../do
#--------------------

data modify storage scdev:_ t.success.this_pack set from storage scdev:_ t.success.build_packs[-1]

function scdev:_/main/meta_info/rebuild/send_success/build_packs/set with storage scdev:_ t.success.this_pack

data remove storage scdev:_ t.success.build_packs[-1]
execute if data storage scdev:_ t.success.build_packs[0] run function scdev:_/main/meta_info/rebuild/send_success/build_packs/each