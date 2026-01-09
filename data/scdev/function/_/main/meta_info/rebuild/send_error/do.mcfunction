#> scdev:_/main/meta_info/rebuild/send_error/do
#--------------------
# ../end
#--------------------

tellraw @s [{storage:"scdev:_", nbt:"const.chat_marker", interpret:true}, {text:":", color:gray}]
tellraw @s {text:" Rebuild Error:", color: dark_red, bold:true}

execute if data storage slimecore:hook end.result.error.missing_datapack_paths run function scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/send
execute if data storage slimecore:hook end.result.error.build_error.invalid_packs run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/send
execute if data storage slimecore:hook end.result.error.build_error.duplicate_pack_ids run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/send
execute if data storage slimecore:hook end.result.error.build_error.multiple_implementations run function scdev:_/main/meta_info/rebuild/send_error/error/build/multiple_impls/send
execute if data storage slimecore:hook end.result.error.build_error.unfulfilled_dependencies run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_deps/send
execute if data storage slimecore:hook end.result.error.build_error.dependency_cycles run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/send
execute if data storage slimecore:hook end.result.error.build_error.entrypoint_order_conflicts run function scdev:_/main/meta_info/rebuild/send_error/error/build/entrypoint_conflicts/send

data remove storage scdev:_ t.error