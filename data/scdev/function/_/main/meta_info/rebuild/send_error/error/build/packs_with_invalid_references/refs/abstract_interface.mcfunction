#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/abstract_interface
#--------------------
# ./each
#--------------------

data modify storage scdev:in abstract.reference set from storage scdev:_ t.error.reference
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract
data modify storage scdev:_ t.error.ref_text set from storage scdev:out abstract.result