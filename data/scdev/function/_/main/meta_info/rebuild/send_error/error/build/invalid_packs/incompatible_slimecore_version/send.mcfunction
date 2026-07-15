#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/incompatible_slimecore_version/send
#--------------------
# ../each
#--------------------

data modify storage scdev:in version.value set from storage slimecore:data slimecore.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify storage scdev:_ t.error.sc_version_text set from storage scdev:out version.result

data modify entity @s text set value {text:"", color:dark_green, extra:[{text:"~"}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.slimecore_version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.slimecore_version.minor", plain:true}]}
data modify storage scdev:_ t.error.sc_req_text set from entity @s text

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:"   - The current version of SlimeCore is incompatible with this pack ("}, {}, {text:" required, "}, {}, {text:" installed)."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.sc_req_text
data modify storage scdev:_ t.error.lines[-1].extra[3] set from storage scdev:_ t.error.sc_version_text