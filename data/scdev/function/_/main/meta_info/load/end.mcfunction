#> scdev:_/main/meta_info/load/end
#--------------------
# HOOK: slimecore::meta_info/load/end
#--------------------

tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Reached load end.", color:gray}]