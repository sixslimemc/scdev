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

data modify storage scdev:_/out query_packs set value {}

data remove storage scdev:_ u.query_packs
data remove storage scdev:_/in query_packs

return 1