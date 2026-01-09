#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/send
#--------------------
# ../../do
#--------------------

tellraw @s {text: "> Unfulfilled dependencies:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.unfulfilled_dependencies
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/each



