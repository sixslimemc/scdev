#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

# get {..pack_text}:
data modify storage scdev:in pack.pack set from storage scdev:_ t.error.this_entry.pack
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.pack_text set from storage scdev:out pack.result

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - No datapack path found for "}, {}, {text:"."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.pack_text

execute if data storage scdev:_ t.error.this_entry.path_override run data modify storage scdev:_ t.error.lines append value {text:"", color:gray, italic:true, extra:[{text:"   Expected exact path "}, {plain:true, storage:"scdev:_", nbt:"t.error.this_entry.path_override", color:white}, {text:" due to path override."}], hover_event:{action:'show_text', value:{text:"", color:gray, italic:false, extra:[{text:"", color:dark_aqua, extra:[{text:"{path_overrides:{"}, {storage:"scdev:_", nbt:"t.error.this_entry.pack.pack_id", plain:true}, {text:":"}, {plain:true, storage:"scdev:_", nbt:"t.error.this_entry.path_override"}, {text:"}}"}]}, {text:" in "}, {text:"slimecore:config", color:yellow}, {text:""}]}}}

execute unless data storage scdev:_ t.error.this_entry.path_override run data modify storage scdev:_ t.error.lines append value {text:"   Expected a standard datapack path.", color:gray, italic:true}

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/safe_mode_activated/misloaded_datapacks_missing_path/each