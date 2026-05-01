#> scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_coflicts/send
#--------------------
# ../../../do
#--------------------

tellraw @a[tag=scdev.listener] {text: "> There would exist entrypoint ordering coflicts:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.build_error.entrypoint_order_conflicts
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/each