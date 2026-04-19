#> scdev:_/main/meta_info/call/load
#--------------------
# HOOK: slimecore::meta_info/call/load
#--------------------

# remove from {data -> disabled_manifests}
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:data disabled_manifests[{pack_id:'", 2:true, 3:"'}]"}
data modify storage scdev:_ x.mline.2 set from storage slimecore:hook load.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
