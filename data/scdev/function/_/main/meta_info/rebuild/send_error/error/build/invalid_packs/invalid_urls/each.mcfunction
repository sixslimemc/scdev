#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_urls/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.invalid_url set from storage scdev:_ t.error.this_entry.error.invalid_urls[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - Key '"}, {text:"KEY", color:white}, {text:"' should contain a valid URL but does not."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.invalid_url.in

data remove storage scdev:_ t.error.this_entry.error.invalid_urls[-1]
execute if data storage scdev:_ t.error.this_entry.error.invalid_urls[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_urls/each