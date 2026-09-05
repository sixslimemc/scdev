# IMPL > scdev :-/ help
# main

data modify storage scdev:_ v.help.lines set value []

data modify storage scdev:_ v.help.lines append value {text:"--[ Help ]----------", color:aqua, bold:false}

# tag tip:
data modify storage scdev:_ v.help.command set value "/tag @s add scdev.listen"
data modify storage scdev:_ v.help.lines append value {text:"", color:gray, italic:false, extra:[{text:">", color:white, bold:true}, {text:" Add the tag "}, {text:"scdev.listen", color:green}, {text:" to yourself to recieve chat messages from SCDev, such as rebuild reports/errors."}], hover_event:{action:'show_text', value:{text:"", color:gray, italic:false, extra:[{text:"COMMAND", color:dark_aqua}, {text:"\n(Clickable)", color:dark_gray}]}}, click_event:{action:'suggest_command', command:"COMMAND"}}
data modify storage scdev:_ v.help.lines[-1].hover_event.value.extra[0].text set from storage scdev:_ v.help.command
data modify storage scdev:_ v.help.lines[-1].click_event.command set from storage scdev:_ v.help.command

# reload tip:
data modify storage scdev:_ v.help.command set value "/reload"
data modify storage scdev:_ v.help.lines append value {text:"", color:gray, italic:false, extra:[{text:">", color:white, bold:true}, {text:" Doing "}, {text:"/reload", color:dark_aqua}, {text:" will send a rebuild and/or load summary."}], hover_event:{action:'show_text', value:{text:"", color:gray, italic:false, extra:[{text:"COMMAND", color:dark_aqua}, {text:"\n(Clickable)", color:dark_gray}]}}, click_event:{action:'suggest_command', command:"COMMAND"}}
data modify storage scdev:_ v.help.lines[-1].hover_event.value.extra[0].text set from storage scdev:_ v.help.command
data modify storage scdev:_ v.help.lines[-1].click_event.command set from storage scdev:_ v.help.command

# info tip:
data modify storage scdev:_ v.help.command set value "/function scdev:-/info/"
data modify storage scdev:_ v.help.lines append value {text:"", color:gray, italic:false, extra:[{text:">", color:white, bold:true}, {text:" Functions under "}, {text:"scdev:-/info/...", color:gold}, {text:" can provide useful information about installed datapacks."}], hover_event:{action:'show_text', value:{text:"", color:gray, italic:false, extra:[{text:"COMMAND", color:dark_aqua}, {text:"\n(Clickable)", color:dark_gray}]}}, click_event:{action:'suggest_command', command:"COMMAND"}}
data modify storage scdev:_ v.help.lines[-1].hover_event.value.extra[0].text set from storage scdev:_ v.help.command
data modify storage scdev:_ v.help.lines[-1].click_event.command set from storage scdev:_ v.help.command

# click tip:
data modify storage scdev:_ v.help.lines append value {text:"", color:gray, italic:false, extra:[{text:">", color:white, bold:true}, {text:" Many text elements sent by SCDev are hoverable and/or clickable (such as the text above)."}]}

# info link:
data modify storage scdev:_ v.help.lines append value {text:"", color:gray, italic:false, extra:[{text:">", color:white, bold:true}, {text:" For full information, "}, {text:"[Click Here]", color:blue, underlined:true, hover_event:{action:'show_text', value:{text:"Click to open URL", color:gray}}, click_event:{action:'open_url', url:'URL'}}, {text:"."}]}
data modify storage scdev:_ v.help.lines[-1].extra[2].click_event.url set from storage slimecore:data build.aux.pack_map.scdev.display.links.info

data modify storage scdev:_ v.help.lines append value {text:"--------------------", bold:false, color:aqua}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.help.lines
data modify storage scdev:_/in send.source set value "scdev:-/help"
function scdev:_/util/text/send/main