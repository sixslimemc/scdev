#> scdev:_/main/meta_info/call/pre/entrypoint
#--------------------
# HOOK: slimecore::meta_info/call/pre/entrypoint
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook entrypoint.entrypoint.pack_ref
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_ send_call.tag_path set value 'entrypoint/", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage slimecore:hook entrypoint.entrypoint.id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
function scdev:_/util/text/send_call/main