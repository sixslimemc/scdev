
$data modify storage scdev:_/in pack set value {pack_id:"$(pack)", kill:true}
execute summon text_display run function scdev:_/util/format/pack/main
tellraw @s {storage:"scdev:_/out", nbt:"pack.result", interpret:true}