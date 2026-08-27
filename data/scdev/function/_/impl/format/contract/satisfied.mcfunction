#> scdev : format/contract
# satisfied
#--------------------
# ./main
#--------------------

# set {..source_text}:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.source_text set from storage scdev:out pack.result

# set {..satisfier_text}:
data modify storage scdev:in pack.pack set from storage scdev:_ v.contract.satisfier
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.satisfier_text set from storage scdev:out pack.result

# build {..hover_extra}:
data modify storage scdev:_ v.contract.hover_extra set value []
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.show_text
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append value {text:"Contract", color:dark_gray, italic:true}
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append value {text:"Current satisfier: ", color:green}
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.satisfier_text
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.source_text

# set hover event:
data modify storage scdev:_ v.contract.show_text.hover_event set value {action:"show_text", value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ v.contract.show_text.hover_event.value.extra set from storage scdev:_ v.contract.hover_extra

# click event:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:in contract.reference.pack_ref
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.contract.show_text.click_event set from storage scdev:_/out click_pack.result
