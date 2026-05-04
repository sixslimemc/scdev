#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_deps/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.invalid_dep set from storage scdev:_ t.error.this_entry.error.invalid_dependencies[-1]

data modify storage scdev:_ t.error.lines append value [{text:"", color:gray, extra:[]}]

execute if data storage scdev:_ t.error.invalid_dep.reason.invalid_download_url run data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - In key '"}, {text:"dependencies[", color:white}, {plain:true, storage:"scdev:_", nbt:"t.error.invalid_dep.index", color:white}, {text:"]", color:white}, {text:"': '"}, {text:"download.url", color:white}, {text:"' must contain a valid URL."}]}

execute if data storage scdev:_ t.error.invalid_dep.reason.invalid_download_version run data modify storage scdev:_ t.error.lines append value {text:"", color:gray, extra:[{text:"   - In key '"}, {text:"dependencies[", color:white}, {plain:true, storage:"scdev:_", nbt:"t.error.invalid_dep.index", color:white}, {text:"]", color:white}, {text:"': '"}, {text:"download.version", color:white}, {text:"' does not fulfull the version requirement specified by '"}, {text:"version", color:white}, {text:"'."}]}

data remove storage scdev:_ t.error.this_entry.error.invalid_dependencies[-1]
execute if data storage scdev:_ t.error.this_entry.error.invalid_dependencies[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_deps/each