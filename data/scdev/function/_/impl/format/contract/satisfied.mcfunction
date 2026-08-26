#> scdev : format/contract
# satisfied
#--------------------
# ./main
#--------------------

data modify storage scdev:in pack.pack set from storage scdev:_ v.contract.satisfier
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.satisfier_text set from storage scdev:out pack.result
data remove storage scdev:_ v.contract.satisfier_text.hover_event

data modify storage scdev:_ v.contract.text.hover_event set value {action:"show_text", value:{text:"", color:gray, extra:[{text:"Satisfied by "}, {}]}}
data modify storage scdev:_ v.contract.text.hover_event.value.extra[1] set from storage scdev:_ v.contract.satisfier_text

