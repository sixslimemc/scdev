#> scdev:_/main/meta_info/load/start
#--------------------
# HOOK: slimecore::meta_info/load/start
#--------------------

execute if score *supress_load _scdev matches 1 run return run function scdev:_/main/meta_info/load/supressed
execute summon text_display run function scdev:_/main/meta_info/load/start.1