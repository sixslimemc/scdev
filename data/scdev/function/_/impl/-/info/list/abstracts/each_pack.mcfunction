# IMPL > scdev :-/ info/list/abstracts
# each_pack
#--------------------
# ./main
#--------------------

data modify storage scdev:_ x.adding set from storage scdev:_ v.abstracts.pack_pool[-1].contract_declarations
execute if data storage scdev:_ x.adding[0] run data modify storage scdev:_ x.adding[].pack_ref set from storage scdev:_ v.abstracts.pack_pool[-1].pack_id

data modify storage scdev:_ v.abstracts.abstracts append from storage scdev:_ x.adding[]

data remove storage scdev:_ v.abstracts.pack_pool[-1]
execute if data storage scdev:_ v.abstracts.pack_pool[0] run function scdev:_/impl/-/info/list/abstracts/each_pack