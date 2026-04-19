#> scdev:_/sc/init
#--------------------
# _/main/rebuild/start
#--------------------
scoreboard players set *init _scdev 1

scoreboard objectives add _scdev dummy

# consts:
data modify storage scdev:_ const.chat_marker set value {text:"[scdev]", color:gray}

# data init:
execute unless data storage scdev:data disabled_manifests run data modify storage scdev:data disabled_manifests set value []