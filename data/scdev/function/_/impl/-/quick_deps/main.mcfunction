# IMPL > scdev:-/quick_deps
# main

execute unless data storage scdev:_ v.quick_deps.packs[0] run tellraw @s {text:"'packs' arg must be an array of pack IDs (with at least 1 element).", color:red}
execute unless data storage scdev:_ v.quick_deps.packs[0] run return 0

data modify storage scdev:_ v.quick_deps.entries set value []
execute if data storage scdev:_ v.quick_deps.packs[0] run function scdev:_/impl/-/quick_deps/each

# {..text}:
execute summon text_display run function scdev:_/impl/-/quick_deps/gen_text

data modify storage scdev:_ v.quick_deps.message set value {text:"Click to copy value", color:yellow, underlined:true, click_event:{action:"copy_to_clipboard", value:""}}
data modify storage scdev:_ v.quick_deps.message.click_event.value set from storage scdev:_ v.quick_deps.text

tellraw @s {storage:"scdev:_", nbt:"v.quick_deps.message",interpret:true}
tellraw @s {text:"In your pack's manifest function:", color:gray, italic:true}
tellraw @s [{text:"data modify storage slimecore:in manifest.pack.dependencies set value ", color:dark_purple}, {text: "<value>", color:light_purple, italic:true}]