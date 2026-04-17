#> scdev :_/util/ format/entrypoint
#--------------------
# -> entrypoint: slimecore::EntrypointReference<slimecore::EntrypointId>
#--------------------
# <- result: Text
#--------------------
# 
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out entrypoint set value {}

data modify storage scdev:_ u.entrypoint.text set value {text:"",extra:[{text:"PACK", color:dark_green}, {text:">",color:gray}, {text:"ID",color:green}]}
data modify storage scdev:_ u.entrypoint.text.extra[0].text set from storage scdev:_/in entrypoint.entrypoint.pack_ref
data modify storage scdev:_ u.entrypoint.text.extra[2].text set from storage scdev:_/in entrypoint.entrypoint.id
data modify entity @s text set from storage scdev:_ u.entrypoint.text
data modify storage scdev:_/out entrypoint.result set from entity @s text

execute if data storage scdev:_/in entrypoint{kill:true} run kill @s

data remove storage scdev:_ u.entrypoint
data remove storage scdev:_/in entrypoint

return 1