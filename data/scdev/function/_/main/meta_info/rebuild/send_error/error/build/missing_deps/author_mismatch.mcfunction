#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/author_mismatch
#--------------------
# ./each
#--------------------

data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ t.error.this_entry.dependency.pack_id
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, italic:true, extra:[{text:"("}, {}, {text:" has an identical pack ID to the dependency)"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:out pack.result