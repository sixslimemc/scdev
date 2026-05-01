#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

# format dependency text:
data modify storage scdev:in dependency.declaration set from storage scdev:_ t.error.this_entry.dependency
data modify storage scdev:in dependency.use_this_entity set value true
function scdev:format/dependency
data modify storage scdev:_ t.error.dependency_text set from storage scdev:out dependency.result

# format from text:
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:in pack.pack set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'.pack"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ t.error.this_entry.from
function scdev:_/util/mline/3 with storage scdev:_ x.mline
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.from_text set from storage scdev:out pack.result

# line:
data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text: " - "}, {}, {text: " required by "}, {}, {text: "."}]}
data modify storage scdev:_ t.error.lines[-1].extra[1] set from storage scdev:_ t.error.dependency_text
data modify storage scdev:_ t.error.lines[-1].extra[3] set from storage scdev:_ t.error.from_text

# not present:
execute if data storage scdev:_ t.error.this_entry.reason.not_present run data modify storage scdev:_ t.error.lines append value {text:"   (Dependency would not be present in build) ", color:gray, italic:true}

# author mismatch:
execute if data storage scdev:_ t.error.this_entry.reason.author_mismatch run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/author_mismatch

# incompatible version:
execute if data storage scdev:_ t.error.this_entry.reason.incompatible_version run data modify storage scdev:_ t.error.lines append value {text:"   (Installed pack does not fulfill version requirement) ", color:gray, italic:true}

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/each