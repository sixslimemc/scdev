#> scdev:_/main/meta_info/safe_mode/start/calls/each
#--------------------
# ../do
#--------------------

data modify storage scdev:_ t.safe_mode.this_call set from storage scdev:_ t.safe_mode.calls[0]

data modify storage scdev:_ t.safe_mode.lines append value {text:"", color:gray, italic:false, extra:[{text:"  - "}, {text:"", italic:true, color:gray, extra:[{text:"#"}, {text:"PACK ID"}, {text:":safe_mode"}]}]}
data modify storage scdev:_ t.safe_mode.lines[-1].extra[1].extra[1].text set from storage scdev:_ t.safe_mode.this_call.pack_ref

data remove storage scdev:_ t.safe_mode.calls[0]
execute if data storage scdev:_ t.safe_mode.calls[0] run function scdev:_/main/meta_info/safe_mode/start/calls/each