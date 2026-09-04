#> scdev:_/main/meta_info/rebuild/end
#--------------------
# HOOK: slimecore::meta_info/rebuild/end
#--------------------

# success:
execute if data storage slimecore:hook end.result.success run return run function scdev:_/main/meta_info/rebuild/send_success/do

# fail:
execute if data storage slimecore:hook end.result.error run scoreboard players set *supress_load _scdev 1
execute if data storage slimecore:hook end.result.error summon text_display run function scdev:_/main/meta_info/rebuild/send_error/do