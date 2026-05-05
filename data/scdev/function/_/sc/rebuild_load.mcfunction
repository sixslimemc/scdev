#> scdev:_/sc/rebuild_load
#--------------------
# _/main/meta_info/rebuild/start
#--------------------

scoreboard objectives add _scdev dummy

# init:
execute unless score *init _scdev matches 1 run function scdev:_/sc/init