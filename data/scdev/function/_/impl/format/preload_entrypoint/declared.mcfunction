#> scdev : format/preload_entrypoint
# declared
#--------------------
# ./main
#--------------------

# set {..declaration}:
data modify storage scdev:_ eval[-1].v.declaration set from storage scdev:_ eval[-1].v.asource.declaration

# set {..before_text}:
data modify storage scdev:_ eval[-1].v.order_text set value [""]
data modify storage scdev:_ eval[-1].v.orders set from storage scdev:_ eval[-1].v.declaration.before
execute if data storage scdev:_ eval[-1].v.orders[0] run data modify storage scdev:_ eval[-1].v.order_text append value {text:"\nAlways before:", color:blue}
execute if data storage scdev:_ eval[-1].v.orders[0] run function scdev:_/impl/format/preload_entrypoint/orders/each
data modify storage scdev:_ eval[-1].v.before_text set from storage scdev:_ eval[-1].v.order_text

# set {..after_text}:
data modify storage scdev:_ eval[-1].v.order_text set value [""]
data modify storage scdev:_ eval[-1].v.orders set from storage scdev:_ eval[-1].v.declaration.after
execute if data storage scdev:_ eval[-1].v.orders[0] run data modify storage scdev:_ eval[-1].v.order_text append value {text:"\nAlways after:", color:blue}
execute if data storage scdev:_ eval[-1].v.orders[0] run function scdev:_/impl/format/preload_entrypoint/orders/each
data modify storage scdev:_ eval[-1].v.before_text set from storage scdev:_ eval[-1].v.order_text

# modify {..hover_extra}:
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.before_text
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.after_text
