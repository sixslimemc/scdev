# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:dark_gray, italic:true}
data modify storage scdev:_ v.reference.lines append value {text:"└ ", color:gray, extra:[{text:"data", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"  ├ ", color:gray, extra:[{text:"slimecore/tags/function", color:white}]}

# '#slimecore:manifest'
data modify storage scdev:_ v.reference.lines append value {text:"  │ └ ", color:gray, extra:[{text:"manifest.json", color:dark_aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#slimecore:manifest", italic:true, color:dark_aqua}, {text:"\n"}, {text:"- Append your pack's manifest function to this tag.\n- Your pack must call 'slimecore:api/manifest' exactly once within the scope of this tag."}]}}}]}

data modify storage scdev:_ v.reference.lines append value {text:"  └ ", color:gray, extra:[{text:"<pack_id>", color:dark_aqua, italic:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"     └ ", color:gray, extra:[{text:"tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"entrypoint", color:white}]}

# '#<pack id>:entrypoint/<id>'
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"", extra:[{text:"<id>", color:gold, italic:true, bold:true}, {text:".json", color:gold, italic:false, bold:true}], hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:entrypoint/<id>", italic:true, color:gold}, {text:"\n"}, {text:"- One tag per entrypoint declared by your manifest, with tag names matching entrypoint ids.\n- Called after all packs' load tags are called, and in the same order declared by your manifest.\n- Where standard non-initialization work and tick/schedule loops should be started."}]}}}, {text:" (...)", color:dark_gray, bold:false, hover_event:{action:"show_text", value:{text:"", color:dark_gray, extra:[{text:"One tag per entrypoint declared in your pack's manifest (tag name must match the 'id')."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"preload_entrypoint", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"", extra:[{text:"<id>", color:dark_purple, italic:true, bold:true}, {text:".json", color:dark_purple, italic:false, bold:true}], hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:preload_entrypoint/<id>", italic:true, color:dark_purple}, {text:"\n"}, {text:"Like entrypoints, but called *before* any packs (including itself) are loaded.\nA pack generally should only define preload entrypoints for meta/technical systems and should work with the assumption that no other packs are usable within the scope of preload entrypoints (unless explicitly indicated otherwise)."}]}}}, {text:" (...)", color:dark_gray, bold:false, hover_event:{action:"show_text", value:{text:"", color:dark_gray, extra:[{text:"One file per element in 'preload_entrypoints' in the pack manifest."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"disable.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:disable", italic:true, color:aqua}, {text:"\n"}, {text:"Called just before the pack is (explicitly) disabled. Dependencies will never be disabled before their dependants.\nA pack should attempt to safely \"sleep\" it's content, keeping in mind that it may be re-enabled OR uninstalled in the future."}, {text:"\nThis tag is not garunteed to be called before uninstallation, it is only called when the pack is explicitly disabled.", italic:true}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"load.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:load", italic:true, color:aqua}, {text:"\n"}, {text:"Called on world reload, similarly to legacy #minecraft:load. Dependencies are always loaded before their dependants.\nA pack should initialize itself, but should "}, {text:"NOT", color:red, bold:true}, {text:" start any schedule loops or do any work that is unrelated to initialization."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"safe_mode.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:safe_mode", italic:true, color:aqua}, {text:"\n"}, {text:"Called instead of #<pack id>:load if there is another pack with an identical pack ID installed and enabled.\nA pack should attempt to immediately but safely stop \"in-place\" and avoid function calls until #<pack id>:load is called again."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        └ ", color:gray, extra:[{text:"uninstall.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:uninstall", italic:true, color:aqua}, {text:"\n"}, {text:"Called when the pack is uninstalled by SlimeCore--assumedly before the user removes the datapack from the world. Dependencies will never be uninstalled before their dependents.\nA pack should attempt to erase all traces of itself when this tag is called, including (but not limited to) storage NBT, scoreboards, and entities."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:""}
data modify storage scdev:_ v.reference.lines append value {text:"[SlimeCore Info URL]", color:blue, underlined:true, hover_event:{action:"show_text", value:{text:"Click to open URL", color:gray}}, click_event:{action:"open_url", url:""}}
data modify storage scdev:_ v.reference.lines[-1].click_event.url set from storage slimecore:data slimecore.display.links.info

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main