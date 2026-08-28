# IMPL > scdev : format/pack
# invalid_reference

data modify storage scdev:out pack.result set value {text:"", color:dark_gray, strikethrough:true, italic:true, extra:[{text:"?."}, {text:"PACK ID"}], hover_event:{action:'show_text', value:{text:"", color:dark_gray, italic:false, extra:[{text:"There is no installed pack with pack ID '"}, {text:"PACK ID", color:gray}, {text:"'"}]}}}
data modify storage scdev:out pack.result.extra[1].text set from storage scdev:in pack.reference.pack_ref
data modify storage scdev:out pack.result.hover_event.value.extra[1].text set from storage scdev:in pack.reference.pack_ref