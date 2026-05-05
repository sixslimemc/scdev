# UTIL > scdev :_/util/ concat
# fix_string
#--------------------
# ./do
#--------------------

$say $(quote)\$(quote)$(string)$(quote)
$data modify storage scdev:_ u.concat.string set value $(quote)\$(quote)$(string)$(quote)
