#> scdev :_/util/ query_packs
#--------------------
# -> disabled?: boolean
# -> pack_filter?: ListFilter
#--------------------
# <- result: [PackManifest]
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out query_packs set value {result:[]}

# get initial packs:
scoreboard players set *x _slimecore 0
execute if data storage scdev:_/in query_packs{disabled:true} run scoreboard players set *x _slimecore 1
execute if score *x _slimecore matches 0 run data modify storage scdev:_/out query_packs.result set from storage slimecore:data build.packs
execute if score *x _slimecore matches 1 run data modify storage scdev:_/out query_packs.result append from storage slimecore:data world.installed[{disabled:true}].pack

# filter:
execute if data storage scdev:_/in query_packs.pack_filter run function scdev:_/util/query_packs/filter

data remove storage scdev:_ u.query_packs
data remove storage scdev:_/in query_packs

return 1