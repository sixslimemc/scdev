#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/send
#--------------------
# ../../do
#--------------------

tellraw @s {text: "> Unimplemented abstract interfaces:", color:red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.unimplemented_abstracts
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each