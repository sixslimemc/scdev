#> scdev : format/version
# main
execute unless score *version.use_self _scdev matches 1 run kill @s

# text:
data modify entity @s text set value {text:"", color:dark_green, extra:[{storage:"scdev:in", nbt:"version.value.major", plain:true}, {text:"."}, {storage:"scdev:in", nbt:"version.value.minor", plain:true}, {text:"."}, {storage:"scdev:in", nbt:"version.value.patch", plain:true}]}

data modify storage scdev:out version.result set from entity @s text
