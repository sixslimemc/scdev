#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [{text: " - Pack ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.from", color: yellow}, {text: " requires ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.dependency.author_id", color: dark_green}, {text: ".", color:dark_green}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_green}, " ", {storage:"scdev:_", nbt:"t.error.entry.dependency.version.major", color: dark_green}, {text: ".", color:dark_green}, {storage:"scdev:_", nbt:"t.error.entry.dependency.version.minor", color: dark_green}, {text: ".", color:red}]

data modify storage scdev:_ t.error.download_button set value {text:"[Download]",color:aqua,underlined:true,click_event:{action:"open_url",url:""},hover_event:{action:"show_text", value:[{storage:"scdev:_", nbt:"t.error.entry.dependency.author_id", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_aqua}, " ", {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.major", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.minor", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.patch", color: dark_aqua}]}}
data modify storage scdev:_ t.error.download_button.click_event.url set from storage scdev:_ t.error.entry.dependency.download.url
# not present:
execute if data storage scdev:_ t.error.entry.reason.not_present run tellraw @s [{text:"  (Pack not installed/enabled) ", color:red}, {storage:"scdev:_", nbt:"t.error.download_button",interpret:true}]

# tellraw @s {text:"[Download]",color:aqua,underlined:true,click_event:{action:"open_url",url:""},hover_event:{action:"show_text", value:[{storage:"scdev:_", nbt:"t.error.entry.dependency.author_id", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_aqua}, " ", {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.major", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.minor", color: dark_aqua}, {text: ".", color:dark_aqua}, {storage:"scdev:_", nbt:"t.error.entry.dependency.download.version.patch", color: dark_aqua}]}}

# author mismatch:
execute if data storage scdev:_ t.error.entry.reason.author_mismatch run tellraw @s [{text:"  (Pack with identical pack ID is installed, but incorrect author ID. This pack must be uninstalled/disabled)", color:red}]

# incompatible version:
execute if data storage scdev:_ t.error.entry.reason.incompatible_version run tellraw @s [{text:"  (Installed pack does not fulfill the version requirement)", color:red}]

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/each