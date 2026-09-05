#> scdev:_/main/meta_info/call/pre/safe_mode
#--------------------
# HOOK: slimecore::meta_info/call/pre/safe_mode
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook safe_mode.pack_id
data modify storage scdev:_/in send_call.tag_path set value "safe_mode"
function scdev:_/util/text/send_call/main