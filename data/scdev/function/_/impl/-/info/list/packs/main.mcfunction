# IMPL > scdev :-/ info/list/packs
# main
kill @s

data modify storage scdev:_/in query_packs.disabled set from storage scdev:_ v.packs.args.disabled
data modify storage scdev:_/in query_packs.pack_filter set from storage scdev:_ v.packs.args.pack_filter
function scdev:_/util/query_packs/main

data modify storage scdev:_/in paginate.list set value []
data modify storage scdev:_/in paginate.list append from storage scdev:_/out query_packs.result[].pack_id
data modify storage scdev:_/in paginate.count set from storage scdev:_ v.packs.args.count
data modify storage scdev:_/in paginate.page set from storage scdev:_ v.packs.args.page
function scdev:_/util/paginate/main

data modify storage scdev:_ v.packs.pack_ids set from storage scdev:_/out paginate.result
data modify storage scdev:_ v.packs.indicies set from storage scdev:_/out paginate.indicies

data modify storage scdev:_ v.packs.lines set value []

# title:
data modify storage scdev:_ v.packs.c.title set value {text:"List: Packs", color:yellow, hover_event:{action:"show_text", value:{text:"", color:white, extra:[{text:"Get: "}, {text:"Enabled", color:green}, {text:"\nPage: "}, {plain:true, storage:"scdev:_", nbt:"v.packs.args.page", color:gray}, {text:"\nCount: "}, {text:"(all)", color:dark_gray}, {text:"\nPack Filter: "}, {text:"(none)", color:dark_gray}]}}}
execute if data storage scdev:_ v.packs.args.count run data modify storage scdev:_ v.packs.c.title.hover_event.value.extra[5] set value {plain:true, storage:"scdev:_", nbt:"v.packs.args.count", color:gray}
execute if data storage scdev:_ v.packs.args{disabled:true} run data modify storage scdev:_ v.packs.c.title.hover_event.value.extra[1] set value {text:"Disabled", color:red}
execute if data storage scdev:_ v.packs.args.pack_filter run data modify storage scdev:_ v.packs.c.title.hover_event.value.extra[7] set value {storage:"scdev:_", nbt:"v.packs.args.pack_filter", color:gray}
data modify entity @s text set from storage scdev:_ v.packs.c.title
data modify storage scdev:_ v.packs.c.title set from entity @s text

# header line:
data modify storage scdev:_ v.packs.lines append value {text:"", color:white, extra:[{text:"--[ "}, {}, {text:" ]------"}]}
data modify storage scdev:_ v.packs.lines[-1].extra[1] set from storage scdev:_ v.packs.c.title

# each:
execute unless data storage scdev:_ v.packs.pack_ids[0] run data modify storage scdev:_ v.packs.lines append value {text:"(none)", color:dark_gray}
execute if data storage scdev:_ v.packs.pack_ids[0] run function scdev:_/impl/-/info/list/packs/each

data modify storage scdev:_ v.packs.lines append value {text:"--------------------", color:white}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.packs.lines
data modify storage scdev:_/in send.source set value "scdev:-/info/list/packs"
execute as @n[tag=_scdev.info_runner] run function scdev:_/util/text/send/main
