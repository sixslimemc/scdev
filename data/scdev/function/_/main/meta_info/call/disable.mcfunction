#> scdev:_/main/meta_info/call/disable
#--------------------
# HOOK: slimecore::meta_info/call/disable
#--------------------

tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Calling #", color:gray}, {storage:"slimecore:hook", nbt:"disable.pack_id", color:gray}, {text:":disable", color:gray}]
