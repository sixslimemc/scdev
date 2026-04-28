#> scdev :-/ info/pack
# each_dependency
#--------------------
# ./main
#--------------------

data modify storage scdev:in dependency.declaration set from storage scdev:_ v.packinfo.dependencies[0]
data modify storage scdev:in dependency.use_this_entity set value true
function scdev:format/dependency

data modify storage scdev:_ v.packinfo.lines append value [{text:" - ", color:gray}]
data modify storage scdev:_ v.packinfo.lines[-1] append from storage scdev:out dependency.result

data remove storage scdev:_ v.packinfo.dependencies[0]
execute if data storage scdev:_ v.packinfo.dependencies[0] run function scdev:_/impl/-/info/pack/each_dependency