#> scdev:_/main/meta_info/rebuild/send_error/error/oversatisfied_contracts/send
#--------------------
# ../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: "> Abstract interface(s) would have multiple implementations:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.oversatisfied_contracts
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/oversatisfied_contracts/each



