# IMPL > scdev :-/ fetch_dependencies
# main

# set *.compact:
scoreboard players set *fetch.compact _scdev 0
execute if data storage scdev:_ v.fetch.args.compact store result score *fetch.compact _scdev run data get storage scdev:_ v.fetch.args.compact

data modify storage scdev:_ v.fetch.copy_segments set value []
data modify storage scdev:_ v.fetch.invalid_ids set value []
data modify storage scdev:_ v.fetch.packs set value []
data modify storage scdev:_ v.fetch.seen_map set value {}

# each id:
execute if data storage scdev:_ v.fetch.args.pack_ids[0] run function scdev:_/impl/-/dev/fetch_dependencies/each_id

# if invalid ids:
execute if data storage scdev:_ v.fetch.invalid_ids[0] run return run function scdev:_/impl/-/dev/fetch_dependencies/invalid_ids

# one-line starter:
execute if score *fetch.compact _scdev matches 2 run data modify storage scdev:_ v.fetch.copy_segments append value 'data modify storage slimecore:in manifest.pack.dependencies set value ['

# each pack:
execute if data storage scdev:_ v.fetch.packs[0] run function scdev:_/impl/-/dev/fetch_dependencies/each_pack

# one-line ender:
execute if score *fetch.compact _scdev matches 2 run data modify storage scdev:_ v.fetch.copy_segments append value ']'

# get {..copy_string}:
data modify storage scdev:_/in concat.strings set from storage scdev:_ v.fetch.copy_segments
function scdev:_/util/concat/main
data modify storage scdev:_ v.fetch.copy_string set from storage scdev:_/out concat.result

# DEBUG:
tellraw @a ["", {'storage':'scdev:_', 'nbt':'v.fetch.copy_string'}]

# send:
data modify storage scdev:_/in send.lines set value [{text:"[Copy Command(s) to Clipboard]", color:white, underlined:true, hover_event:{action:"show_text", value:{text:"Click to copy", color:gray}}, click_event:{action:"copy_to_clipboard", value:""}}]
data modify storage scdev:_/in send.lines[0].click_event.value set from storage scdev:_ v.fetch.copy_string
data modify storage scdev:_/in send.source set value "scdev:-/dev/fetch_dependencies"
function scdev:_/util/text/send/main
