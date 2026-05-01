#> scdev:_/main/meta_info/load/end
#--------------------
# HOOK: slimecore::meta_info/load/end
#--------------------

data modify storage scdev:_/in send.lines set value [[{text:"✔", color:dark_green}, {text:" Loading finished.", color:green}]]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main