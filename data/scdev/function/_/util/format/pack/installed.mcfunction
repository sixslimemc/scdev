# UTIL > six:_/util/format/pack
# installed
#--------------------
# ./main
#--------------------

# title:
data modify storage scdev:_ u.pack.c.id set value [{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]
data modify storage scdev:_ u.pack.c.id[0].text set from storage scdev:_ u.pack.data.author_id
data modify storage scdev:_ u.pack.c.id[2].text set from storage scdev:_ u.pack.data.pack_id
data modify storage scdev:_ u.pack.show.title set value {text:"", color:aqua, extra:[]}
data modify storage scdev:_ u.pack.show.title.extra set from storage scdev:_ u.pack.c.id
execute if data storage scdev:_ u.pack.data{is_library:true} run data modify storage scdev:_ u.pack.show.title.color set value dark_aqua

# hover line 1:
data modify storage scdev:_ u.pack.c.line1 set value {text:"", extra:[{text:"DISPLAY NAME", color:aqua}, {text:" "}, {text:"", color:dark_green, extra:[]}]}
data modify storage scdev:_ u.pack.c.line1.extra.[0].text set from storage scdev:_ u.pack.data.display.name
execute if data storage scdev:_ u.pack.data{is_library:true} run data modify storage scdev:_ u.pack.c.line1.extra[0].color set value dark_aqua
data modify storage scdev:_ u.pack.c.line1.extra[2].extra set value [{storage:"scdev:_", nbt:"u.pack.data.version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"u.pack.data.version.minor", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"u.pack.data.version.patch", plain:true}]

# hover line 2:
data modify storage scdev:_ u.pack.c.line2 set value {text:"SUMMARY", color:gray}
data modify storage scdev:_ u.pack.c.line2.text set from storage scdev:_ u.pack.data.display.summary

# hover line 3:
data modify storage scdev:_ u.pack.c.line3 set value {text:"AUTHOR NAME", color:blue}
data modify storage scdev:_ u.pack.c.line3.text set from storage scdev:_ u.pack.data.display.author_name

# hover lib line:
data modify storage scdev:_ u.pack.c.libline set value {text:"(Library)", color:dark_gray}

# construct hover:
data modify storage scdev:_ u.pack.show.hover set value {text:"", extra:[]}
data modify storage scdev:_ u.pack.show.hover.extra append from storage scdev:_ u.pack.c.line1
data modify storage scdev:_ u.pack.show.hover.extra append value {text:"\n"}
data modify storage scdev:_ u.pack.show.hover.extra append from storage scdev:_ u.pack.c.line2
execute if data storage scdev:_ u.pack.data{is_library:true} run data modify storage scdev:_ u.pack.show.hover.extra append value {text:"\n"}
execute if data storage scdev:_ u.pack.data{is_library:true} run data modify storage scdev:_ u.pack.show.hover.extra append from storage scdev:_ u.pack.c.libline
data modify storage scdev:_ u.pack.show.hover.extra append value {text:"\n"}
data modify storage scdev:_ u.pack.show.hover.extra append from storage scdev:_ u.pack.c.line3

# set text/out:
data modify storage scdev:_ u.pack.text set from storage scdev:_ u.pack.show.title
data modify storage scdev:_ u.pack.text.hover_event set value {action:"show_text", value:{}}
data modify storage scdev:_ u.pack.text.hover_event.value set from storage scdev:_ u.pack.show.hover
data modify entity @s text set from storage scdev:_ u.pack.text
data modify storage scdev:_/out pack.result set from entity @s text
