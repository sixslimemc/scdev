#> scdev:_/main/meta_info/rebuild/send_success/build_packs/set
#--------------------
# ./each
#--------------------

# add to {..enables} if was disabled:
$execute if data storage scdev:_ data.pre_rebuild.world.aux.installed_map.'$(pack_id)'{disabled:true, pack:{author_id:'$(author_id)'}} run data modify storage scdev:_ t.success.enables append from storage scdev:_ t.success.this_pack

# remove from {..disables}:
$data remove storage scdev:_ t.success.disables[{pack_id:'$(pack_id)', author_id:'$(author_id)'}]

# DEBUG
$say $(pack_id)