#> scdev :-/ rebuild

$data modify storage scdev:_ v.rebuild.args set value $(args)

function scdev:_/impl/-/rebuild/main
data remove storage scdev:_ v.rebulid

return 1