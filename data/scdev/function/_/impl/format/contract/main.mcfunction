# IMPL > scdev : format/contract
# main
execute unless score *contract.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.contract.show_text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"*",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ v.contract.show_text.extra[0].text set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:_ v.contract.show_text.extra[2].text set from storage scdev:in contract.reference.id

data modify storage scdev:_ v.contract.type_text set value {text:"Contract", color:dark_gray, italic:true}

# set {..asource} from util/artifact_source out:
# - set *.asource
data modify storage scdev:_/in artifact_source set value {id_path:"contract_declarations"}
data modify storage scdev:_/in artifact_source.pack_ref set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:_/in artifact_source.id set from storage scdev:in contract.reference.id
execute store result score *contract.asource _scdev run function scdev:_/util/artifact_source/main
data modify storage scdev:_ v.contract.asource set from storage scdev:_/out artifact_source

# init {..hover_extra}:
data modify storage scdev:_ v.contract.hover_extra set value []

# if satisfied:
# ~ logically must be satifsied if enabled.
# - modifies {..hover_extra}
execute if score *contract.asource _scdev matches 1 run function scdev:_/impl/format/contract/satisfied with storage scdev:in contract.reference

# if has source:
# - modifies {..hover_extra}
execute if data storage scdev:_ v.contract.asource.source run function scdev:_/impl/format/contract/has_source

# affix {..asource} tags:
data modify storage scdev:_ v.contract.hover_extra append from storage scdev:_ v.contract.asource.tag_text
data modify storage scdev:_ v.contract.show_text.extra prepend from storage scdev:_ v.contract.asource.tag_prefix

# hover header:
data modify storage scdev:_ v.contract.hover_extra prepend from storage scdev:_ v.contract.tag_text
data modify storage scdev:_ v.contract.hover_extra prepend value "\n"
data modify storage scdev:_ v.contract.hover_extra prepend from storage scdev:_ v.contract.show_text

# set hover:
data modify storage scdev:_ v.contract.show_text.hover_event set value {action:'show_text', value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ v.contract.show_text.hover_event.value.extra set from storage scdev:_ v.contract.hover_extra

data modify entity @s text set from storage scdev:_ v.contract.show_text
data modify storage scdev:out contract.result set from entity @s text
