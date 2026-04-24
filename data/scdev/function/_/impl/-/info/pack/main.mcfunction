#> scdev :-/ info/pack
# main

data remove storage scdev:_ v.pack.entry
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.pack.entry set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.pack.args.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline

execute unless data storage scdev:_ v.pack.entry run return run function scdev:_/impl/-/info/pack/not_installed

return 1