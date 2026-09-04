#> scdev:_/main/meta_info/rebuild/send_success/do
#--------------------
# ../end
#--------------------

# each pack in current build:
# - populate {..disables} : [PackManifest]
# - populate {..enables} : [PackManifest]
data modify storage scdev:_ t.success.enables set value []
data modify storage scdev:_ t.success.disables set value []
data modify storage scdev:_ t.success.disables append from storage scdev:_ data.pre_rebuild.world.installed[{disabled:false}].pack

data modify storage scdev:_ t.success.build_packs set from storage slimecore:data build.packs
execute if data storage scdev:_ t.success.build_packs[0] run function scdev:_/main/meta_info/rebuild/send_success/build_packs/each

# each pack currently installed:
# - populate {..installs} : [InstalledPackInfo]
# - populate {..uninstalls} : [InstalledPackInfo]
# - populate {..manifest_changes} : [PackManifest]
data modify storage scdev:_ t.success.installs set value []
data modify storage scdev:_ t.success.uninstalls set from storage scdev:_ data.pre_rebuild.world.installed
data modify storage scdev:_ t.success.installed set from storage slimecore:data world.installed
execute if data storage scdev:_ t.success.installed[0] run function scdev:_/main/meta_info/rebuild/send_success/installed/each

# send message:
execute summon minecraft:text_display run function scdev:_/main/meta_info/rebuild/send_success/message/do

data remove storage scdev:_ t.success
scoreboard players reset *success.any_changes _scdev