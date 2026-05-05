# IMPL > scdev :-/ fetch_dependencies
# each_id
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.fetch.this_id set from storage scdev:_ v.fetch.args.pack_ids[-1]

function scdev:_/impl/-/dev/fetch_dependencies/get_pack with storage scdev_ v.fetch

data remove storage scdev:_ v.fetch.args.pack_ids[-1]
execute if data storage scdev:_ v.fetch.args.pack_ids[0] run function scdev:_/impl/-/dev/fetch_dependencies/each_id