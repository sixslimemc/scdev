#> scdev :-/ info/pack
# main
kill @s

data remove storage scdev:_ v.packinfo.entry
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.packinfo.entry set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.packinfo.args.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline

# SlimeCore itself special handling:
execute if data storage scdev:_ v.packinfo.args{pack_id:'slimecore'} run data modify storage scdev:_ v.packinfo.entry set value {pack:{}, disabled:false, path:""}
execute if data storage scdev:_ v.packinfo.args{pack_id:'slimecore'} run data modify storage scdev:_ v.packinfo.entry.pack set from storage slimecore:data slimecore

execute unless data storage scdev:_ v.packinfo.entry run return run function scdev:_/impl/-/info/pack/not_installed
execute store success score *packinfo.disabled _scdev if data storage scdev:_ v.packinfo.entry{disabled:true}
execute store success score *packinfo.library _scdev if data storage scdev:_ v.packinfo.entry.pack{is_library:true}

data modify storage scdev:_ v.packinfo.lines set value []

# data modify storage scdev:_ v.packinfo.lines append value {text:"--------------------", bold:true, color:white}


# Header:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.packinfo.entry.pack.pack_id
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify entity @s text set value [{text:"--[ ", color:"white", bold:false}, {interpret:true, storage:"scdev:out", nbt:"pack.result"}, {text:" ]------", color:"white", bold:false}]
data modify storage scdev:_ v.packinfo.lines append from entity @s text

# world info header
# data modify storage scdev:_ v.packinfo.lines append value {text:"Datapack:", color:white}

# Pack ID:
data modify storage scdev:_ v.packinfo.lines append value [{text:"Pack ID: ", color:"white"}, {text:"PACK ID", color:yellow}]
data modify storage scdev:_ v.packinfo.lines[-1][1].text set from storage scdev:_ v.packinfo.entry.pack.pack_id

# Author ID:
data modify storage scdev:_ v.packinfo.lines append value [{text:"Author ID: ", color:"white"}, {text:"AUTHOR ID", color:yellow}]
data modify storage scdev:_ v.packinfo.lines[-1][1].text set from storage scdev:_ v.packinfo.entry.pack.author_id

# version:
data modify storage scdev:in version.value set from storage scdev:_ v.packinfo.entry.pack.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify entity @s text set value [{text:"Version: ", color:"white"}, {interpret:true, storage:"scdev:out", nbt:"version.result"}]
data modify storage scdev:_ v.packinfo.lines append from entity @s text

# path:
data remove storage scdev:_ v.packinfo.path
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.packinfo.path set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'.path"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.packinfo.entry.pack.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
data modify storage scdev:_ v.packinfo.lines append value [{text:"Path: ", color:white, italic:true}]
execute if data storage scdev:_ v.packinfo.path run data modify entity @s text set value {storage:"scdev:_", nbt:"v.packinfo.path", plain:true, color:yellow}
execute if data storage scdev:_ v.packinfo.path run data modify storage scdev:_ v.packinfo.lines[-1] append from entity @s text
execute unless data storage scdev:_ v.packinfo.path run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"(untracked)", color:dark_gray, italic:true}

# enabled status:
data modify storage scdev:_ v.packinfo.lines append value [{text:"Status: ", color:white, italic:true}]
execute if score *packinfo.disabled _scdev matches 0 run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"Enabled", color:green}
execute if score *packinfo.disabled _scdev matches 1 run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"Disabled", color:red}

# is library:
data modify storage scdev:_ x.line set value [{text:"Library: ", color:white}]
execute if score *packinfo.library _scdev matches 1 run data modify storage scdev:_ x.line append value {text:"Yes", color:dark_aqua}
execute if score *packinfo.library _scdev matches 0 run data modify storage scdev:_ x.line append value {text:"No", color:aqua}
data modify storage scdev:_ v.packinfo.lines append from storage scdev:_ x.line

# dependencies:
data modify storage scdev:_ v.packinfo.dependencies set from storage scdev:_ v.packinfo.entry.pack.dependencies
data modify storage scdev:_ v.packinfo.lines append value [{text:"Dependencies:", color:white}]
execute unless data storage scdev:_ v.packinfo.dependencies[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.dependencies[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.dependencies[0] run function scdev:_/impl/-/info/pack/each_dependency

# dependents:
data modify storage scdev:_ v.packinfo.dependents set value []
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.packinfo.dependents append from storage slimecore:data world.installed[{pack:{dependencies:[{pack_id:'", 2:true, 3:"', author_id:'", 4:true, 5:"'}]}}].pack.pack_id"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.packinfo.entry.pack.pack_id
data modify storage scdev:_ x.mline.4 set from storage scdev:_ v.packinfo.entry.pack.author_id
function scdev:_/util/mline/5 with storage scdev:_ x.mline
data modify storage scdev:_ v.packinfo.lines append value [{text:"Dependents:", color:white}]
execute unless data storage scdev:_ v.packinfo.dependents[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.dependents[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.dependents[0] run function scdev:_/impl/-/info/pack/each_dependent

# preload entrypoints:
data modify storage scdev:_ v.packinfo.preloads set from storage scdev:_ v.packinfo.entry.pack.preload_entrypoints
data modify storage scdev:_ v.packinfo.lines append value [{text:"Preload Entrypoints:", color:white}]
execute unless data storage scdev:_ v.packinfo.preloads[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.preloads[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.preloads[0] run function scdev:_/impl/-/info/pack/each_preload

# entrypoints:
data modify storage scdev:_ v.packinfo.entrypoints set from storage scdev:_ v.packinfo.entry.pack.entrypoints
data modify storage scdev:_ v.packinfo.lines append value [{text:"Entrypoints:", color:white}]
execute unless data storage scdev:_ v.packinfo.entrypoints[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.entrypoints[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.entrypoints[0] run function scdev:_/impl/-/info/pack/each_entrypoint

# abstract interfaces:
data modify storage scdev:_ v.packinfo.interfaces set from storage scdev:_ v.packinfo.entry.pack.abstract_declarations
data modify storage scdev:_ v.packinfo.lines append value [{text:"Abs. Declarations:", color:white}]
execute unless data storage scdev:_ v.packinfo.interfaces[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.interfaces[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.interfaces[0] run function scdev:_/impl/-/info/pack/each_abstract

# abstract implementations:
data modify storage scdev:_ v.packinfo.implements set from storage scdev:_ v.packinfo.entry.pack.abstract_implementations
data modify storage scdev:_ v.packinfo.lines append value [{text:"Abs. Implementations:", color:white}]
execute unless data storage scdev:_ v.packinfo.implements[0] run data modify storage scdev:_ v.packinfo.lines[-1][0] merge value {strikethrough:false, color:gray, italic:false}
execute unless data storage scdev:_ v.packinfo.implements[0] run data modify storage scdev:_ v.packinfo.lines[-1] append value {text:"~", color:dark_gray, italic:false}
execute if data storage scdev:_ v.packinfo.implements[0] run function scdev:_/impl/-/info/pack/each_implement

# display:
data modify storage scdev:_ v.packinfo.lines append value {text:"Display Info:", color:white}

data modify storage scdev:_ v.packinfo.lines append value [{text:" ", color:gray}, {text:"NAME", color:"#bbbbbb", bold:true}]
data modify storage scdev:_ v.packinfo.lines[-1][1].text set from storage scdev:_ v.packinfo.entry.pack.display.name

data modify storage scdev:_ v.packinfo.lines append value [{text:" ", color:gray}, {text:"DESC", color:"#bbbbbb"}]
data modify storage scdev:_ v.packinfo.lines[-1][1].text set from storage scdev:_ v.packinfo.entry.pack.display.summary

data modify storage scdev:_ v.packinfo.lines append value [{text:" ", color:gray}, {text:"AUTHOR", color:"#bbbbbb", italic:true}]
data modify storage scdev:_ v.packinfo.lines[-1][1].text set from storage scdev:_ v.packinfo.entry.pack.display.author_name

# loader version:
data modify storage scdev:in version_req.value set from storage scdev:_ v.packinfo.entry.pack.loader_version
data modify storage scdev:in version_req.use_this_entity set value true
function scdev:format/version_req
data modify entity @s text set value [{text:"Loader Version: ", color:"white"}, {interpret:true, storage:"scdev:out", nbt:"version_req.result"}]
data modify storage scdev:_ v.packinfo.lines append from entity @s text

# links:
data modify storage scdev:_ v.packinfo.lines append value [{text:"URLs: ", color:white}, {text:"[Info]"}, {text:"  "}, {text:"[Author]"}, {text:"  "}, {text:"[Versions]"}, {text:"  "}, {text:"[Download]"}]

# info:
execute unless data storage scdev:_ v.packinfo.entry.pack.display.links.info run data modify storage scdev:_ v.packinfo.lines[-1][1] merge value {color:dark_red, hover_event:{action:"show_text", value:{text:"No info link provided", color:red}}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.info run data modify storage scdev:_ v.packinfo.lines[-1][1] merge value {underlined:true, color:blue, hover_event:{action:"show_text", value:[{text:"Click to open URL", color:gray}]}, click_event:{action:"open_url", url:"URL"}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.info run data modify storage scdev:_ v.packinfo.lines[-1][1].click_event.url set from storage scdev:_ v.packinfo.entry.pack.display.links.info

# author:
execute unless data storage scdev:_ v.packinfo.entry.pack.display.links.author run data modify storage scdev:_ v.packinfo.lines[-1][3] merge value {color:dark_red, hover_event:{action:"show_text", value:{text:"No author link provided", color:red}}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.author run data modify storage scdev:_ v.packinfo.lines[-1][3] merge value {underlined:true, color:blue, hover_event:{action:"show_text", value:[{text:"Click to open URL", color:gray}]}, click_event:{action:"open_url", url:"URL"}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.author run data modify storage scdev:_ v.packinfo.lines[-1][3].click_event.url set from storage scdev:_ v.packinfo.entry.pack.display.links.author

# versions:
execute unless data storage scdev:_ v.packinfo.entry.pack.display.links.versions run data modify storage scdev:_ v.packinfo.lines[-1][5] merge value {color:dark_red, hover_event:{action:"show_text", value:{text:"No versions link provided", color:red}}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.versions run data modify storage scdev:_ v.packinfo.lines[-1][5] merge value {underlined:true, color:blue, hover_event:{action:"show_text", value:[{text:"Click to open URL", color:gray}]}, click_event:{action:"open_url", url:"URL"}}
execute if data storage scdev:_ v.packinfo.entry.pack.display.links.versions run data modify storage scdev:_ v.packinfo.lines[-1][5].click_event.url set from storage scdev:_ v.packinfo.entry.pack.display.links.versions

# download:
data modify storage scdev:_ v.packinfo.lines[-1][7] merge value {underlined:true, color:blue, hover_event:{action:"show_text", value:[{text:"Click to open URL", color:gray}]}, click_event:{action:"open_url", url:"URL"}}
data modify storage scdev:_ v.packinfo.lines[-1][7].click_event.url set from storage scdev:_ v.packinfo.entry.pack.url

data modify storage scdev:_ v.packinfo.lines append value {text:"--------------------", bold:false, color:white}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ v.packinfo.lines
data modify storage scdev:_/in send.source set value "scdev:-/info/pack"
execute as @n[tag=_scdev.info_runner] run function scdev:_/util/text/send/main
