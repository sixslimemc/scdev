# IMPL > scdev :-/ info/list/entrypoints
# each
#--------------------
# ./main
#--------------------
# forward iter

data modify storage scdev:_ v.entrypoints.this_entrypoint set from storage scdev:_ v.entrypoints.entrypoints[0]

data modify storage scdev:in entrypoint.reference set from storage scdev:_ v.entrypoints.this_entrypoint
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint
data modify storage scdev:_ v.entrypoints.entrypoint_text set from storage scdev:out entrypoint.result

data modify storage scdev:_ v.entrypoints.lines append value [{}, {text:" - ", color:gray}, {}]
data modify entity @s text set value {plain:true, storage:"scdev:_", nbt:"v.entrypoints.this_entrypoint.index", color:dark_gray}
data modify storage scdev:_ v.entrypoints.lines[-1][0] set from entity @s text
data modify storage scdev:_ v.entrypoints.lines[-1][2] set from storage scdev:_ v.entrypoints.entrypoint_text

data remove storage scdev:_ v.entrypoints.entrypoints[0]
execute if data storage scdev:_ v.entrypoints.entrypoints[0] run function scdev:_/impl/-/info/list/entrypoints/each