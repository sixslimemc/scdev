#> scdev : format/entrypoint
# get_declaration
#--------------------
# ./main
#--------------------

$data modify storage scdev:_ v.entrypoint.declaration set from storage slimecore:data world.aux.installed_map.'$(pack_ref)'.pack.entrypoints[{id:'$(id)'}]