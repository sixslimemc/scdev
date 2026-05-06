# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:gray}
data modify storage scdev:_ v.reference.lines append value {text:"├ ", color:gray, extra:[{text:"data"}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ ├ ", color:gray, extra:[{text:"slimecore"}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │ └ ", color:gray, extra:[{text:"tags"}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │   └ ", color:gray, extra:[{text:"function"}]}
data modify storage scdev:_ v.reference.lines append value {text:"│ │     └ ", color:gray, extra:[{text:"manifest.json", color:light_purple}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main