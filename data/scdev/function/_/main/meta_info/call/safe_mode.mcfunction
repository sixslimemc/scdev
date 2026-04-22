#> scdev:_/main/meta_info/call/safe_mode
#--------------------
# HOOK: slimecore::meta_info/call/safe_mode
#--------------------

data modify storage scdev:_ x.text set value [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Call: #", color:gold}, {text:"PACK ID", color:gold}, {text:":safe_mode", color:gold}]
data modify storage scdev:_ x.text[2].text set from storage slimecore:hook safe_mode.pack_id
tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"x.text"}
