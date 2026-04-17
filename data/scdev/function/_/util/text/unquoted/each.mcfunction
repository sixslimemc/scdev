# UTIL > scdev:_/util/text/unquoted
# each
#--------------------
# ./main
#--------------------

data modify entity @s text set value {plain:true, storage:"scdev:_/in", nbt:"unquoted.strings[-1]"}
data modify storage scdev:_/out unquoted.result prepend value {text:""}
data modify storage scdev:_/out unquoted.result[0].text set from entity @s text.extra[1]

data remove storage scdev:_/in unquoted.strings[-1]
execute if data storage scdev:_/in unquoted.strings[0] run function scdev:_/util/text/unquoted/each