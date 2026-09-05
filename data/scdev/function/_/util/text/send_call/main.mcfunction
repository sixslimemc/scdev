#> scdev :_/util/ text/send_call
#--------------------
# -> pack_id: PackId
# -> tag_path: string
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out send_call set value {}

data modify storage scdev:_/in send.lines set value [{text:"", color:gray, italic:true, extra:[{text:"Call: ", italic:false, color:dark_blue}, {text:"#"}, {text:"PACK ID"}, {text:":"}, {text:"PATH"}]}]
data modify storage scdev:_/in send.lines[0].extra[2].text set from storage scdev:_/in send_call.pack_id
data modify storage scdev:_/in send.lines[0].extra[4].text set from storage scdev:_/in send_call.tag_path
data modify storage scdev:_/in send.to set value '@a[tag=scdev.listen-calls]'
function scdev:_/util/text/send/main

data remove storage scdev:_/in send_call

return 1