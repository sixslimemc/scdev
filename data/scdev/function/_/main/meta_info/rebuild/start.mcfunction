#> scdev:_/main/meta_info/rebuild/start
#--------------------
# HOOK: slimecore::meta_info/rebuild/start
#--------------------

function scdev:_/sc/rebuild_load

data modify storage scdev:_/in send.lines set value [{text:"Rebuilding...", color:blue}]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main
