#> scdev : format/entrypoint
# main
execute unless data storage scdev:_ eval[-1].in{use_this_entity:true} run kill @s

# set {..show_text}:
data modify storage scdev:_ eval[-1].v.show_text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:">",color:gray}, {text:"ID",color:gold}]}
data modify storage scdev:_ eval[-1].v.show_text.extra[0].text set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:_ eval[-1].v.show_text.extra[2].text set from storage scdev:_ eval[-1].in.reference.id

# set {..tag_text}:
data modify storage scdev:_ eval[-1].v.tag_text set value {text:"", color:gold, italic:true, extra:[{text:"#"}, {text:"PACK ID"}, {text:":entrypoint/"}, {text:"ID"}]}
data modify storage scdev:_ eval[-1].v.tag_text.extra[1].text set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:_ eval[-1].v.tag_text.extra[3].text set from storage scdev:_ eval[-1].in.reference.id

# get {..declaration}:
data remove storage scdev:_ eval[-1].v.declaration
function scdev:_/impl/format/entrypoint/get_declaration with storage scdev:_ eval[-1].in.reference

execute if data storage scdev:_ eval[-1].v.declaration run function scdev:_/impl/format/entrypoint/declared
execute unless data storage scdev:_ eval[-1].v.declaration run function scdev:_/impl/format/entrypoint/undeclared

data modify entity @s text set from storage scdev:_ eval[-1].v.show_text
data modify storage scdev:_ eval[-1].out.result set from entity @s text
