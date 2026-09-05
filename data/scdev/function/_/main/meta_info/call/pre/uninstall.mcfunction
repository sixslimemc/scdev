#> scdev:_/main/meta_info/call/pre/uninstall
#--------------------
# HOOK: slimecore::meta_info/call/pre/uninstall
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook uninstall.pack_id
data modify storage scdev:_/in send_call.tag_path set value "uninstall"
function scdev:_/util/text/send_call/main
