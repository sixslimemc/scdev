#> scdev:_/main/meta_info/call/pre/load
#--------------------
# HOOK: slimecore::meta_info/call/pre/load
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook load.pack_id
data modify storage scdev:_/in send_call.tag_path set value "load"
function scdev:_/util/text/send_call/main