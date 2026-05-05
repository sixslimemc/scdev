#> scdev :_/util/ concat
#--------------------
# -> strings: [string]
#--------------------
# <- result: string
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out concat set value {}

execute summon text_display run function scdev:_/util/concat/do

data remove storage scdev:_ u.concat
data remove storage scdev:_/in concat
scoreboard players reset *concat.fix_quote _scdev

return 1