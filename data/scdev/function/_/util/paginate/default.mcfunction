#> scdev :_/util/ paginate
# default
#--------------------
# ./do
#--------------------

data modify storage scdev:_/out paginate.result set from storage scdev:_/in paginate.list
execute store result score *x _scdev if data storage scdev:_/in paginate.list[]
execute store result storage scdev:_/out paginate.indicies.end int 1 run scoreboard players get *x _scdev