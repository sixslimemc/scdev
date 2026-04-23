#> scdev :_/util/ paginate
# do
#--------------------
# ./main
#--------------------

# return if no count specified:
execute unless data storage scdev:_/in paginate.count run return run function scdev:_/util/paginate/default

# store scores:
execute store result score *paginate.count _scdev run data get storage scdev:_/in paginate.count
execute if score *paginate.count _scdev matches ..-1 run scoreboard players set *paginate.count _scdev 0
execute store result score *paginate.page _scdev run data get storage scdev:_/in paginate.page
execute if score *paginate.page _scdev matches ..0 run scoreboard players set *paginate.page _scdev 1
execute store result score *paginate.max_index _scdev if data storage scdev:_/in paginate.list[]
scoreboard players remove *paginate.max_index _scdev 1

scoreboard players operation *paginate.skip _scdev = *paginate.page _scdev
scoreboard players remove *paginate.skip _scdev 1
scoreboard players operation *paginate.skip _scdev *= *paginate.count _scdev

# skip:
scoreboard players operation *paginate.j _scdev = *paginate.skip _scdev
execute if data storage scdev:_/in paginate.list[0] run function scdev:_/util/paginate/skip

# each:
scoreboard players operation *paginate.j _scdev = *paginate.count _scdev
execute if data storage scdev:_/in paginate.list[0] run function scdev:_/util/paginate/each

# set indicies:
scoreboard players operation *x _scdev = *paginate.skip _scdev
execute if score *x _scdev > *paginate.max_index _scdev run scoreboard players operation *x _scdev = *paginate.max_index _scdev
execute store result storage scdev:_/out paginate.indicies.start int 1 run scoreboard players get *x _scdev
execute store result score *y _scdev if data storage scdev:_/out paginate.result[]
scoreboard players operation *x _scdev += *y _scdev
execute store result storage scdev:_/out paginate.indicies.end int 1 run scoreboard players get *x _scdev
