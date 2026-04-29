#> scdev :-/ info/list/abstracts

$data modify storage scdev:_ v.abstracts.args set value $(args)

execute unless data storage scdev:_ v.abstracts.args.disabled run data modify storage scdev:_ v.abstracts.args.disabled set value false
execute unless data storage scdev:_ v.abstracts.args.page run data modify storage scdev:_ v.abstracts.args.page set value 1

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/list/abstracts/main
tag @s remove _scdev.info_runner

scoreboard players reset *abstracts.index _scdev
scoreboard players reset *abstracts.total _scdev
scoreboard players reset *abstracts.disabled _scdev
scoreboard players reset *abstracts.showing _scdev
data remove storage scdev:_ v.abstracts