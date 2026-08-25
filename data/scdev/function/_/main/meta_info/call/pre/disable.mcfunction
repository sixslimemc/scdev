#> scdev:_/main/meta_info/call/pre/disable
#--------------------
# HOOK: slimecore::meta_info/call/pre/disable
#--------------------

data modify storage scdev:_ x.text set value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Calling #", color:gray}, {text:"PACK ID", color:gray}, {text:":disable", color:gray}]
data modify storage scdev:_ x.text[2].text set from storage slimecore:hook disable.pack_id
tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"x.text"}
