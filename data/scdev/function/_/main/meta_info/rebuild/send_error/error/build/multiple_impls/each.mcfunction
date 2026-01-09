#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [{text: " - Abstract interface ", color:red}, {storage:"slimecore:hook", nbt:"t.error.entry.of.pack_ref", color: yellow}, {text: ":", color:gray}, {storage:"slimecore:hook", nbt:"t.error.entry.of.id", color: dark_green}, {text: " is implemented by packs:", color:red}]

execute if data storage scdev:_ t.error.entry.sources[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/packs/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/each