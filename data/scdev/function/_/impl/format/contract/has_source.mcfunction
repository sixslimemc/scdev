# IMPL > scdev : format/contract
# has_source
#--------------------
# ./main
#--------------------

# set {..satisfier_text}:
data modify storage scdev:in pack.pack set from storage scdev:_ v.contract.asource.source
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.contract.source_text set from storage scdev:out pack.result

# modify {..hover_extra}:
data modify storage scdev:_ v.contract.hover_extra append value "\n"
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.source_text

# click event:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:in contract.reference.pack_ref
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.contract.show_text.click_event set from storage scdev:_/out click_pack.result