#> scdev:_/main/meta_info/safe_mode/start/do
#--------------------
# ../start
#--------------------
kill @s

data modify storage scdev:_ t.safe_mode.lines set value []

data modify storage scdev:_ t.safe_mode.lines append value {text:"--[ Safe Mode ]-----", bold:true, color:light_purple}

data remove storage scdev:_ t.safe_mode.calls
data modify storage scdev:_ t.safe_mode.calls set from storage slimecore:data world.safe_mode.calls
execute if data storage scdev:_ t.safe_mode.calls[0] run data modify storage scdev:_ t.safe_mode.lines append value {text:"Calls:"}

data modify storage scdev:_ t.safe_mode.lines append value {text:"--------------------", bold:true, color:light_purple}