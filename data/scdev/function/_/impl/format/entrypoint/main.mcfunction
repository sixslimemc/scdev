#> scdev : format/entrypoint
# main
execute unless score *entrypoint.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.entrypoint.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:">",color:gray}, {text:"ID",color:gold}]}
data modify storage scdev:_ v.entrypoint.text.extra[0].text set from storage scdev:in entrypoint.reference.pack_ref
data modify storage scdev:_ v.entrypoint.text.extra[2].text set from storage scdev:in entrypoint.reference.id
data modify entity @s text set from storage scdev:_ v.entrypoint.text
data modify storage scdev:out entrypoint.result set from entity @s text
