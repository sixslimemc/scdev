#> scdev:_/main/sc_hook/safe_mode/start
#--------------------
# HOOK: slimecore::sc_hooksafe_mode/start
#--------------------
scoreboard players reset *supress_load _scdev

execute summon minecraft:text_display run function scdev:_/main/sc_hook/safe_mode/start/do

data remove storage scdev:_ t.safe_mode