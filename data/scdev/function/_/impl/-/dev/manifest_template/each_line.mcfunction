# IMPL > scdev :-/ manifest_template
# each_line
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.template.separated_lines append from storage scdev:_ v.template.lines[0]
data modify storage scdev:_ v.template.separated_lines append value "\n"

data remove storage scdev:_ v.template.lines[0]
execute if data storage scdev:_ v.template.lines[0] run function scdev:_/impl/-/dev/manifest_template/each_line
