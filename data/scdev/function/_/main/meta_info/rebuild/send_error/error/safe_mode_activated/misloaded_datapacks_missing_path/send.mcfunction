#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/send
#--------------------
# ../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: "> Datapack paths not found:", color:dark_red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.safe_mode_activated.duplicate_installed_pack_ids
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/misloaded_datapacks_missing_path/each