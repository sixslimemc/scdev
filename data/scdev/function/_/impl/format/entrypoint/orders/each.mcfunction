#> scdev : format/entrypoint
# orders/each
#--------------------
# ../declared
#--------------------

data modify storage scdev:in entrypoint.reference set from storage scdev:_ v.entrypoint.orders[0]
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint
data modify storage scdev:_ v.entrypoint.this_text set from storage scdev:out entrypoint.result

data modify storage scdev:_ v.entrypoint.order_text append value {text:"\n", color:gray, extra:[{text:" - "}, {}]}
data modify storage scdev:_ v.entrypoint.order_text[-1].extra[1] set from storage scdev:_ v.entrypoint.this_text

data remove storage scdev:_ v.entrypoint.orders[0]
execute if data storage scdev:_ v.entrypoint.orders[0] run function scdev:_/impl/format/entrypoint/orders/each