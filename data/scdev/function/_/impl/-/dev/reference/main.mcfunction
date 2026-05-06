# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:gray}
data modify storage scdev:_ v.reference.lines append value {text:"├ ", color:dark_gray, extra:[{text:"data", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ ├ ", color:dark_gray, extra:[{text:"slimecore/tags/function", color:gray}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │ └ ", color:dark_gray, extra:[{text:"manifest.json", color:light_purple}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main