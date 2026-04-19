#> scdev :_/util/ format/abstract
#--------------------
# -> abstract: slimecore::AbstractReference
#--------------------
# <- result: Text
#--------------------
# 
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out abstract set value {}

data modify storage scdev:_ u.abstract.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"@",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ u.abstract.text.extra[0].text set from storage scdev:_/in abstract.abstract.pack_ref
data modify storage scdev:_ u.abstract.text.extra[2].text set from storage scdev:_/in abstract.abstract.id
data modify entity @s text set from storage scdev:_ u.abstract.text
data modify storage scdev:_/out abstract.result set from entity @s text

execute if data storage scdev:_/in abstract{kill:true} run kill @s

data remove storage scdev:_ u.abstract
data remove storage scdev:_/in abstract

return 1