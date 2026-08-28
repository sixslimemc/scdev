# UTIL > scdev :_/util/ artifact_source
# just_pack
#--------------------
# ./main
#--------------------

$data modify storage scdev:_/out artifact_source.source set from storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:false}.pack
execute if data storage scdev:_/out artifact_source.source run return 1

$data modify storage scdev:_/out artifact_source.source set from storage slimecore:data world.raw_manifests[{pack_id:"$(pack_ref)"}]
execute if data storage scdev:_/out artifact_source.source run data modify storage scdev:_/out artifact_source.tag_text set value {text:"\n[!] Not part of current build", color:red, italic:false, bold:false}
execute if data storage scdev:_/out artifact_source.source run data modify storage scdev:_/out artifact_source.tag_prefix set value {text:"!", color:red, italic:false, bold:false}
execute if data storage scdev:_/out artifact_source.source run return 2

data modify storage scdev:_/out artifact_source.tag_text set value {text: "\n[!] Not installed", color:dark_red, italic:false, bold:false}
data modify storage scdev:_/out artifact_source.tag_prefix set value {text: "!", color:dark_red, italic:false, bold:false}
return 4