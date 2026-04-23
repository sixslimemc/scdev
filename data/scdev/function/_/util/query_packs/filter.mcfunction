#> scdev :_/util/ query_packs
# filter
#--------------------
# ./main
#--------------------

execute unless data storage scdev:_/in query_packs.pack_filter.only run data modify storage scdev:_/in query_packs.pack_filter.only set value ""

data modify storage scdev:_ u.query_packs.filtered set value []

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ u.query_packs.filtered append from storage scdev:_/out query_packs.result[", 2:true, 3:"]"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_/in query_packs.pack_filter.only
function scdev:_/util/mline/3 with storage scdev:_ x.mline

data modify storage scdev:_ x.mline set value {1:"data remove storage scdev:_ u.query_packs.filtered[", 2:true, 3:"]"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_/in query_packs.pack_filter.exclude
execute if data storage scdev:_/in query_packs.pack_filter.exclude run function scdev:_/util/mline/3 with storage scdev:_ x.mline

data modify storage scdev:_/out query_packs.result set from storage scdev:_ u.query_packs.filtered