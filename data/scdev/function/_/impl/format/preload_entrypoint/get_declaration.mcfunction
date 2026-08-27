#> scdev : format/preload_entrypoint
# get_declaration
#--------------------
# ./main
#--------------------

$data modify storage scdev:_ eval[-1].v.declaration set from storage slimecore:data world.aux.installed_map.'$(pack_ref)'.pack.preload_entrypoints[{id:'$(id)'}]