#> scdev : format/entrypoint
# main
execute unless score *entrypoint.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.entrypoint.text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:">",color:gray}, {text:"ID",color:gold}], hover_event:{action:"show_text", value:{text:"", color:gold, italic:false, extra:[{text:"#"}, {text:"PACK ID"}, {text:":entrypoint/"}, {text:"ID"}]}}}
data modify storage scdev:_ v.entrypoint.text.extra[0].text set from storage scdev:in entrypoint.reference.pack_ref
data modify storage scdev:_ v.entrypoint.text.extra[2].text set from storage scdev:in entrypoint.reference.id
data modify storage scdev:_ v.entrypoint.text.hover_event.value.extra[1].text set from storage scdev:in entrypoint.reference.pack_ref
data modify storage scdev:_ v.entrypoint.text.hover_event.value.extra[3].text set from storage scdev:in entrypoint.reference.id

# click event:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:in entrypoint.reference.pack_ref
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.entrypoint.text.click_event set from storage scdev:_/out click_pack.result

data modify entity @s text set from storage scdev:_ v.entrypoint.text
data modify storage scdev:out entrypoint.result set from entity @s text
