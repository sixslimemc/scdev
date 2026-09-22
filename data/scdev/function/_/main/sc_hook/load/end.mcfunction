#> scdev:_/main/sc_hook/load/end
#--------------------
# HOOK: slimecore::sc_hookload/end
#--------------------

data modify storage scdev:_/in send.lines set value [[{text:"✔", color:dark_green}, {text:" Loading finished.", color:green}]]
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen]'
function scdev:_/util/text/send/main