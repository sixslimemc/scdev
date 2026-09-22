#> scdev:_/main/sc_hook/rebuild/start
#--------------------
# HOOK: slimecore::sc_hookrebuild/start
#--------------------

function scdev:_/sc/rebuild_load

data modify storage scdev:_ data.pre_rebuild set from storage slimecore:data

data modify storage scdev:_/in send.lines set value [{text:"Rebuilding...", color:blue}]
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen]'
function scdev:_/util/text/send/main
