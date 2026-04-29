#> scdev :-/ info/list/entrypoints

$data modify storage scdev:_ v.entrypoints.args set value $(args)

execute unless data storage scdev:_ v.entrypoints.args.disabled run data modify storage scdev:_ v.entrypoints.args.disabled set value false
execute unless data storage scdev:_ v.entrypoints.args.page run data modify storage scdev:_ v.entrypoints.args.page set value 1

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/list/entrypoints/main
tag @s remove _scdev.info_runner

scoreboard players reset *entrypoints.index _scdev
scoreboard players reset *entrypoints.total_enabled _scdev
scoreboard players reset *entrypoints.total_disabled _scdev
scoreboard players reset *entrypoints.showing _scdev
data remove storage scdev:_ v.entrypoints