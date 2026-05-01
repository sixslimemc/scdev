#> scdev:_/main/meta_info/rebuild/send_error/error/duplicate_ids/send
#--------------------
# ../../do
#--------------------

data modify storage scdev:_ t.error.lines append value {text: "> Multiple packs share pack IDs:", color:dark_red}
data modify storage scdev:_ t.error.sets set from storage slimecore:hook end.result.error.build_error.duplicate_pack_ids
execute if data storage scdev:_ t.error.sets[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/duplicate_ids/each_set
