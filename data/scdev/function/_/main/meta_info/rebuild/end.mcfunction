#> scdev:_/main/meta_info/rebuild/end
#--------------------
# HOOK: slimecore::meta_info/rebuild/end
#--------------------


execute if data storage slimecore:hook end.result.success run tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text: " Rebuild Success.", color: green}]

execute if data storage slimecore:hook end.result.error as @a[tag=scdev.watch] at @s run function scdev:_/main/meta_info/rebuild/send_error/do