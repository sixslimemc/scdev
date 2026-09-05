#> scdev:_/main/meta_info/safe_mode/end
#--------------------
# HOOK: slimecore::meta_info/safe_mode/end
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"Safe calls finished.", color:light_purple}]
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main