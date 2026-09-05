#> scdev:_/main/meta_info/safe_mode/start
#--------------------
# HOOK: slimecore::meta_info/safe_mode/start
#--------------------
scoreboard players reset *supress_load _scdev

execute summon minecraft:text_display run function scdev:_/main/meta_info/safe_mode/start/do

data remove storage scdev:_ t.safe_mode