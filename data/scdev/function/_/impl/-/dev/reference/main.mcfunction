# IMPL > scdev :-/ reference
# main

# │ ├ └ ─

data modify storage scdev:_ v.reference.lines set value []

data modify storage scdev:_ v.reference.lines append value {text:"<datapack>", color:dark_gray, italic:true}
data modify storage scdev:_ v.reference.lines append value {text:"└ ", color:gray, extra:[{text:"data", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"  ├ ", color:gray, extra:[{text:"slimecore/tags/function", color:white}]}

# '#slimecore:manifest'
data modify storage scdev:_ v.reference.lines append value {text:"  │ └ ", color:gray, extra:[{text:"manifest.json", color:dark_aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#slimecore:manifest", italic:true, color:dark_aqua}, {text:"\n"}, {text:"Append the pack's manifest function to this tag.\n- The pack must call 'slimecore:api/manifest' exactly once within the scope of this tag."}]}}}]}

data modify storage scdev:_ v.reference.lines append value {text:"  └ ", color:gray, extra:[{text:"<pack_id>", color:dark_aqua, italic:true}]}
data modify storage scdev:_ v.reference.lines append value {text:"     └ ", color:gray, extra:[{text:"tags/function", color:white}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"entrypoint", color:white}]}

# '#<pack id>:entrypoint/<id>':
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"", extra:[{text:"<id>", color:gold, italic:true, bold:true}, {text:".json", color:gold, italic:false, bold:true}], hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:entrypoint/<id>", italic:true, color:gold}, {text:"\n"}, {text:"- One tag per entrypoint declared by the manifest, with tag names matching entrypoint ids.\nCalled after all packs' load tags are called, and in the same order declared by the manifest.\n- Where standard non-initialization work and tick/schedule loops should be started."}]}}}, {text:" (...)", color:dark_gray, bold:false, hover_event:{action:"show_text", value:{text:"", color:dark_gray, extra:[{text:"One tag per entrypoint declared by the manifest, with tag names matching entrypoint ids."}]}}}]}
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"preload_entrypoint", color:white}]}

# '#<pack id>:preload_entrypoint/<id>':
data modify storage scdev:_ v.reference.lines append value {text:"        │ └ ", color:gray, extra:[{text:"", extra:[{text:"<id>", color:dark_purple, italic:true, bold:true}, {text:".json", color:dark_purple, italic:false, bold:true}], hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:preload_entrypoint/<id>", italic:true, color:dark_purple}, {text:"\n"}, {text:"Like entrypoints, but called just *before* load tags are called (including this pack's load tag).\n- Avoid use without very good reason (e.g. very technical or meta work)."}]}}}, {text:" (...)", color:dark_gray, bold:false, hover_event:{action:"show_text", value:{text:"", color:dark_gray, extra:[{text:"One tag per preload entrypoint declared by the manifest, with tag names matching preload entrypoint ids."}]}}}]}

# '#<pack_id>:load':
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"load.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:load", italic:true, color:aqua}, {text:"\n"}, {text:"Called when the pack is loaded (conceptually similar to #minecraft:load).\n- The pack should do strict inititialization work (declare scoreboards, initialize data, etc.), but do all other work (start tick/schedule loops, independent processes, etc.) in entrypoints.\n- Dependencies are always loaded before their their dependents."}]}}}]}

# '#<pack_id>:disable':
data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"disable.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:disable", italic:true, color:aqua}, {text:"\n"}, {text:"Called just before the pack is disabled.\n- The pack should gracefully stop itself with the assumption that it may be re-enabled in the future.\n- Garunteed to be called at some point before the pack is uninstalled.\n- Dependents are always disabled before their dependencies."}]}}}]}

# '#<pack_id:uninstall':
data modify storage scdev:_ v.reference.lines append value {text:"        └ ", color:gray, extra:[{text:"uninstall.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:uninstall", italic:true, color:aqua}, {text:"\n"}, {text:"Called just before the pack is uninstalled.\n- The pack should cleanly and permanently remove it's presence from the world.\n- Dependents will always be uninstalled before their dependencies."}]}}}]}

data modify storage scdev:_ v.reference.lines append value {text:"        ├ ", color:gray, extra:[{text:"safe_mode.json", color:aqua, bold:true, hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#<pack id>:safe_mode", italic:true, color:aqua}, {text:"\n"}, {text:"Called instead of the \"load\" tag if safe mode is enabled.\n- The pack should cleanly cease as much operation as possible, only resuming operation when it's \"load\" tag is called again."}]}}}]}

data modify storage scdev:_ v.reference.lines append value {text:""}
data modify storage scdev:_ v.reference.lines append value {text:"[SlimeCore Info URL]", color:blue, underlined:true, hover_event:{action:"show_text", value:{text:"Click to open URL", color:gray}}, click_event:{action:"open_url", url:""}}
data modify storage scdev:_ v.reference.lines[-1].click_event.url set from storage slimecore:data slimecore.display.links.info

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.reference.lines
data modify storage scdev:_/in send.source set value "scdev:-/dev/reference"
function scdev:_/util/text/send/main