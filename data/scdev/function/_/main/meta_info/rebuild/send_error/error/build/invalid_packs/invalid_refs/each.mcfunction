#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.invalid_ref set from storage scdev:_ t.error.this_entry.error.invalid_pack_references[-1]

data modify storage scdev:_ t.error.lines append value [{text:"", color:gray, extra:[{text:"   - Key "}, {text:"KEY", color:white}, {text:" references a pack that is not a dependency."}]}]
data modify storage scdev:_ t.error.lines[-1][0].extra[1].text set from storage scdev:_ t.error.invalid_ref.key

data remove storage scdev:_ t.error.this_entry.error.invalid_pack_references[-1]
execute if data storage scdev:_ t.error.this_entry.error.invalid_pack_references[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each