#> scdev:_/main/meta_info/call/load
#--------------------
# HOOK: slimecore::meta_info/call/load
#--------------------

data modify storage scdev:_ x.mline.2 set from storage slimecore:hook load.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
