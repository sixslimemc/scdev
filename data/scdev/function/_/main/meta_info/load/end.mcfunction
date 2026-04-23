#> scdev:_/main/meta_info/load/end
#--------------------
# HOOK: slimecore::meta_info/load/end
#--------------------

tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" ✔ ", color:dark_green}, {text:"Loading finished.", color:green}]