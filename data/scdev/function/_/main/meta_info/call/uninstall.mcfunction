#> scdev:_/main/meta_info/call/uninstall
#--------------------
# HOOK: slimecore::meta_info/call/uninstall
#--------------------

tellraw @a[tag=scdev.watch] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Calling #", color:gray}, {storage:"slimecore:hook", nbt:"uninstall.pack_id", color:gray}, {text:":uninstall", color:gray}]
