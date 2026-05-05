# IMPL > scdev :-/ fetch_dependencies
# get_pack
#--------------------
# ./each_id
#--------------------

$say $(this_id)
# check seen:
$execute store result score *x _scdev run data modify storage scdev:_ v.fetch.seen_map.'$(this_id)' set value true
execute if score *x _scdev matches 0 run return 1

data remove storage scdev:_ v.fetch.pack
$data modify storage scdev:_ v.fetch.pack set from storage slimecore:data world.installed_map.'$(this_id)'.pack
execute unless data storage scdev:_ v.fetch.pack run data modify storage scdev:_ v.fetch.invalid_ids prepend from storage scdev:_ v.fetch.this_id
execute unless data storage scdev:_ v.fetch.pack run return 0

data modify storage scdev:_ v.fetch.packs append from storage scdev:_ v.fetch.pack