#> scdev : format/dependency
# main
execute unless score *dependency.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.dependency.data set from storage scdev:in dependency.declaration

# get state:
# - set {..installed_ver_text}
# - set {..installed}
# - set *.state
# - set *.click_download
execute store result score *dependency.state _scdev run function scdev:_/impl/format/dependency/get_state with storage scdev:_ v.dependency.data
execute store success score *dependency.optional _scdev if data storage scdev:_ v.dependency.data{optional:true}
scoreboard players set *dependency.click_download _scdev 0
execute if score *dependency.state _scdev matches 0 run scoreboard players set *dependency.click_download _scdev 1
execute if score *dependency.state _scdev matches 3..4 run scoreboard players set *dependency.click_download _scdev 1

# *.state:
# 0 - not installed
# 1 - installed, enabled
# 2 - installed, disabled
# 3 - installed, wrong author
# 4 - installed, incompatible version

# set {..show_text}:
data modify storage scdev:_ v.dependency.show_text set value {text:"", color:gold, extra:[{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]}
data modify storage scdev:_ v.dependency.show_text.extra[0].text set from storage scdev:_ v.dependency.data.author_id
data modify storage scdev:_ v.dependency.show_text.extra[2].text set from storage scdev:_ v.dependency.data.pack_id
execute if score *dependency.state _scdev matches 0 run data modify storage scdev:_ v.dependency.show_text.color set value gold
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.show_text.color set value green
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.show_text.color set value yellow
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.show_text.color set value dark_red
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.show_text.color set value gold

# set {..version_text}:
data modify storage scdev:in version_req.value set from storage scdev:_ v.dependency.data.version
execute store success storage scdev:in version_req.use_this_entity byte 1 run scoreboard players get *dependency.use_self _scdev
function scdev:format/version_req
data modify storage scdev:_ v.dependency.version_text set from storage scdev:out version_req.result

# append version to {..show_text}:
data modify storage scdev:_ v.dependency.show_text.extra append from storage scdev:_ v.dependency.version_text

# optional '?':
execute if score *dependency.optional _scdev matches 1 run data modify storage scdev:_ v.dependency.show_text.extra prepend value {text:"?", color:dark_blue}

# set {..status_text}:
execute if score *dependency.state _scdev matches 0 run data modify storage scdev:_ v.dependency.status_text set value {text:"Not installed", color:red}
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.status_text set value {text:"", color:green, extra:[{text:"Version "}, {}, {text:" installed and enabled"}]}
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.status_text.extra[1] set from storage scdev:_ v.dependency.installed_ver_text
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.status_text set value {text:"", color:red, extra:[{text:"Version "}, {}, {text:" installed, but disabled"}]}
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.status_text.extra[1] set from storage scdev:_ v.dependency.installed_ver_text
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.status_text set value {text:"", color:dark_red, extra:[{text:"Pack ID conflicts with "}, {text:"PACK ID", color:yellow}, {text:".", color:yellow}, {text:"AUTHOR ID", color:yellow}, {text:"."}]}
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.status_text.extra[1] set from storage scdev:_ v.dependency.installed.author_id
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.status_text.extra[3] set from storage scdev:_ v.dependency.installed.pack_id
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.status_text set value {text:"", color:gold, extra:[{text:"Incompatible version installed ("}, {}, {text:")"}]}
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.status_text.extra[1] set from storage scdev:_ v.dependency.installed_ver_text

# set {..download_text}:
data modify storage scdev:_ v.dependency.download_text set value {text:"", color:blue, extra:[{text:"\nClick to download version "}, {}]}
data modify storage scdev:in version.value set from storage scdev:_ v.dependency.data.download.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify storage scdev:_ v.dependency.download_text.extra[1] set from storage scdev:out version.result

# set {..optional_text}:
data modify storage scdev:_ v.dependency.optional_text append value {text:"\n[?] Optional dependency", color:dark_blue}

# build {..hover_extra}:
data modify storage scdev:_ v.dependency.hover_extra set value []
data modify storage scdev:_ v.dependency.hover_extra append from storage scdev:_ v.dependency.show_text
data modify storage scdev:_ v.dependency.hover_extra append value "\n"
data modify storage scdev:_ v.dependency.hover_extra append from storage scdev:_ v.dependency.status_text
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.hover_extra append from storage scdev:_ v.dependency.download_text
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.hover_extra append value {text:"\n(Current version must be uninstalled)", color:dark_gray}
execute if score *dependency.optional _scdev matches 1 run data modify storage scdev:_ v.dependency.hover_extra append from storage scdev:_ v.dependency.optional_text

# set hover:
data modify storage scdev:_ v.dependency.show_text.hover_event set value {action:"show_text", value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ v.dependency.show_text.hover_event.value.extra set from storage scdev:_ v.dependency.hover_extra

# set click action:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:_ v.dependency.data.pack_id
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.dependency.click_pack set from storage scdev:_/out click_pack.result
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.show_text.click_event set value {action:"open_url", url:""}
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.show_text.click_event.url set from storage scdev:_ v.dependency.data.download.url
execute if score *dependency.click_download _scdev matches 0 run data modify storage scdev:_ v.dependency.show_text.click_event set from storage scdev:_ v.dependency.click_pack

# set out:
data modify entity @s text set from storage scdev:_ v.dependency.show_text
data modify storage scdev:out dependency.result set from entity @s text