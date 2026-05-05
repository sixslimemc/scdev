# IMPL > scdev :-/ fetch_dependencies
# each_id
#--------------------
# ./main
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"", color:red, extra:[{text:"There are no packs installed with the following IDs:"}, {storage:"scdev:_", nbt:"v.fetch.invalid_ids", color:gray}]}]
data modify storage scdev:_/in send.source set value "scdev:-/dev/fetch_dependencies"
function scdev:_/util/text/send/main