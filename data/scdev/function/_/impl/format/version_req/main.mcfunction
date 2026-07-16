#> scdev : format/version_req
# main
execute unless score *version_req.use_self _scdev matches 1 run kill @s

# text:
data modify entity @s text set value {text:"", color:dark_green, extra:[{text:"~"}, {storage:"scdev:in", nbt:"version_req.value.major", plain:true}, {text:"."}, {storage:"scdev:in", nbt:"version_req.value.minor", plain:true}]}

data modify storage scdev:out version_req.result set from entity @s text
