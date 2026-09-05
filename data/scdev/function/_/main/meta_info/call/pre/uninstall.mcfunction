#> scdev:_/main/meta_info/call/pre/uninstall
#--------------------
# HOOK: slimecore::meta_info/call/pre/uninstall
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"", color:gray, italic:true, extra:[{text:"Calling ", italic:false}, {text:"#"}, {text:"PACK ID"}, {text:":uninstall"}]}]
data modify storage scdev:_/in send.lines[0].extra[2].text set from storage slimecore:hook uninstall.pack_id
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen]'
function scdev:_/util/text/send/main

