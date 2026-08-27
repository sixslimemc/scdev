#> scdev : format/contract
# main
execute unless score *contract.use_self _scdev matches 1 run kill @s

data modify storage scdev:_ v.contract.show_text set value {text:"",extra:[{text:"PACK", color:yellow}, {text:"*",color:gray}, {text:"ID",color:light_purple}]}
data modify storage scdev:_ v.contract.show_text.extra[0].text set from storage scdev:in contract.reference.pack_ref
data modify storage scdev:_ v.contract.show_text.extra[2].text set from storage scdev:in contract.reference.id

# get {..satisfier} and {..declaration}:
data remove storage scdev:_ v.contract.satisfier
data remove storage scdev:_ v.contract.declaration
function scdev:_/impl/format/contract/get_data with storage scdev:in contract.reference

execute unless data storage scdev:_ v.contract.declaration run function scdev:_/impl/format/contract/undeclared
execute unless data storage scdev:_ v.contract.satisfier run function scdev:_/impl/format/contract/unsatisfied
execute if data storage scdev:_ v.contract.satisfier run function scdev:_/impl/format/contract/satisfied

data modify entity @s text set from storage scdev:_ v.contract.text
data modify storage scdev:out contract.result set from entity @s text
