#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/send
#--------------------
# ../../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: "> Pack(s) reference nonexistent artifact(s):", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.packs_with_invalid_references
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/each