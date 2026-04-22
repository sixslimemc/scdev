#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/send
#--------------------
# ../../do
#--------------------

tellraw @a[tag=scdev.listener] {text: ">> Safe mode activated due to the following error(s):", color:dark_purple, bold:true}

execute if data storage slimecore:hook end.result.error.safe_mode_activated.duplicate_installed_pack_ids run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/send

