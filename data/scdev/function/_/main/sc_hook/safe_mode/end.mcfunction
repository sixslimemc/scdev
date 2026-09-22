#> scdev:_/main/sc_hook/safe_mode/end
#--------------------
# HOOK: slimecore::sc_hooksafe_mode/end
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"Safe calls finished.", color:light_purple}]
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen]'
function scdev:_/util/text/send/main