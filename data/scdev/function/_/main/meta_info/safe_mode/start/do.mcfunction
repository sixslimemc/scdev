#> scdev:_/main/meta_info/safe_mode/start/do
#--------------------
# ../start
#--------------------
kill @s

data modify storage scdev:_ t.safe_mode.lines set value []

data modify storage scdev:_ t.safe_mode.lines append value {text:"--[ Safe Mode ]-----", bold:true, color:light_purple}

data remove storage scdev:_ t.safe_mode.calls
data modify storage scdev:_ t.safe_mode.calls set from storage slimecore:data world.safe_mode.calls
data modify storage scdev:_ t.safe_mode.lines append value {text:" Calls:", bold:true, color:dark_purple}
execute unless data storage scdev:_ t.safe_mode.calls[0] run data modify storage scdev:_ t.safe_mode.lines append value {text:"  (none)", color:dark_gray}
execute if data storage scdev:_ t.safe_mode.calls[0] run function scdev:_/main/meta_info/safe_mode/start/calls/each

data modify storage scdev:_ t.safe_mode.lines append value {text:"--------------------", bold:true, color:light_purple}

data modify storage scdev:_ t.safe_mode.lines append value {text:"\"", color:light_purple, extra:[{text:"Safe calls finished.\" should be sent below."}], hover_event:{action:"show_text", value:[{text:"If no message is sent:\n - 'max_command_sequence_length' gamerule may need to be increased.\n - One or more packs may have an infinite loop in their safe mode function(s).", color:gray}]}}

# send:
data modify storage scdev:_/in send.lines set from storage scdev:_ t.safe_mode.lines
data modify storage scdev:_/in send.to_listeners set value true
function scdev:_/util/text/send/main