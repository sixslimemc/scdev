#> scdev:_/main/meta_info/call/pre/load
#--------------------
# HOOK: slimecore::meta_info/call/pre/load
#--------------------

data modify storage scdev:_/in send.lines set value [{text:"", color:gray, italic:true, extra:[{text:"Call: ", italic:false, color:blue}, {text:"#"}, {text:"PACK ID"}, {text:":load"}]}]
data modify storage scdev:_/in send.lines[0].extra[2].text set from storage slimecore:hook load.pack_id
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen-calls]'
function scdev:_/util/text/send/main