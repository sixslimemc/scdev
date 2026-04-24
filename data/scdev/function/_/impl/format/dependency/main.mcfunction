#> scdev : format/dependency
# main
execute unless score *dependency.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.dependency.data set from storage scdev:in dependency.declaration
# title:
data modify storage scdev:_ v.dependency.c.id set value {text:"", color:gold, extra:[{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]}
data modify storage scdev:_ v.dependency.c.id.extra[0].text set from storage scdev:_ v.dependency.data.author_id
data modify storage scdev:_ v.dependency.c.id.extra[2].text set from storage scdev:_ v.dependency.data.pack_id
data modify storage scdev:_ v.dependency.c.ver set value {text:"", color:dark_green, extra:[{storage:"scdev:_", nbt:"v.dependency.data.version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.dependency.data.version.minor", plain:true}]}
data modify storage scdev:_ v.dependency.show.title set value {text:"", extra:[{}, {text:"~", color:dark_green}, {}]}
data modify storage scdev:_ v.dependency.show.title.extra[0] set from storage scdev:_ v.dependency.c.id
data modify storage scdev:_ v.dependency.show.title.extra[2] set from storage scdev:_ v.dependency.c.ver

# hover:
data modify storage scdev:_ v.dependency.c.dversion set value {text:"", color:dark_green, extra:[{storage:"scdev:_", nbt:"v.dependency.data.download.version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.dependency.data.download.version.minor", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.dependency.data.download.version.patch", plain:true}]}
data modify storage scdev:_ v.dependency.show.hover set value {text:"", extra:[{text:"Click to download version ", color:gray}, {}]}
data modify storage scdev:_ v.dependency.show.hover.extra[1] set from storage scdev:_ v.dependency.c.dversion

# set text:
data modify storage scdev:_ v.dependency.text set from storage scdev:_ v.dependency.show.title
data modify storage scdev:_ v.dependency.text.hover_event set value {action:"show_text", value:{}}
data modify storage scdev:_ v.dependency.text.hover_event.value set from storage scdev:_ v.dependency.show.hover
data modify storage scdev:_ v.dependency.text.click_event set value {action:"open_url", url:""}
data modify storage scdev:_ v.dependency.text.click_event.url set from storage scdev:_ v.dependency.data.download.url

# set out:
data modify entity @s text set from storage scdev:_ v.dependency.text
data modify storage scdev:out dependency.result set from entity @s text