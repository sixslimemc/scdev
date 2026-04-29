# IMPL > scdev :-/ info/list/abstracts
# each
#--------------------
# ./main
#--------------------
# forward iter

data modify storage scdev:_ v.abstracts.this_abstract set from storage scdev:_ v.abstracts.abstracts[0]

# {..abstract_text}:
data modify storage scdev:in abstract.reference set from storage scdev:_ v.abstracts.this_abstract
data modify storage scdev:in abstract.use_this_entity set value true
function scdev:format/abstract
data modify storage scdev:_ v.abstracts.abstract_text set from storage scdev:out abstract.result

# line:
data modify storage scdev:_ v.abstracts.lines append value [{text:" - ", color:gray}, {}]
data modify storage scdev:_ v.abstracts.lines[-1][1] set from storage scdev:_ v.abstracts.abstract_text

data remove storage scdev:_ v.abstracts.abstracts[0]
execute if data storage scdev:_ v.abstracts.abstracts[0] run function scdev:_/impl/-/info/list/abstracts/each