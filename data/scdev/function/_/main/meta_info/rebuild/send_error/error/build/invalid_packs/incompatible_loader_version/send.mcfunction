#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/incompatible_loader_version/send
#--------------------
# ../each
#--------------------

data modify storage scdev:in version.value set from storage slimecore:data slimecore.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify storage scdev:_ t.error.sc_version_text set from storage scdev:out version.result

data modify storage scdev:in pack.pack set from storage scdev:_ t.error.this_entry.pack
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.pack_text set from storage scdev:out pack.result

# req text:
data modify entity @s text set value {text:"", color:dark_green, extra:[{text:"~"}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.loader_version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.loader_version.minor", plain:true}]}
data modify storage scdev:_ t.error.sc_req_text set from entity @s text

# error line:
data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - This pack requires SlimeCore"}, {}, {text:" in order to load.\n     (Currently installed SlimeCore version is "}, {}, {text:")"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.sc_req_text
data modify storage scdev:_ t.error.lines[-1].extra[3] set from storage scdev:_ t.error.sc_version_text

# hover text gen:
data modify entity @s text set value {text:"", color:gray, extra:[{text:"Usually fixed by installing a newer version of SlimeCore or an older version of "}, {storage:"scdev:_", nbt:"t.error.pack_text", interpret:true}, {text:"."}, {text:"\n"}, {text:"See "}, {text:"[Versions]", color:blue}, {text:" URL(s) from output of:"}, {text:"\n - "}, {text:"", color:dark_aqua, italic:true, extra:[{text:"/function scdev:-/info/slimecore"}]}, {text:"\n - "}, {text:"", color:dark_aqua, italic:true, extra:[{text:"/function scdev:-/info/pack {args:{pack_id:"}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.pack_id", plain:true}, {text:"}}"}]}]}
data modify storage scdev:_ t.error.hover_text set from entity @s text

# hover line:
data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"    "}, {text:"(Hover for more info)", color:gray, italic:true, hover_event:{action:show_text, value:{}}}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].hover_event.value set from storage scdev:_ t.error.hover_text