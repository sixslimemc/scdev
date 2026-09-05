# IMPL > scdev:-/rebuild
# quick_error
#--------------------
# ./main
#--------------------

$data modify storage scdev:_/in send.lines set value [$(line)]
data modify storage scdev:_/in send.source set value "scdev:-/rebuild"
function scdev:_/util/text/send/main