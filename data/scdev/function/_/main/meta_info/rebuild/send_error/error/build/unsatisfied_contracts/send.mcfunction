#> scdev:_/main/meta_info/rebuild/send_error/error/build/unsatisfied_contracts/send
#--------------------
# ../../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: "> Contract(s) would be unsatisfied:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.unsatisfied_contracts
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/unsatisfied_contracts/each