# scdev:_/main/meta_info/rebuild
#--------------------
# HOOK: slimecore::meta_info/rebuild/end
#--------------------

execute if data storage slimecore:hook end.result.error run tellraw @a [{text:"> Rebuild Error:\n", color:dark_red}, {storage:"slimecore:hook", nbt:"end.result.error", color:red}]

execute if data storage slimecore:hook end.result.success run tellraw @a {text: "> Rebuild Success.", color: green}