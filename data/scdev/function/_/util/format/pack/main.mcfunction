#> scdev :_/util/ format/pack
#--------------------
# ~> pack_id: PackId
# ~> manifest: PackManifest
# => kill: bool = false
#--------------------
# <- result: Text
#--------------------
# prioritizes <manifest>, reads <pack_id> from current build.
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out pack set value {}

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ u.pack.data set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'.pack"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_/in pack.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
execute if data storage scdev:_/in pack.manifest run data modify storage scdev:_ u.pack.data set from storage scdev:_/in pack.manifest

execute if data storage scdev:_ u.pack.data run function scdev:_/util/format/pack/installed
execute unless data storage scdev:_ u.pack.data run function scdev:_/util/format/pack/not_installed

execute if data storage scdev:_/in pack{kill:true} run kill @s

data remove storage scdev:_ u.pack
data remove storage scdev:_/in pack

return 1