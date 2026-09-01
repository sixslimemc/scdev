#> scdev :-/ fetch_dependencies/args

$data modify storage scdev:_ v.fetch.args set value $(args)
$data modify storage scdev:_ v.fetch.args.pack_ids set value $(pack_ids)

function scdev:_/impl/-/dev/fetch_dependencies/main

scoreboard players reset *template.compact _scdev
data remove storage scdev:_ v.fetch
