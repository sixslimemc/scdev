#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/send
#--------------------
# ../../../do
#--------------------

tellraw @s {text:"> Invalid pack manifests:", color: dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.invalid_packs
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each
