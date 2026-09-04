#> scdev:_/main/meta_info/rebuild/send_success/send_message/list_packs/each
#--------------------
# ../do
#--------------------

# set {..pack_text}:
data modify storage scdev:in pack.pack set from storage scdev:_ t.success.packs[-1]
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.success.pack_text set from storage scdev:out pack.result

# line:
data modify storage scdev:_ t.success.lines append value {text:"", color:gray, extra:[" ", "SYMBOL", " ", "PACK"]}
data modify storage scdev:_ t.success.lines[-1].extra[1] set from storage scdev:_ t.success.list_symbol
data modify storage scdev:_ t.success.lines[-1].extra[3] set from storage scdev:_ t.success.pack_text

data remove storage scdev:_ t.success.packs[-1]
execute if data storage scdev:_ t.success.packs[0] run function scdev:_/main/meta_info/rebuild/send_success/message/list_packs/each