#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/preload_entrypoint
#--------------------
# ./each
#--------------------

data modify storage scdev:in preload_entrypoint.reference set from storage scdev:_ t.error.reference
data modify storage scdev:in preload_entrypoint.use_this_entity set value true
function scdev:format/preload_entrypoint
data modify storage scdev:_ t.error.ref_text set from storage scdev:out preload_entrypoint.result