#> scdev : format/preload_entrypoint
# main
execute unless score *preload_entrypoint.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.preload_entrypoint.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"^",color:gray}, {text:"ID",color:dark_purple}], hover_event:{action:"show_text", value:{text:"", color:gray, extra:[{text:"#"}, {text:"PACK ID"}, {text:":preload_entrypoint/"}, {text:"ID"}]}}}
data modify storage scdev:_ v.preload_entrypoint.text.extra[0].text set from storage scdev:in preload_entrypoint.reference.pack_ref
data modify storage scdev:_ v.preload_entrypoint.text.extra[2].text set from storage scdev:in preload_entrypoint.reference.id
data modify storage scdev:_ v.preload_entrypoint.text.hover_event.value.extra[1].text set from storage scdev:in preload_entrypoint.reference.pack_ref
data modify storage scdev:_ v.preload_entrypoint.text.hover_event.value.extra[3].text set from storage scdev:in preload_entrypoint.reference.id

data modify entity @s text set from storage scdev:_ v.preload_entrypoint.text
data modify storage scdev:out preload_entrypoint.result set from entity @s text
