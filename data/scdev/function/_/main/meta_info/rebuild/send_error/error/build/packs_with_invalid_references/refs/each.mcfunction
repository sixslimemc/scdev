#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.this_ref set from storage scdev:_ t.error.refs[-1]

# get {..reference}:
data remove storage scdev:_ t.error.reference
function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/get_reference with storage scdev:_ t.error.this_ref

# get {..type_text} & {..ref_text}:
execute store result score *x _scdev run data get storage scdev:_ t.error.this_ref.type
execute if score *x _scdev matches 1 run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/entrypoint
execute if score *x _scdev matches 2 run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/preload_entrypoint
execute if score *x _scdev matches 3 run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/abstract_interface

# line:
data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - Key '"}, {text:"KEY", color:white}, {text:"' references "}, "TYPE", {text:" "}, "REFERENCE", {text:", which does not exist."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].text set from storage scdev:_ t.error.this_ref.key
data modify storage scdev:_ t.error.lines[-1].extra[3] set from storage scdev:_ t.error.type_text
data modify storage scdev:_ t.error.lines[-1].extra[5] set from storage scdev:_ t.error.ref_text

data remove storage scdev:_ t.error.refs[-1]
execute if data storage scdev:_ t.error.refs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/each


