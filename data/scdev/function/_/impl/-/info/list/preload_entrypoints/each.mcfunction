# IMPL > scdev :-/ info/list/preload_entrypoints
# each
#--------------------
# ./main
#--------------------
# forward iter

data modify storage scdev:_ v.preload_entrypoints.this_entrypoint set from storage scdev:_ v.preload_entrypoints.entrypoints[0]

# get index:
scoreboard players set *preload_entrypoints.index _scdev -1
data remove storage scdev:_ v.preload_entrypoints.index
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.preload_entrypoints.index set from storage slimecore:data build.order.preload_entrypoints[{pack_ref:'", 2:true, 3:"', id:'", 4:true, 5:"'}].index"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.preload_entrypoints.this_entrypoint.pack_ref
data modify storage scdev:_ x.mline.4 set from storage scdev:_ v.preload_entrypoints.this_entrypoint.id
function scdev:_/util/mline/5 with storage scdev:_ x.mline
execute if data storage scdev:_ v.preload_entrypoints.index store result score *preload_entrypoints.index _scdev run data get storage scdev:_ v.preload_entrypoints.index

# {..index.text}:
execute if score *preload_entrypoints.index _scdev matches -1 run data modify storage scdev:_ v.preload_entrypoints.index_text set value {text:"#", color:dark_red}
execute if score *preload_entrypoints.index _scdev matches 0.. run data modify storage scdev:_ v.preload_entrypoints.index_text set value {score:{name:"*preload_entrypoints.index", objective:"_scdev"}, color:dark_gray}
data modify entity @s text set from storage scdev:_ v.preload_entrypoints.index_text
data modify storage scdev:_ v.preload_entrypoints.index_text set from entity @s text

# {..entrypoint_text}:
data modify storage scdev:in preload_entrypoint.reference set from storage scdev:_ v.preload_entrypoints.this_entrypoint
data modify storage scdev:in preload_entrypoint.use_this_entity set value true
function scdev:format/preload_entrypoint
data modify storage scdev:_ v.preload_entrypoints.entrypoint_text set from storage scdev:out preload_entrypoint.result

# line:
data modify storage scdev:_ v.preload_entrypoints.lines append value [{text:" "}, {}, {text:" - ", color:gray}, {}]
data modify storage scdev:_ v.preload_entrypoints.lines[-1][1] set from storage scdev:_ v.preload_entrypoints.index_text
data modify storage scdev:_ v.preload_entrypoints.lines[-1][3] set from storage scdev:_ v.preload_entrypoints.entrypoint_text

data remove storage scdev:_ v.preload_entrypoints.entrypoints[0]
execute if data storage scdev:_ v.preload_entrypoints.entrypoints[0] run function scdev:_/impl/-/info/list/preload_entrypoints/each