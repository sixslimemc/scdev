#> scdev : format/contract
# main
execute unless score *contract.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.contract.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"*",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ v.contract.text.extra[0].text set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:_ v.contract.text.extra[2].text set from storage scdev:in contract.reference.id

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.contract.satisfier set from storage slimecore:data build.aux.abstract_map.'", 2:true, 3:"'.'", 4:true, 5:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:_ x.mline.4 set from storage scdev:in contract.reference.id
function scdev:_/util/mline/5 with storage scdev:_ x.mline

execute unless data storage scdev:_ v.contract.satisfier run data modify storage scdev:_ v.contract.text.hover_event set value {action:"show_text", value:[{text:"Not satisfied", color:red}]}
execute if data storage scdev:_ v.contract.satisfier run function scdev:_/impl/format/contract/satisfied

# click event:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:in contract.reference.pack_ref
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.contract.text.click_event set from storage scdev:_/out click_pack.result

data modify entity @s text set from storage scdev:_ v.contract.text
data modify storage scdev:out contract.result set from entity @s text
