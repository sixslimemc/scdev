#> scdev :_/util/ format/dependency
#--------------------
# -> dependency: slimecore::Dependency
#--------------------
# <- result: Text
#--------------------
# 
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out dependency set value {}

# title:
data modify storage scdev:_ u.dependency.c.id set value {text:"", color:yellow, extra:[{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]}
data modify storage scdev:_ u.dependency.c.id.extra[0].text set from storage scdev:_ u.dependency.data.author_id
data modify storage scdev:_ u.dependency.c.id.extra[2].text set from storage scdev:_ u.dependency.data.dependency_id
data modify storage scdev:_ u.dependency.c.ver set value {text:"", color:dark_green, extra:[{text:"MAJOR"}, {text:"."}, {text:"MINOR"}]}
data modify storage scdev:_ u.dependency.c.ver.extra[0].text set from storage scdev:_ u.dependency.data.version.major
data modify storage scdev:_ u.dependency.c.ver.extra[2].text set from storage scdev:_ u.dependency.data.version.minor
data modify storage scdev:_ u.dependency.show.title set value {text:"", extra:[{}, {text:"~",color:gray}, {}]}
data modify storage scdev:_ u.dependency.show.title.extra[0] set from storage scdev:_ u.dependency.c.id
data modify storage scdev:_ u.dependency.show.title.extra[2] set from storage scdev:_ u.dependency.c.ver

# hover:
data modify storage scdev:_ u.dependency.c.dversion set value {text:"", color:dark_green, extra:[{storage:"scdev:_/in", nbt:"dependency.dependency.download.version.major"}, {text:"."}, {storage:"scdev:_/in", nbt:"dependency.dependency.download.version.minor"}, {text:"."}, {storage:"scdev:_/in", nbt:"dependency.dependency.download.version.patch"}]}
data modify storage scdev:_ u.dependency.show.hover set value {text:"", extra:[{text:"Click to download version ", color:gray}, {}]}
data modify storage scdev:_ u.dependency.show.hover.extra[1] set from storage scdev:_ u.dependency.c.dversion

# set text:
data modify storage scdev:_ u.dependency.text set from storage scdev:_ u.dependency.show.title
data modify storage scdev:_ u.dependency.text.hover_event set value {action:"show_text", value:{}}
data modify storage scdev:_ u.dependency.text.hover_event.value set from storage scdev:_ u.dependency.show.hover
data modify storage scdev:_ u.dependency.text.click_event set value {action:"open_url", url:""}
data modify storage scdev:_ u.dependency.text.click_event.url set from storage scdev:_/in dependency.dependency.download.url

# set out:
data modify entity @s text set from storage scdev:_ u.dependency.text
data modify storage scdev:_/out dependency.result set from entity @s text

execute if data storage scdev:_/in dependency{kill:true} run kill @s

data remove storage scdev:_ u.dependency
data remove storage scdev:_/in dependency

return 1