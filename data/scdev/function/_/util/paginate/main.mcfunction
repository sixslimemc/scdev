#> scdev :_/util/ paginate
# ^ T
#--------------------
# -> list: [^T]
# ~> count?: int
# ~> page?: int
#--------------------
# <- result: [^T]
# <- indicies: {start:int, end:int}
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out paginate set value {result:[], indicies:{start:0, end:0}}
execute unless data storage scdev:_/in paginate.page run data modify storage scdev:_/in paginate.page set value 1

# just for easy impl of gaurd clauses.
function scdev:_/util/paginate/do

data remove storage scdev:_ u.paginate
data remove storage scdev:_/in paginate
scoreboard players reset *paginate.count _scdev
scoreboard players reset *paginate.max_index _scdev
scoreboard players reset *paginate.page _scdev
scoreboard players reset *paginate.skip _scdev
scoreboard players reset *paginate.j _scdev

return 1