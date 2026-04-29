# IMPL > scdev :-/ info/list/entrypoints
# each
#--------------------
# ./main
#--------------------
# forward iter

data modify storage scdev:_ v.entrypoints.this_entrypoint set from storage scdev:_ v.entrypoints.entrypoints[0]

# get index:
scoreboard players set *entrypoints.index _scdev -1
data remove storage scdev:_ v.entrypoints.index
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.entrypoints.index set from storage slimecore:data build.order.entrypoints[{pack_ref:'", 2:true, 3:"'}].index"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.entrypoints.this_entrypoint.pack_ref
function scdev:_/util/mline/3 with storage scdev:_ x.mline
execute if data storage scdev:_ v.entrypoints.index store result score *entrypoints.index _scdev run data get storage scdev:_ v.entrypoints.index

# {..index.text}:
execute if score *entrypoints.index _scdev matches -1 run data modify storage scdev:_ v.entrypoints.index_text set value {text:"#", color:dark_red}
execute if score *entrypoints.index _scdev matches 0.. run data modify storage scdev:_ v.entrypoints.index_text set value {score:{name:"*entrypoints.index", objective:"_scdev"}, color:dark_gray}
data modify entity @s text set from storage scdev:_ v.entrypoints.index_text
data modify storage scdev:_ v.entrypoints.index_text set from entity @s text

# {..entrypoint_text}:
data modify storage scdev:in entrypoint.reference set from storage scdev:_ v.entrypoints.this_entrypoint
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint
data modify storage scdev:_ v.entrypoints.entrypoint_text set from storage scdev:out entrypoint.result

# line:
data modify storage scdev:_ v.entrypoints.lines append value [{text:" "}, {}, {text:" - ", color:gray}, {}]
data modify storage scdev:_ v.entrypoints.lines[-1][1] set from storage scdev:_ v.entrypoints.index_text
data modify storage scdev:_ v.entrypoints.lines[-1][3] set from storage scdev:_ v.entrypoints.entrypoint_text

data remove storage scdev:_ v.entrypoints.entrypoints[0]
execute if data storage scdev:_ v.entrypoints.entrypoints[0] run function scdev:_/impl/-/info/list/entrypoints/each