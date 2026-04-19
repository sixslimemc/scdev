#> scdev:_/main/meta_info/rebuild/start
#--------------------
# HOOK: slimecore::meta_info/rebuild/start
#--------------------

tellraw @a[tag=scdev.listener] [{storage:"scdev:_", nbt:"const.chat_marker",interpret:true}, {text:" Rebuilding...", color:blue}]

# store the last build before rebuilding:
data modify storage scdev:_ data.last_build set from storage slimecore:data build