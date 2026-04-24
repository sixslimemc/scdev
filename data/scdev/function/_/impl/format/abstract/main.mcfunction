#> scdev : format/abstract
# main
execute unless score *abstract.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.abstract.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"*",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ v.abstract.text.extra[0].text set from storage scdev:in abstract.reference.pack_ref
data modify storage scdev:_ v.abstract.text.extra[2].text set from storage scdev:in abstract.reference.id
data modify entity @s text set from storage scdev:_ v.abstract.text
data modify storage scdev:out abstract.result set from entity @s text
