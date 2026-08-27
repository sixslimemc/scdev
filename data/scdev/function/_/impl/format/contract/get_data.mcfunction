#> scdev : format/contract
# get_data
#--------------------
# ./main
#--------------------

$data modify storage scdev:_ v.contract.declaration set from storage slimecore:data world.aux.installed_map.'$(pack_ref)'.pack.contract_declarations[{id:'$(id)'}]
execute unless data storage scdev:_ v.contract.declaration run return 0
$data modify storage scdev:_ v.contract.satisfier set from storage slimecore:data build.aux.contract_map.'$(pack_ref)'.'$(id)'