#> scdev :_/util/ text/unquoted
#--------------------
# -> strings: [string]
# => kill: bool = false
#--------------------
# <- result: [{text: string}]
#--------------------
# turns <str> into a plain {text: <str>} text component.
# MUST be ran as a text_display.
#--------------------
# 1.
#--------------------

data modify storage scdev:_/out unquoted set value {result:[]}

execute if data storage scdev:_/in unquoted.strings[0] run function scdev:_/util/text/unquoted/each

execute if data storage scdev:_/in unquoted{kill:true} run kill @s
data remove storage scdev:_/in unquoted

return 1