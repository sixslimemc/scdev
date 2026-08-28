#> scdev : format/preload_entrypoint
# main
execute unless data storage scdev:_ eval[-1].in{use_this_entity:true} run kill @s

# set {..show_text}:
data modify storage scdev:_ eval[-1].v.show_text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:">",color:gray}, {text:"ID",color:gold}]}
data modify storage scdev:_ eval[-1].v.show_text.extra[0].text set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:_ eval[-1].v.show_text.extra[2].text set from storage scdev:_ eval[-1].in.reference.id

# set {..tag_text}:
data modify storage scdev:_ eval[-1].v.tag_text set value {text:"", color:dark_gray, italic:false, extra:[{text:"#"}, {text:"PACK ID"}, {text:":preload_entrypoint/"}, {text:"ID"}]}
data modify storage scdev:_ eval[-1].v.tag_text.extra[1].text set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:_ eval[-1].v.tag_text.extra[3].text set from storage scdev:_ eval[-1].in.reference.id

# declare {..hover_extra}:
data modify storage scdev:_ eval[-1].v.hover_extra set value []

# set {..asource} from util/artifact_source out:
data modify storage scdev:_/in artifact_source set value {id_path:"preload_entrypoints"}
data modify storage scdev:_/in artifact_source.pack_ref set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:_/in artifact_source.id set from storage scdev:_ eval[-1].in.reference.id
function scdev:_/util/artifact_source/main
data modify storage scdev:_ eval[-1].v.asource set from storage scdev:_/out artifact_source

# if declared:
# - modify {..hover_extra}:
execute if data storage scdev:_ eval[-1].v.asource.declaration run function scdev:_/impl/format/preload_entrypoint/declared

# if has source:
# - modify {..hover_extra}:
execute if data storage scdev:_ eval[-1].v.asource.source run function scdev:_/impl/format/preload_entrypoint/has_source

# affix {..asource} tags:
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.asource.tag_text
data modify storage scdev:_ eval[-1].v.show_text.extra prepend from storage scdev:_ eval[-1].v.asource.tag_prefix

# hover header:
data modify storage scdev:_ eval[-1].v.hover_extra prepend from storage scdev:_ eval[-1].v.tag_text
data modify storage scdev:_ eval[-1].v.hover_extra prepend value "\n"
data modify storage scdev:_ eval[-1].v.hover_extra prepend from storage scdev:_ eval[-1].v.show_text

# set hover:
data modify storage scdev:_ eval[-1].v.show_text.hover_event set value {action:'show_text', value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ eval[-1].v.show_text.hover_event.value.extra set from storage scdev:_ eval[-1].v.hover_extra

# set out:
data modify entity @s text set from storage scdev:_ eval[-1].v.show_text
data modify storage scdev:_ eval[-1].out.result set from entity @s text
