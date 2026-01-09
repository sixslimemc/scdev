#> scdev:_/main/meta_info/before_reload_check
#--------------------
# HOOK: slimecore::meta_info/before_reload_check
#--------------------

scoreboard objectives add _scdev dummy

# consts:
data modify storage scdev:_ const.chat_marker set value {text:"[scdev]", color:gray}
