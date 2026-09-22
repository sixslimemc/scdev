#> scdev:_/main/sc_hook/call/pre/disable
#--------------------
# HOOK: slimecore::sc_hookcall/pre/disable
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook disable.pack_id
data modify storage scdev:_/in send_call.tag_path set value "disable"
function scdev:_/util/text/send_call/main