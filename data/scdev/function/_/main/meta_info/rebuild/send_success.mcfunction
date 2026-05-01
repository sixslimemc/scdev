#> scdev:_/main/meta_info/rebuild/end
#--------------------
# ./end
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"Rebuild success.", color:green}]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main