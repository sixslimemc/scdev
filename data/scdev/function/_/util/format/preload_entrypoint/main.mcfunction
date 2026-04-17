#> scdev :_/util/ format/preload_entrypoint
#--------------------
# -> preload_entrypoint: slimecore::EntrypointReference<slimecore::PreloadEntrypointId>
#--------------------
# <- result: Text
#--------------------
# 
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out preload_entrypoint set value {}

data modify storage scdev:_ u.preload_entrypoint.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:" ^ ",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ u.preload_entrypoint.text.extra[0].text set from storage scdev:_/in preload_entrypoint.preload_entrypoint.pack_ref
data modify storage scdev:_ u.preload_entrypoint.text.extra[2].text set from storage scdev:_/in preload_entrypoint.preload_entrypoint.id
data modify entity @s text set from storage scdev:_ u.preload_entrypoint.text
data modify storage scdev:_/out preload_entrypoint.result set from entity @s text

execute if data storage scdev:_/in preload_entrypoint{kill:true} run kill @s

data remove storage scdev:_ u.preload_entrypoint
data remove storage scdev:_/in preload_entrypoint

return 1