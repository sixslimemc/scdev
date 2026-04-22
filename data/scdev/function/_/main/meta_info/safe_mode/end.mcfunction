#> scdev:_/main/meta_info/safe_mode/end
#--------------------
# HOOK: slimecore::meta_info/safe_mode/end
#--------------------

tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Safe-mode load finished.", color:dark_purple}]
