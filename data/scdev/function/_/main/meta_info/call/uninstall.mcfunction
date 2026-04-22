#> scdev:_/main/meta_info/call/uninstall
#--------------------
# HOOK: slimecore::meta_info/call/uninstall
#--------------------

data modify storage scdev:_ x.text set value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Call: #", color:gold}, {text:"PACK ID", color:gold}, {text:":uninstall", color:gold}]
data modify storage scdev:_ x.text[2].text set from storage slimecore:hook uninstall.pack_id
tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"x.text"}
