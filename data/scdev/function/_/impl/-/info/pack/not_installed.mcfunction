#> scdev :-/ info/pack
# not_installed

data modify storage scdev:_/in send set value {source:"scdev:-/info/pack"}
data modify storage scdev:_/in send.lines set value [{text:"", extra:[{text:"There is no pack with ID '"}, {text:"PACK ID", color:yellow}, {text:"' installed."}]}]
data modify storage scdev:_/in send.lines[0].extra[1].text set from storage scdev:_ v.pack.args.pack_id
function scdev:_/util/text/send/main

return 0