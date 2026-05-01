#> scdev:_/main/meta_info/load/supressed
#--------------------
# ./start
#--------------------
scoreboard players reset *supress_load _scdev

data modify storage scdev:_/in send.lines set value [{text:"Loading summary supressed.", color:dark_gray}]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main