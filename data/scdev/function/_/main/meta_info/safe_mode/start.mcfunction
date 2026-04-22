#> scdev:_/main/meta_info/safe_mode/start
#--------------------
# HOOK: slimecore::meta_info/safe_mode/start
#--------------------

tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Safe mode is active, loading disabled.", color:light_purple}]
