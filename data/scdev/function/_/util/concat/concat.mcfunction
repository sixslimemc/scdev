# UTIL > scdev :_/util/ concat
# concat
#--------------------
# ./do
#--------------------

$data modify storage scdev:_ x.str set value $(acc_quote)$(string)$(acc)$(acc_quote)
data modify storage scdev:_ v.concat.acc set string storage scdev:_ x.str 1
