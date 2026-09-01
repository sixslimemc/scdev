# IMPL > scdev :-/ info/list/contracts
# main
kill @s

# store flags:
execute store success score *contracts.disabled _scdev if data storage scdev:_ v.contracts.args{disabled:true}

# get {..pack_pool}:
data modify storage scdev:_/in query_packs.disabled set from storage scdev:_ v.contracts.args.disabled
data modify storage scdev:_/in query_packs.pack_filter set from storage scdev:_ v.contracts.args.pack_filter
function scdev:_/util/query_packs/main
data modify storage scdev:_ v.contracts.pack_pool set from storage scdev:_/out query_packs.result

# populate {..contracts}
data modify storage scdev:_ v.contracts.contracts set value []
execute if data storage scdev:_ v.contracts.pack_pool[0] run function scdev:_/impl/-/info/list/contracts/each_pack

# get *.total:
execute if score *contracts.disabled _scdev matches 0 store result score *contracts.total _scdev if data storage slimecore:data world.installed[{disabled:false}].pack.contract_declarations[]
execute if score *contracts.disabled _scdev matches 1 store result score *contracts.total _scdev if data storage slimecore:data world.installed[{disabled:true}].pack.contract_declarations[]

# paginate {..contracts}:
data modify storage scdev:_/in paginate.list set from storage scdev:_ v.contracts.contracts
data modify storage scdev:_/in paginate.count set from storage scdev:_ v.contracts.args.count
data modify storage scdev:_/in paginate.page set from storage scdev:_ v.contracts.args.page
function scdev:_/util/paginate/main

data modify storage scdev:_ v.contracts.contracts set from storage scdev:_/out paginate.result
data modify storage scdev:_ v.contracts.indicies set from storage scdev:_/out paginate.indicies
execute store result score *contracts.showing _scdev if data storage scdev:_ v.contracts.contracts[]

data modify storage scdev:_ v.contracts.lines set value []

# title:
data modify storage scdev:_ v.contracts.c.title set value {text:"List: Contracts", color:green, hover_event:{action:"show_text", value:{text:"", color:white, extra:[{text:"Get: "}, {text:"Enabled", color:green}, {text:"\nPage: "}, {plain:true, storage:"scdev:_", nbt:"v.contracts.args.page", color:gray}, {text:"\nCount: "}, {text:"(all)", color:dark_gray}, {text:"\nPack Filter: "}, {text:"(none)", color:dark_gray}]}}}
execute if score *contracts.disabled _scdev matches 1 run data modify storage scdev:_ v.contracts.c.title.color set value red
execute if data storage scdev:_ v.contracts.args.count run data modify storage scdev:_ v.contracts.c.title.hover_event.value.extra[5] set value {plain:true, storage:"scdev:_", nbt:"v.contracts.args.count", color:gray}
execute if score *contracts.disabled _scdev matches 1 run data modify storage scdev:_ v.contracts.c.title.hover_event.value.extra[1] set value {text:"Disabled", color:red}
execute if data storage scdev:_ v.contracts.args.pack_filter run data modify storage scdev:_ v.contracts.c.title.hover_event.value.extra[7] set value {storage:"scdev:_", nbt:"v.contracts.args.pack_filter", color:gray}
data modify entity @s text set from storage scdev:_ v.contracts.c.title
data modify storage scdev:_ v.contracts.c.title set from entity @s text

# header line:
data modify storage scdev:_ v.contracts.lines append value {text:"", color:white, extra:[{text:"--[ "}, {}, {text:" ]---"}]}
data modify storage scdev:_ v.contracts.lines[-1].extra[1] set from storage scdev:_ v.contracts.c.title

# showing line:
data modify entity @s text set value {text:"", color:"gray", extra:[{text:"Showing "}, {score:{name:"*contracts.showing", objective:"_scdev"}}, {text:"/"}, {score:{name:"*contracts.total", objective:"_scdev"}}, {text:":"}]}
data modify storage scdev:_ v.contracts.lines append from entity @s text

# each:
execute if data storage scdev:_ v.contracts.contracts[0] run function scdev:_/impl/-/info/list/contracts/each

data modify storage scdev:_ v.contracts.lines append value {text:"--------------------", color:white}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.contracts.lines
data modify storage scdev:_/in send.source set value "scdev:-/info/list/contracts"
execute as @n[tag=_scdev.info_runner] run function scdev:_/util/text/send/main
