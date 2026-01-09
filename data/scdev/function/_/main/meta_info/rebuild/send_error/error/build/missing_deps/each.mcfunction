#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [{text: " - ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.dependency.author_id", color: dark_green}, {text: ".", color:dark_green}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_green}, {text: " v", color:"dark_aqua"}, {storage:"scdev:_", nbt:"t.error.entry.dependency.version.major", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.version.minor", color: dark_aqua}, {text: " required by ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.from", color: yellow}, {text: ".", color:red}]

data modify storage scdev:_ t.error.download_button set value {text:"[Download]",color:aqua,underlined:true,click_event:{action:"open_url",url:""},hover_event:{action:"show_text", value:[{storage:"scdev:_", nbt:"t.error.entry.dependency.author_id", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_aqua}, " ", {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.major", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.minor", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.patch", color: dark_aqua}]}}
data modify storage scdev:_ t.error.download_button.click_event.url set from storage scdev:_ t.error.entry.dependency.download.url

# not present:
execute if data storage scdev:_ t.error.entry.reason.not_present run tellraw @s [{text:"  (Pack not installed/enabled) ", color:red}, {storage:"scdev:_", nbt:"t.error.download_button",interpret:true}]

# author mismatch:
execute if data storage scdev:_ t.error.entry.reason.author_mismatch run tellraw @s [{text:"  (A pack with an identical pack ID, ", color:"red"}, {storage:"scdev:_", nbt:"t.error.entry.reason.author_mismatch.got", color: dark_aqua}, {text:".", color:"dark_aqua"}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_aqua}, {text:" is enabled, it must be uninstalled/disabled)", color:"red"}]

# incompatible version:
execute if data storage scdev:_ t.error.entry.reason.incompatible_version run tellraw @s [{text:"  (Currently installed pack does not fulfill the version requirement) ", color:red}, {storage:"scdev:_", nbt:"t.error.download_button",interpret:true}]

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/each