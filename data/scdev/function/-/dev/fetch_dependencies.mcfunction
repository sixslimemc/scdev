#> scdev :-/ fetch_dependencies

$data modify storage scdev:_ v.fetch.args set value $(args)

function scdev:_/impl/-/dev/fetch_dependencies/main

scoreboard players reset *template.compact _scdev
data remove storage scdev:_ v.fetch