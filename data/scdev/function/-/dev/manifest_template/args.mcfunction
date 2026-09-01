#> scdev :-/ manifest_template/args

$data modify storage scdev:_ v.template.args set value $(args)

function scdev:_/impl/-/dev/manifest_template/main

scoreboard players reset *template.format _scdev
data remove storage scdev:_ v.template