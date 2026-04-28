#> scdev :_/util/ text/click_pack
#--------------------
# -> pack_id: PackId
#--------------------
# <- result: Text.click_event
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data modify storage scdev:_/out click_pack.result set value {action:"run_command", command:""}

data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_/out click_pack.result.command set value 'function scdev:-/info/pack {args:{pack_id:\\'", 2:true, 3:"\\'}}"}
data modify storage scdev:_ x.mline.2 set from storage scdev:_/in click_pack.pack_id
function scdev:_/util/mline/3 with storage scdev:_ x.mline

data remove storage scdev:_/in click_pack

return 1