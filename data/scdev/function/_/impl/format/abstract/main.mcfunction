#> scdev : format/abstract
# main
execute unless score *abstract.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.abstract.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"*",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ v.abstract.text.extra[0].text set from storage scdev:in abstract.reference.pack_ref
data modify storage scdev:_ v.abstract.text.extra[2].text set from storage scdev:in abstract.reference.id

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.abstract.implementor set from storage slimecore:data build.aux.impl_map.'", 2:true, 3:"'.'", 4:true, 5:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:in abstract.reference.pack_ref
data modify storage scdev:_ x.mline.4 set from storage scdev:in abstract.reference.id
function scdev:_/util/mline/5 with storage scdev:_ x.mline

execute unless data storage scdev:_ v.abstract.implementor run data modify storage scdev:_ v.abstract.text.hover_event set value {action:"show_text", value:[{text:"Not implemented in current build", color:red}]}
execute if data storage scdev:_ v.abstract.implementor run function scdev:_/impl/format/abstract/implemented

data modify entity @s text set from storage scdev:_ v.abstract.text
data modify storage scdev:out abstract.result set from entity @s text
