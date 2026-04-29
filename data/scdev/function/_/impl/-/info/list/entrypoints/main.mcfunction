# IMPL > scdev :-/ info/list/entrypoints
# main
kill @s

# get pack pool:
data modify storage scdev:_/in query_packs.disabled set from storage scdev:_ v.entrypoints.args.disabled
data modify storage scdev:_/in query_packs.pack_filter set from storage scdev:_ v.entrypoints.args.pack_filter
function scdev:_/util/query_packs/main
data modify storage scdev:_ v.entrypoints.pack_pool set from storage scdev:_/out query_packs.result

# populate {..pack_pool_map}
data modify storage scdev:_ v.entrypoints.pack_pool_map set value {}
execute if data storage scdev:_ v.entrypoints.pack_pool[0] run function scdev:_/impl/-/info/list/entrypoints/each_pack with storage scdev:_ v.entrypoints.pack_pool[-1]

# populate {..entrypoints}
# set *.total_enabled
# set *.total_disabled
scoreboard players set *entrypoints.total_enabled _scdev 0
scoreboard players set *entrypoints.total_disabled _scdev 0
data modify storage scdev:_ v.entrypoints.entrypoints set value []
data modify storage scdev:_ v.entrypoints.entrypoint_iter set from storage slimecore:data build.order.entrypoints
execute if data storage scdev:_ v.entrypoints.entrypoint_iter[0] run function scdev:_/impl/-/info/list/entrypoints/filter_entrypoint with storage scdev:_ v.entrypoints.entrypoint_iter[0]

# paginate {..entrypoints}:
data modify storage scdev:_/in paginate.list set from storage scdev:_ v.entrypoints.entrypoints
data modify storage scdev:_/in paginate.count set from storage scdev:_ v.entrypoints.args.count
data modify storage scdev:_/in paginate.page set from storage scdev:_ v.entrypoints.args.page
function scdev:_/util/paginate/main

data modify storage scdev:_ v.entrypoints.entrypoints set from storage scdev:_/out paginate.result
data modify storage scdev:_ v.entrypoints.indicies set from storage scdev:_/out paginate.indicies
execute store result score *entrypoints.showing _scdev if data storage scdev:_ v.entrypoints.entrypoints[]

data modify storage scdev:_ v.entrypoints.lines set value []

# title:
data modify storage scdev:_ v.entrypoints.c.title set value {text:"List: Entrypoints", color:yellow, hover_event:{action:"show_text", value:{text:"", color:white, extra:[{text:"Get: "}, {text:"Enabled", color:green}, {text:"\nPage: "}, {plain:true, storage:"scdev:_", nbt:"v.entrypoints.args.page", color:gray}, {text:"\nCount: "}, {text:"(all)", color:dark_gray}, {text:"\nPack Filter: "}, {text:"(none)", color:dark_gray}]}}}
execute if data storage scdev:_ v.entrypoints.args.count run data modify storage scdev:_ v.entrypoints.c.title.hover_event.value.extra[5] set value {plain:true, storage:"scdev:_", nbt:"v.entrypoints.args.count", color:gray}
execute if data storage scdev:_ v.entrypoints.args{disabled:true} run data modify storage scdev:_ v.entrypoints.c.title.hover_event.value.extra[1] set value {text:"Disabled", color:red}
execute if data storage scdev:_ v.entrypoints.args.pack_filter run data modify storage scdev:_ v.entrypoints.c.title.hover_event.value.extra[7] set value {storage:"scdev:_", nbt:"v.entrypoints.args.pack_filter", color:gray}
data modify entity @s text set from storage scdev:_ v.entrypoints.c.title
data modify storage scdev:_ v.entrypoints.c.title set from entity @s text

# header line:
data modify storage scdev:_ v.entrypoints.lines append value {text:"", color:white, extra:[{text:"--[ "}, {}, {text:" ]------"}]}
data modify storage scdev:_ v.entrypoints.lines[-1].extra[1] set from storage scdev:_ v.entrypoints.c.title

# showing line:
execute if data storage scdev:_ v.entrypoints.args{disabled:false} run scoreboard players operation *x _scdev = *entrypoints.total_enabled _scdev
execute unless data storage scdev:_ v.entrypoints.args{disabled:false} run scoreboard players operation *x _scdev = *entrypoints.total_disabled _scdev
data modify entity @s text set value {text:"", color:"gray", extra:[{text:"Showing "}, {score:{name:"*entrypoints.showing", objective:"_scdev"}}, {text:"/"}, {score:{name:"*x", objective:"_scdev"}}, {text:":"}]}
data modify storage scdev:_ v.entrypoints.lines append from entity @s text

# each:
execute if data storage scdev:_ v.entrypoints.entrypoints[0] run function scdev:_/impl/-/info/list/entrypoints/each

data modify storage scdev:_ v.entrypoints.lines append value {text:"--------------------", color:white}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.entrypoints.lines
data modify storage scdev:_/in send.source set value "scdev:-/info/list/entrypoints"
execute as @n[tag=_scdev.info_runner] run function scdev:_/util/text/send/main
