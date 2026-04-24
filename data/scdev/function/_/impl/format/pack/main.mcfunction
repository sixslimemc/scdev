#> scdev : format/pack
# main
execute unless score *entrypoint.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.pack.data set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'.pack"}
data modify storage scdev:_ x.mline.2 set from storage scdev:in pack.reference.pack_ref
function scdev:_/util/mline/3 with storage scdev:_ x.mline
execute if data storage scdev:in pack.pack run data modify storage scdev:_ v.pack.data set from storage scdev:in pack.pack

execute if data storage scdev:_ v.pack.data run function scdev:_/impl/format/pack/installed
execute unless data storage scdev:_ v.pack.data run function scdev:_/impl/format/pack/not_installed
