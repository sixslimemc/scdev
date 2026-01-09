# IMPL > scdev:-/quick_deps
# each.1

$execute if data storage scdev:_ v.quick_deps.entries[{pack_id:'$(pack_id)'}] run return 0

data remove storage scdev:_ v.quick_deps.this_pack
$data modify storage scdev:_ v.quick_deps.this_pack set from storage slimecore:data build.aux.pack_map.'$(pack_id)'

$execute unless data storage scdev:_ v.quick_deps.this_pack run tellraw @s {text:"> No pack with pack ID '$(pack_id)' exists in the current build.", color:dark_red}
execute unless data storage scdev:_ v.quick_deps.this_pack run return 0

data modify storage scdev:_ v.quick_deps.dep set value {pack_id:"", author_id:"", version:{}, download:{url:"", version:{}}, optional:false}

data modify storage scdev:_ v.quick_deps.dep.pack_id set from storage scdev:_ v.quick_deps.this_pack.pack_id
data modify storage scdev:_ v.quick_deps.dep.author_id set from storage scdev:_ v.quick_deps.this_pack.author_id
data modify storage scdev:_ v.quick_deps.dep.version set from storage scdev:_ v.quick_deps.this_pack.version
data remove storage scdev:_ v.quick_deps.dep.version.patch
data modify storage scdev:_ v.quick_deps.dep.download.url set from storage scdev:_ v.quick_deps.this_pack.url
data modify storage scdev:_ v.quick_deps.dep.download.version set from storage scdev:_ v.quick_deps.this_pack.version

data modify storage scdev:_ v.quick_deps.entries append from storage scdev:_ v.quick_deps.dep