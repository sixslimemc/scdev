#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/send
#--------------------
# ../../do
#--------------------

tellraw @s {text: "> Datapack paths not found:", color:red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.missing_datapack_paths
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each