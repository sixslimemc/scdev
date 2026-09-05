#> scdev:_/main/meta_info/call/pre/preload_entrypoint
#--------------------
# HOOK: slimecore::meta_info/call/pre/preload_entrypoint
#--------------------

data modify storage scdev:_/in send_call.pack_id set from storage slimecore:hook preload_entrypoint.preload_entrypoint.pack_ref
data modify storage scdev:_ x.mline set value {1:"data modify storage scdev:_/in send_call.tag_path set value 'preload_entrypoint/", 2:true, 3:"'"}
data modify storage scdev:_ x.mline.2 set from storage slimecore:hook preload_entrypoint.preload_entrypoint.id
function scdev:_/util/mline/3 with storage scdev:_ x.mline
function scdev:_/util/text/send_call/main