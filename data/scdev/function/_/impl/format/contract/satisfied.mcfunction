# IMPL > scdev : format/contract
# satisfied
#--------------------
# ./main
#--------------------

# set {..satisfier_text}:
$data modify storage scdev:in pack.pack set from storage slimecore:data build.aux.contract_map.'$(pack_ref)'.'$(id)'
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.satisfier_text set from storage scdev:out pack.result

# modify {..hover_extra}:
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append value {text:"Satisfier: ", color:white, italic:false}
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.satisfier_text