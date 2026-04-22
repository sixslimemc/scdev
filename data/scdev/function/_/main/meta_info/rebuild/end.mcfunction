#> scdev:_/main/meta_info/rebuild/end
#--------------------
# HOOK: slimecore::meta_info/rebuild/end
#--------------------


execute if data storage slimecore:hook end.result.success run tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text: " Rebuild success.", color: green}]

execute if data storage slimecore:hook end.result.error summon text_display run function scdev:_/main/meta_info/rebuild/send_error/do