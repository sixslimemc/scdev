#> scdev:_/main/meta_info/rebuild/send_error/error/multiple_impls/send
#--------------------
# ../../do
#--------------------

tellraw @s {text: "> Abstract interface(s) have multiple implementations:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.multiple_implementations
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/each



