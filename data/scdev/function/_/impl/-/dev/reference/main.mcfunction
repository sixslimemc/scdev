# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:dark_gray, italic:true}
data modify storage scdev:_ v.reference.lines append value {text:"├ ", color:white, extra:[{text:"data", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ ├ ", color:white, extra:[{text:"slimecore/tags/function", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │ └ ", color:white, extra:[{text:"manifest.json", color:aqua}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ └ ", color:white, extra:[{text:"<pack_id>", color:dark_aqua, italic:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    ├ ", color:white, extra:[{text:"tags/function", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"entrypoint", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ │ └", color:white, extra:[{text:"<id>", color:gold, italic:true}, {text:".json", color:gold, italic:false}, {text:" (...)", color:dark_gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"preload_entrypoint", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ │ └", color:white, extra:[{text:"<id>", color:dark_purple, italic:true}, {text:".json", color:dark_purple, italic:false}, {text:" (...)", color:dark_gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"disable.json", color:red}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"load.json", color:dark_aqua}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"safe_mode.json", color:light_purple}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:white, extra:[{text:"uninstall.json", color:dark_red}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main