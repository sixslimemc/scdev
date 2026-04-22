#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/send
#--------------------
# ../send
#--------------------

tellraw @a[tag=scdev.listener] {text: "> Multiple installed packs share pack IDs:", color:red}

data modify storage scdev:_ t.error.entries set from storage slimecore:hook end.result.error.safe_mode_activated.duplicate_installed_pack_ids
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_entry
