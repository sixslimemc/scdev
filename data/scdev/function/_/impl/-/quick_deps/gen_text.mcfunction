# IMPL > scdev:-/quick_deps
# gen_text
#--------------------
# ./main
#--------------------
kill @s

data modify entity @s text set value {storage:"scdev:_", nbt:"v.quick_deps.entries"}
data modify storage scdev:_ v.quick_deps.text set from entity @s text