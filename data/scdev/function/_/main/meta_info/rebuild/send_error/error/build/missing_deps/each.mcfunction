#> scdev:_/main/meta_info/rebuild/send_error/error/missing_deps/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

# format dependency text:
data modify storage scdev:in dependency.declaration set from storage scdev:_ t.error.entry.dependency
data modify storage scdev:in dependency.use_this_entity set value true
function scdev:format/dependency
data modify storage scdev:_ t.error.dependency_text set from storage scdev:out dependency.result

# format from text:
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:in pack.pack set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'.pack"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ t.error.entry.from
function scdev:_/util/mline/3 with storage scdev:_ x.mline
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.error.from_text set from storage scdev:out pack.result

tellraw @a[tag=scdev.listener] [{text: " - ", color:red}, {interpret:true, storage:"scdev:_", nbt:"t.error.dependency_text"}, {text: " required by ", color:red}, {interpret:true, storage:"scdev:_", nbt:"t.error.from_text"}, {text: ".", color:red}]

# not present:
execute if data storage scdev:_ t.error.entry.reason.not_present run tellraw @a[tag=scdev.listener] [{text:"  (Pack would not be present in build) ", color:red}]

# author mismatch:
execute if data storage scdev:_ t.error.entry.reason.author_mismatch run tellraw @a[tag=scdev.listener] [{text:"  (A pack with an identical pack ID, ", color:"red"}, {storage:"scdev:_", nbt:"t.error.entry.reason.author_mismatch.got", color: dark_aqua}, {text:".", color:"dark_aqua"}, {storage:"scdev:_", nbt:"t.error.entry.dependency.pack_id", color: dark_aqua}, {text:" is enabled, it must be uninstalled/disabled)", color:"red"}]

# incompatible version:
execute if data storage scdev:_ t.error.entry.reason.incompatible_version run tellraw @a[tag=scdev.listener] [{text:"  (Currently installed pack does not fulfill the version requirement) ", color:red}]

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/each