#> scdev:_/main/meta_info/rebuild/start
#--------------------
# HOOK: slimecore::meta_info/rebuild/start
#--------------------

# init:
execute unless score *init _scdev matches 1 run function scdev:_/sc/init

data modify storage scdev:_/in send.lines set value [{text:" Rebuilding...", color:blue}]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main
