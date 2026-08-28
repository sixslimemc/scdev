# UTIL > scdev :_/util/ artifact_source
# artifact
#--------------------
# ./main
#--------------------

# not installed:
$data modify storage scdev:_/out artifact_source.source set from storage slimecore:data world.raw_manifests[{pack_id:"$(pack_ref)"}]
execute unless data storage scdev:_/out artifact_source.source run data modify storage scdev:_/out artifact_source.tag_text set value {text:"\n[!] Not part of an installed pack", color:dark_red, italic:false, bold:false}
execute unless data storage scdev:_/out artifact_source.source run data modify storage scdev:_/out artifact_source.tag_prefix set value {text:"!", color:dark_red, italic:false, bold:false}
execute unless data storage scdev:_/out artifact_source.source run return 4

# artifact does not exist:
$data modify storage scdev:_/out artifact_source.declaration set from storage scdev:_/out artifact_source.source.$(id_path)[{id:'$(id)'}]
execute unless data storage scdev:_/out artifact_source.declaration run data modify storage scdev:_/out artifact_source.tag_text set value {text:"\n[`] Does not exist", color:dark_red, italic:false, bold:false}
execute unless data storage scdev:_/out artifact_source.declaration run data modify storage scdev:_/out artifact_source.tag_prefix set value {text:"`", color:dark_red, italic:false, bold:false}
execute unless data storage scdev:_/out artifact_source.source run return 3

# pack disabled:
execute store success score *x _scdev if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:false}
execute if score *x _scdev matches 0 run data modify storage scdev:_/out artifact_source.tag_text set value {text:"\n[!] Source pack is disabled", color:red, italic:false, bold:false}
execute if score *x _scdev matches 0 run data modify storage scdev:_/out artifact_source.tag_prefix set value {text:"!", color:red, italic:false, bold:false}
execute if score *x _scdev matches 0 run return 2

# pack enabled:
return 1