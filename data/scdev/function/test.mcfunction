
$data modify storage scdev:_/in pack.pack_id set value "$(pack)"
function scdev:_/util/format/pack/main
tellraw @s {storage:"scdev:_/out", nbt:"pack.result", interpret:true}