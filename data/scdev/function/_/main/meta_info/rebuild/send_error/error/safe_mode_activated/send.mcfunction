#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/send
#--------------------
# ../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: ">> Critical error(s) activating safe mode:", color:dark_purple, bold:true}

execute if data storage slimecore:hook end.result.error.safe_mode_activated.duplicate_installed_pack_ids run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/send
execute if data storage slimecore:hook end.result.error.safe_mode_activated.misloaded_datapacks_missing_path run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/misloaded_datapacks_missing_path/send

