#> scdev :-/ info/list/contracts/args

$data modify storage scdev:_ v.contracts.args set value $(args)

execute unless data storage scdev:_ v.contracts.args.disabled run data modify storage scdev:_ v.contracts.args.disabled set value false
execute unless data storage scdev:_ v.contracts.args.page run data modify storage scdev:_ v.contracts.args.page set value 1

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/list/contracts/main
tag @s remove _scdev.info_runner

scoreboard players reset *contracts.index _scdev
scoreboard players reset *contracts.total _scdev
scoreboard players reset *contracts.disabled _scdev
scoreboard players reset *contracts.showing _scdev
data remove storage scdev:_ v.contracts