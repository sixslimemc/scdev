#> scdev:_/main/meta_info/rebuild/send_success/installed/set
#--------------------
# ./each
#--------------------

# remove from {..uninstalls}:
$data remove storage scdev:_ t.success.uninstalls[{pack:{pack_id:'$(pack_id)', author_id:'$(author_id)'}}]

# append to {..manifest_changes} if changed:
# append to {..installs} if new:
data remove storage scdev:_ t.success.old_pack
$data modify storage scdev:_ t.success.old_pack set from storage scdev:_ data.pre_rebuild.world.aux.installed_map.'$(pack_id)'.pack{author_id:'$(author_id)'}
execute unless data storage scdev:_ t.success.old_pack run data modify storage scdev:_ t.success.installs append from storage scdev:_ t.success.this_installed
scoreboard players set *x _scdev 0
execute if data storage scdev:_ t.success.old_pack store success score *x _scdev run data modify storage scdev:_ t.success.old_pack set from storage scdev:_ t.success.this_installed.pack
execute if score *x _scdev matches 1 run data modify storage scdev:_ t.success.manifest_changes append from storage scdev:_ t.success.this_installed.pack