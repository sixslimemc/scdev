# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:dark_gray, italic:true}
data modify storage scdev:_ v.reference.lines append value {text:"└ ", color:gray, extra:[{text:"data", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"  ├ ", color:gray, extra:[{text:"slimecore/tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"  │ └ ", color:gray, extra:[{text:"manifest.json", color:dark_aqua, bold:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"  └ ", color:gray, extra:[{text:"<pack_id>", color:dark_aqua, italic:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"     └ ", color:gray, extra:[{text:"tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"entrypoint", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"<id>", color:gold, italic:true, bold:true}, {text:".json", color:gold, italic:false, bold:true}, {text:" (...)", color:dark_gray, bold:false}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"preload_entrypoint", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"<id>", color:dark_purple, italic:true, bold:true}, {text:".json", color:dark_purple, italic:false, bold:true}, {text:" (...)", color:dark_gray, bold:false}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"disable.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:disable", italic:true, color:aqua}, {text:"\n"}, {text:"Called just before the pack is disabled. Dependencies will never be disabled before their dependants.\nA pack should attempt to safely \"sleep\" it's content, keeping in mind that it may be re-enabled OR uninstalled in the future."}, {text:"\n(#<pack id>:disable is not always called before uninstallation, only when explicitly disabled.)", italic:true}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"load.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:load", italic:true, color:aqua}, {text:"\n"}, {text:"Called on world reload, similarly to legacy #minecraft:load. Dependencies are always loaded before their dependants.\nA pack should initialize itself, but should "}, {text:"NOT", color:red, bold:true}, {text:" start any schedule loops or do any work that is unrelated to initialization."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"safe_mode.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:safe_mode", italic:true, color:aqua}, {text:"\n"}, {text:"Called instead of #<pack id>:load if there is another pack with an identical pack ID installed and enabled.\nA pack should attempt to immediately but safely stop \"in-place\" and avoid function calls until #<pack id>:load is called again."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        └ ", color:gray, extra:[{text:"uninstall.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:uninstall", italic:true, color:aqua}, {text:"\n"}, {text:"Called when the pack is uninstalled by SlimeCore--assumedly before the user removes the datapack from the world.\nA pack should attempt to erase all traces of itself when this tag is called, including (but not limited to) storage NBT, scoreboards, and entities."}]}}}]}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main