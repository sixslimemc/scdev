#> scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_entry
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - Packs sharing pack ID '"}, {text:"PACK ID", color:yellow}, {text:"':"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.this_entry.pack_id

# list packs:
execute if data storage scdev:_ t.error.this_entry.packs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_pack

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/duplicate_installed_pack_ids/each_entry