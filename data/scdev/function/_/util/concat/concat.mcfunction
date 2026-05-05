# UTIL > scdev :_/util/ concat
# concat
#--------------------
# ./do
#--------------------

$data modify storage scdev:_ x.str set value $(acc_quote)$(string)$(acc)$(acc_quote)
execute if score *concat.fix_quote _scdev matches 0 run data modify storage scdev:_ u.concat.acc set from storage scdev:_ x.str
execute if score *concat.fix_quote _scdev matches 1 run data modify storage scdev:_ u.concat.acc set string storage scdev:_ x.str 1
