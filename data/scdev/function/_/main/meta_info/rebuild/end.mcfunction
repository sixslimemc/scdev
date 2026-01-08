#> scdev:_/main/meta_info/rebuild/end
#--------------------
# HOOK: slimecore::meta_info/rebuild/end
#--------------------

execute if data storage slimecore:hook end.result.error run tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Rebuild Error:\n", color:dark_red}, {storage:"slimecore:hook", nbt:"end.result.error", color:red}]

execute if data storage slimecore:hook end.result.success run tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text: " Rebuild Success.", color: green}]