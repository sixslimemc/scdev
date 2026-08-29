#> scdev :-/ info/pack

$data modify storage scdev:_ v.packinfo.args set value $(args)

tag @s add _scdev.info_runner
execute summon text_display run function scdev:_/impl/-/info/pack/main with storage scdev:_ v.packinfo.args
tag @s remove _scdev.info_runner

data remove storage scdev:_ v.packinfo
scoreboard players reset *packinfo.disabled _scdev
scoreboard players reset *packinfo.library _scdev
