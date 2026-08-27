#> scdev : format/entrypoint
# declared
#--------------------
# ./main
#--------------------

# set {..source_text}:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ eval[-1].in.reference.pack_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ eval[-1].v.source_text set from storage scdev:out pack.result

# set {..before_text}:
data modify storage scdev:_ eval[-1].v.order_text set value [""]
data modify storage scdev:_ eval[-1].v.orders set from storage scdev:_ eval[-1].v.declaration.before
execute if data storage scdev:_ eval[-1].v.orders[0] run data modify storage scdev:_ eval[-1].v.order_text append value {text:"\nBefore:", color:gray}
execute if data storage scdev:_ eval[-1].v.orders[0] run function scdev:_/impl/format/entrypoint/orders/each
data modify storage scdev:_ eval[-1].v.before_text set from storage scdev:_ eval[-1].v.order_text

# set {..after_text}:
data modify storage scdev:_ eval[-1].v.order_text set value [""]
data modify storage scdev:_ eval[-1].v.orders set from storage scdev:_ eval[-1].v.declaration.after
execute if data storage scdev:_ eval[-1].v.orders[0] run data modify storage scdev:_ eval[-1].v.order_text append value {text:"\nAfter:", color:gray}
execute if data storage scdev:_ eval[-1].v.orders[0] run function scdev:_/impl/format/entrypoint/orders/each
data modify storage scdev:_ eval[-1].v.before_text set from storage scdev:_ eval[-1].v.order_text

# build {..hover_extra}:
data modify storage scdev:_ eval[-1].v.hover_extra set value []
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.show_text
data modify storage scdev:_ eval[-1].v.hover_extra append value "\n"
#data modify storage scdev:_ eval[-1].v.hover_extra append value {text:"Source: "}
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.source_text
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.before_text
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.after_text
data modify storage scdev:_ eval[-1].v.hover_extra append value "\n"
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.tag_text
# set hover event:
data modify storage scdev:_ eval[-1].v.show_text.hover_event set value {action:"show_text", value:{text:"", color:gray, italic:false, extra:[]}}
data modify storage scdev:_ eval[-1].v.show_text.hover_event.value.extra set from storage scdev:_ eval[-1].v.hover_extra

# click event:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:_ eval[-1].in.reference.pack_ref
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ eval[-1].v.show_text.click_event set from storage scdev:_/out click_pack.result
