# IMPL > scdev :-/ info/list/packs
# each
#--------------------
# ./main
#--------------------

# get index:
scoreboard players set *packs.index _scdev -1
data modify storage scdev:_ x.mline set value {1:"execute store result score *packs.index run data get storage slimecore:data build.order.load[{pack_ref:'", 2:true, 3:"'}].index"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.packs.pack_ids[0]
function scdev:_/util/mline/3 with storage scdev:_ x.mline

# {..index.text}:
execute if score *packs.index _scdev matches -1 run data modify storage scdev:_ v.packs.index_text set value {text:"#", color:dark_red}
execute if score *packs.index _scdev matches 0.. run data modify storage scdev:_ v.packs.index_text set value {score:{name:"*packs.index", objective:"_scdev"}, color:dark_gray}
data modify entity @s text set from storage scdev:_ v.packs.index_text
data modify storage scdev:_ v.packs.index_text set from entity @s text

# {..pack_text}:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.packs.pack_ids[0]
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.packs.pack_text set from storage scdev:out pack.result

# line:
data modify storage scdev:_ v.packs.lines append value [{text:" "}, {}, {text:" - ", color:gray}, {}]
data modify storage scdev:_ v.packs.lines[-1][1] set from storage scdev:_ v.packs.index_text
data modify storage scdev:_ v.packs.lines[-1][3] set from storage scdev:_ v.packs.pack_text

data remove storage scdev:_ v.packs.pack_ids[0]
execute if data storage scdev:_ v.packs.pack_ids[0] run function scdev:_/impl/-/info/list/packs/each