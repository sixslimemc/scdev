#> scdev:_/main/meta_info/call/pre/disable
#--------------------
# HOOK: slimecore::meta_info/call/pre/disable
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook disable.pack_id
data modify storage scdev:_/in send_call.tag_path set value "disable"
function scdev:_/util/text/send_call/main