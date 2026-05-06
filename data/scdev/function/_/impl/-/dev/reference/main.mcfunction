# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:gray, italic:true}
data modify storage scdev:_ v.reference.lines append value {text:"├ ", color:gray, extra:[{text:"data", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ ├ ", color:gray, extra:[{text:"slimecore/tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │ └ ", color:gray, extra:[{text:"manifest.json", color:aqua, bold:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ └ ", color:gray, extra:[{text:"<pack_id>", color:dark_aqua, italic:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    ├ ", color:gray, extra:[{text:"tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"entrypoint", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ │ └ ", color:gray, extra:[{text:"<id>", color:gold, italic:true, bold:true}, {text:".json", color:gold, italic:false, bold:true}, {text:" (...)", color:dark_gray, bold:false}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"preload_entrypoint", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ │ └ ", color:gray, extra:[{text:"<id>", color:dark_purple, italic:true, bold:true}, {text:".json", color:dark_purple, italic:false, bold:true}, {text:" (...)", color:dark_gray, bold:false}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"disable.json", color:dark_aqua, bold:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"load.json", color:dark_aqua, bold:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"safe_mode.json", color:dark_aqua, bold:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"│    │ ├ ", color:gray, extra:[{text:"uninstall.json", color:dark_aqua, bold:true}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main