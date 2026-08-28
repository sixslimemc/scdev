# IMPL > scdev : format/pack
# finalize
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.pack.show_text.hover_event set value {action:"show_text", value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ v.pack.show_text.hover_event.value.extra set from storage scdev:_ v.pack.hover_extra

data modify entity @s text set from storage scdev:_ v.pack.show_text
data modify storage scdev:out pack.result set from entity @s text