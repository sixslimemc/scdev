#> scdev :-/ info/list/packs/args

$data modify storage scdev:_ v.packs.args set value $(args)

execute unless data storage scdev:_ v.packs.args.disabled run data modify storage scdev:_ v.packs.args.disabled set value false
execute unless data storage scdev:_ v.packs.args.page run data modify storage scdev:_ v.packs.args.page set value 1

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/list/packs/main
tag @s remove _scdev.info_runner

scoreboard players reset *packs.index _scdev
scoreboard players reset *packs.showing _scdev
scoreboard players reset *packs.disabled _scdev
data remove storage scdev:_ v.packs