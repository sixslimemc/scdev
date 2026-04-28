#> scdev : format/pack
# installed
#--------------------
# ./main
#--------------------

# check is disabled:
data modify storage scdev:_ x.mline set value {1:"execute store success score *pack.disabled _scdev if data storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'{disabled:true}"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.pack.data.pack_id
execute unless score *pack.is_direct _scdev matches 1 run function scdev:_/util/mline/3 with storage scdev:_ x.mline

# check if library:
execute store success score *pack.library _scdev if data storage scdev:_ v.pack.data{is_library:true}

# title:
data modify storage scdev:_ v.pack.c.id set value [{text:"AUTHOR ID"}, {text:"."}, {text:"PACK ID"}]
data modify storage scdev:_ v.pack.c.id[0].text set from storage scdev:_ v.pack.data.author_id
data modify storage scdev:_ v.pack.c.id[2].text set from storage scdev:_ v.pack.data.pack_id
data modify storage scdev:_ v.pack.show.title set value {text:"", color:aqua, extra:[]}
data modify storage scdev:_ v.pack.show.title.extra set from storage scdev:_ v.pack.c.id
execute if score *pack.library _scdev matches 1 run data modify storage scdev:_ v.pack.show.title.color set value dark_aqua
execute if score *pack.disabled _scdev matches 1 run data modify storage scdev:_ v.pack.show.title.extra prepend value {text:"!", color:"red", bold:false}

# hover line 1:
data modify storage scdev:_ v.pack.c.line1 set value {text:"", extra:[{text:"DISPLAY NAME", color:aqua}, {text:" "}, {text:"", color:dark_green, extra:[]}]}
data modify storage scdev:_ v.pack.c.line1.extra.[0].text set from storage scdev:_ v.pack.data.display.name
execute if score *pack.library _scdev matches 1 run data modify storage scdev:_ v.pack.c.line1.extra[0].color set value dark_aqua
data modify storage scdev:_ v.pack.c.line1.extra[2].extra set value [{storage:"scdev:_", nbt:"v.pack.data.version.major", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.pack.data.version.minor", plain:true}, {text:"."}, {storage:"scdev:_", nbt:"v.pack.data.version.patch", plain:true}]

# hover line 2:
data modify storage scdev:_ v.pack.c.line2 set value {text:"SUMMARY", color:gray}
data modify storage scdev:_ v.pack.c.line2.text set from storage scdev:_ v.pack.data.display.summary

# hover line 3:
data modify storage scdev:_ v.pack.c.line3 set value {text:"AUTHOR NAME", color:blue}
data modify storage scdev:_ v.pack.c.line3.text set from storage scdev:_ v.pack.data.display.author_name

# hover lib line:
data modify storage scdev:_ v.pack.c.line_lib set value {text:"(Library)", color:dark_gray}

# hover disabled line:
data modify storage scdev:_ v.pack.c.line_disabled set value {text:"[!] Disabled", color:red}

# construct hover:
data modify storage scdev:_ v.pack.show.hover set value {text:"", extra:[]}
data modify storage scdev:_ v.pack.show.hover.extra append from storage scdev:_ v.pack.c.line1
data modify storage scdev:_ v.pack.show.hover.extra append value {text:"\n"}
data modify storage scdev:_ v.pack.show.hover.extra append from storage scdev:_ v.pack.c.line2
execute if score *pack.library _scdev matches 1 run data modify storage scdev:_ v.pack.show.hover.extra append value {text:"\n"}
execute if score *pack.library _scdev matches 1 run data modify storage scdev:_ v.pack.show.hover.extra append from storage scdev:_ v.pack.c.line_lib
data modify storage scdev:_ v.pack.show.hover.extra append value {text:"\n"}
data modify storage scdev:_ v.pack.show.hover.extra append from storage scdev:_ v.pack.c.line3
execute if score *pack.disabled _scdev matches 1 run data modify storage scdev:_ v.pack.show.hover.extra append value {text:"\n"}
execute if score *pack.disabled _scdev matches 1 run data modify storage scdev:_ v.pack.show.hover.extra append from storage scdev:_ v.pack.c.line_disabled

# construct click:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:_ v.pack.data.pack_id
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.pack.click_event set from storage scdev:_/out click_pack.result

# set text/out:
data modify storage scdev:_ v.pack.text set from storage scdev:_ v.pack.show.title
data modify storage scdev:_ v.pack.text.hover_event set value {action:"show_text", value:{}}
data modify storage scdev:_ v.pack.text.hover_event.value set from storage scdev:_ v.pack.show.hover
data modify storage scdev:_ v.pack.text.click_event set from storage scdev:_ v.pack.click_event
data modify entity @s text set from storage scdev:_ v.pack.text
data modify storage scdev:out pack.result set from entity @s text