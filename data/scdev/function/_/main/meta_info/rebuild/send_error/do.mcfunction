#> scdev:_/main/meta_info/rebuild/send_error/do
#--------------------
# ../end
#--------------------

tellraw @s [{storage:"scdev:_", nbt:"const.chat_marker"}, {text:" Rebuild Error:", color: dark_red, bold:true}]

execute if data storage slimecore:hook end.result.error.missing_datapack_paths run function scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/send

data remove storage scdev:_ t.error