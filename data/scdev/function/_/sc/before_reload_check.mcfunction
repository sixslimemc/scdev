#> scdev:_/main/meta_info/before_reload_check
#--------------------
# HOOK: slimecore::meta_info/before_reload_check
#--------------------

scoreboard objectives add _scdev dummy



# DEBUG
scoreboard players reset *init _scdev

execute unless score *init _scdev matches 1 run function scdev:_/sc/init