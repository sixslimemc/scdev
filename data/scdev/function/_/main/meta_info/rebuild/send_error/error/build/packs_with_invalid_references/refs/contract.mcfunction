#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/contract
#--------------------
# ./each
#--------------------

data modify storage scdev:in contract.reference set from storage scdev:_ t.error.reference
data modify storage scdev:in contract.use_this_entity set value true
function scdev:format/contract
data modify storage scdev:_ t.error.ref_text set from storage scdev:out contract.result