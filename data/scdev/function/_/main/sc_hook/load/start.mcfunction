#> scdev:_/main/sc_hook/load/start
#--------------------
# HOOK: slimecore::sc_hookload/start
#--------------------

execute if score *supress_load _scdev matches 1 run return run function scdev:_/main/sc_hook/load/supressed
execute summon text_display run function scdev:_/main/sc_hook/load/start/do