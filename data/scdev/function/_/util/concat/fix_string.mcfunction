# UTIL > scdev :_/util/ concat
# fix_string
#--------------------
# ./do
#--------------------

$data modify storage scdev:_ x.str set value $(quote)\$(quote)$(string)$(quote)
data modify entity @s text set value {plain:true, storage:"scdev:_", nbt:"x.str"}
data modify storage scdev:_ u.concat.string set from entity @s text.extra[1]
