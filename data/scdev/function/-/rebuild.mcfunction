#> scdev :-/ rebuild

$data modify storage scdev:_ v.rebuild.args set value $(args)

execute if data storage scdev:_ v.rebuild.args{clean:true} run data modify storage scdev:_ v.rebuild.args.disable set value []
execute if data storage scdev:_ v.rebuild.args{clean:true} run data modify storage scdev:_ v.rebuild.args.enable set value []
function scdev:_/impl/-/rebuild/main
data remove storage scdev:_ v.rebulid

return 1