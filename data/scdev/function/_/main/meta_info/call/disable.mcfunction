#> scdev:_/main/meta_info/call/disable
#--------------------
# HOOK: slimecore::meta_info/call/disable
#--------------------

data modify storage scdev:_ x.text set value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Calling #", color:gray}, {text:"PACK ID", color:gray}, {text:":disable", color:gray}]
data modify storage scdev:_ x.text[2].text set from storage slimecore:hook disable.pack_id
tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"x.text"}

# add to {data -> disabled_manifests}
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:data disabled_manifests append from storage scdev:_ data.last_build.aux.pack_map.'", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage slimecore:hook disable.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline