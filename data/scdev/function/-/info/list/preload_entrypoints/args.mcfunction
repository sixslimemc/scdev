#> scdev :-/ info/list/preload_entrypoints/args

$data modify storage scdev:_ v.preload_entrypoints.args set value $(args)

execute unless data storage scdev:_ v.preload_entrypoints.args.disabled run data modify storage scdev:_ v.preload_entrypoints.args.disabled set value false
execute unless data storage scdev:_ v.preload_entrypoints.args.page run data modify storage scdev:_ v.preload_entrypoints.args.page set value 1

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/list/preload_entrypoints/main
tag @s remove _scdev.info_runner

scoreboard players reset *preload_entrypoints.index _scdev
scoreboard players reset *preload_entrypoints.total _scdev
scoreboard players reset *preload_entrypoints.disabled _scdev
scoreboard players reset *preload_entrypoints.showing _scdev
data remove storage scdev:_ v.preload_entrypoints