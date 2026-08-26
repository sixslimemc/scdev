#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/entrypoint
#--------------------
# ./each
#--------------------

data modify storage scdev:in entrypoint.reference set from storage scdev:_ t.error.reference
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint
data modify storage scdev:_ t.error.ref_text set from storage scdev:out entrypoint.result