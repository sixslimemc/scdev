#> scdev : format/dependency
# main
execute unless score *dependency.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.dependency.data set from storage scdev:in dependency.declaration

# get installed:
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.dependency.installed set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.dependency.data.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline

# store flags:
# also set {..installed_ver_text}
execute store result score *dependency.state _scdev run function scdev:_/impl/format/dependency/get_state
execute store success score *dependency.optional _scdev if data storage scdev:_ v.dependency.data{optional:true}
scoreboard players set *dependency.click_download _scdev 0
execute if score *dependency.state _scdev matches 0 run scoreboard players set *dependency.click_download _scdev 1
execute if score *dependency.state _scdev matches 3..4 run scoreboard players set *dependency.click_download _scdev 1

# title:
data modify storage scdev:_ v.dependency.c.id set value {text:"", extra:[{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]}
data modify storage scdev:_ v.dependency.c.id.extra[0].text set from storage scdev:_ v.dependency.data.author_id
data modify storage scdev:_ v.dependency.c.id.extra[2].text set from storage scdev:_ v.dependency.data.pack_id
execute if score *dependency.state _scdev matches 0 run data modify storage scdev:_ v.dependency.c.id.color set value gold
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.c.id.color set value green
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.c.id.color set value gold
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.c.id.color set value dark_red
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.c.id.color set value gold
data modify storage scdev:_ v.dependency.c.ver set value {text:"", color:dark_green, extra:[{storage:"scdev:_", nbt:"v.dependency.data.version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.dependency.data.version.minor", plain:true}]}
data modify storage scdev:_ v.dependency.show.title set value {text:"", extra:[{}, {text:"~", color:dark_green}, {}]}
data modify storage scdev:_ v.dependency.show.title.extra[0] set from storage scdev:_ v.dependency.c.id
data modify storage scdev:_ v.dependency.show.title.extra[2] set from storage scdev:_ v.dependency.c.ver

# optional '?':
execute if score *dependency.optional _scdev matches 1 run data modify storage scdev:_ v.dependency.show.title.extra prepend value {text:"?", color:dark_blue}

# status line:
execute if score *dependency.state _scdev matches 0 run data modify storage scdev:_ v.dependency.c.line_status set value {text:"Not installed", color:red}
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.c.line_status set value {text:"", color:green, extra:[{text:"Version "}, {}, {text:" installed and enabled."}]}
execute if score *dependency.state _scdev matches 1 run data modify storage scdev:_ v.dependency.c.line_status.extra[1] set from storage scdev:_ v.dependency.installed_ver_text
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.c.line_status set value {text:"", color:red, extra:[{text:"Version "}, {}, {text:" installed, but disabled."}]}
execute if score *dependency.state _scdev matches 2 run data modify storage scdev:_ v.dependency.c.line_status.extra[1] set from storage scdev:_ v.dependency.installed_ver_text
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.c.line_status set value {text:"", color:dark_red, extra:[{text:"Pack ID conflicts with "}, {text:"PACK ID", color:yellow}, {text:".", color:yellow}, {text:"AUTHOR ID", color:yellow}, {text:"."}]}
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.c.line_status.extra[1] set from storage scdev:_ v.dependency.installed.pack.author_id
execute if score *dependency.state _scdev matches 3 run data modify storage scdev:_ v.dependency.c.line_status.extra[3] set from storage scdev:_ v.dependency.installed.pack.pack_id
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.c.line_status set value {text:"", color:gold, extra:[{text:"Incompatible version installed ("}, {}, {text:")"}]}
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.c.line_status.extra[1] set from storage scdev:_ v.dependency.installed_ver_text

# download line:
data modify storage scdev:in version.value set from storage scdev:_ v.dependency.data.download.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify storage scdev:_ v.dependency.c.dversion set from storage scdev:out version.result
data modify storage scdev:_ v.dependency.c.line_download set value {text:"", extra:[{text:"Click to download version ", color:gray}, {}]}
data modify storage scdev:_ v.dependency.c.line_download[1] set from storage scdev:_ v.dependency.c.dversion

# optional line:
data modify storage scdev:_ v.dependency.c.line_optional append value {text:"[?] Optional dependency", color:dark_blue}

# build hover text:
data modify storage scdev:_ v.dependency.show.hover set value {text:"", extra:[]}
data modify storage scdev:_ v.dependency.show.hover.extra append from storage scdev:_ v.dependency.c.line_status
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.show.hover.extra append value {text:"\n"}
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.show.hover.extra append from storage scdev:_ v.dependency.c.line_download
execute if score *dependency.state _scdev matches 4 run data modify storage scdev:_ v.dependency.show.hover.extra append value {text:"\n(Current version must be uninstalled)", color:dark_gray}
execute if score *dependency.optional _scdev matches 1 run data modify storage scdev:_ v.dependency.show.hover.extra append value {text:"\n"}
execute if score *dependency.optional _scdev matches 1 run data modify storage scdev:_ v.dependency.show.hover.extra append from storage scdev:_ v.dependency.c.line_optional

# get click_pack action:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:_ v.dependency.data.pack_id
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.dependency.click_pack set from storage scdev:_/out click_pack.result

# set text:
data modify storage scdev:_ v.dependency.text set from storage scdev:_ v.dependency.show.title
data modify storage scdev:_ v.dependency.text.hover_event set value {action:"show_text", value:{}}
data modify storage scdev:_ v.dependency.text.hover_event.value set from storage scdev:_ v.dependency.show.hover
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.text.click_event set value {action:"open_url", url:""}
execute if score *dependency.click_download _scdev matches 1 run data modify storage scdev:_ v.dependency.text.click_event.url set from storage scdev:_ v.dependency.data.download.url
execute if score *dependency.click_download _scdev matches 0 run data modify storage scdev:_ v.dependency.text.click_event set from storage scdev:_ v.dependency.click_pack

# set out:
data modify entity @s text set from storage scdev:_ v.dependency.text
data modify storage scdev:out dependency.result set from entity @s text