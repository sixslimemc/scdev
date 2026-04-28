#> scdev :-/ info/pack
# not_installed

data modify storage scdev:_/in send set value {source:"scdev:-/info/pack"}
data modify storage scdev:_/in send.lines set value [{text:"", color:red, extra:[{text:"no pack with pack ID '"}, {text:"PACK ID", color:yellow}, {text:"' is installed."}]}]
data modify storage scdev:_/in send.lines[0].extra[1].text set from storage scdev:_ v.packinfo.args.pack_id
execute as @n[tag=_scdev.info_runner] run function scdev:_/util/text/send/main

return 0