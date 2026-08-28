# IMPL > scdev : format/contract
# has_source
#--------------------
# ./main
#--------------------

# set {..satisfier_text}:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.contract.asource.source.pack_id
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.source_text set from storage scdev:out pack.result

# modify {..hover_extra}:
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.source_text