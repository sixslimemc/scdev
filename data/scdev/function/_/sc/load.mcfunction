#> scdev:_/sc/load
# @ LOAD

scoreboard objectives add _scdev dummy



# DEBUG
scoreboard players reset *init _scdev

execute unless score *init _scdev matches 1 run function scdev:_/sc/init