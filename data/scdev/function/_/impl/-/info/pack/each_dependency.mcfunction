#> scdev :-/ info/pack

data modify storage scdev:_ v.pack.this_dependency set from storage scdev:_ v.pack.dependencies[-1]

# get dependency text:
data modify storage scdev:in dependency.declaration set from storage scdev:_ v.pack.this_dependency
data modify storage scdev:in dependency.use_this_entity set value true
function scdev:format/dependency
data modify storage scdev:_ v.pack.dep_text set from storage scdev:out dependency.result

# check if installed:
data remove storage scdev:_ v.pack.dep_installed
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ v.pack.dep_installed set from storage slimecore:data world.aux.installed_map.'", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_ v.pack.this_dependency.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
execute store success score *pack.dep_installed _scdev if data storage scdev:_ v.pack.dep_installed

# get status text:
data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ v.pack.entry.pack.pack_id



data remove storage scdev:_ v.pack.dependencies[-1]
execute if data storage scdev:_ v.pack.dependencies[0] run function scdev:_/impl/-/info/pack/each_dependency