#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/send
#--------------------
# ../../do
#--------------------


execute if data storage slimecore:hook end.result.error.safe_mode_activated.duplicate_installed_pack_ids run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/send

tellraw @a[tag=scdev.listener] {text: "~ Safe mode activated until these errors are fixed.", color:light_purple}
