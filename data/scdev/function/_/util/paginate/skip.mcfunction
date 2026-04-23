#> scdev :_/util/ paginate
# skip
#--------------------
# ./do
#--------------------

execute if score *paginate.j _scdev matches ..0 run return 0
scoreboard players remove *paginate.j _scdev 1

data remove storage scdev:_/in paginate.list[0]
execute if data storage scdev:_/in paginate.list[0] run function scdev:_/util/paginate/skip