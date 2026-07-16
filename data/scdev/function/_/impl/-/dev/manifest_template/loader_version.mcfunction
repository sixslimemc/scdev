# IMPL > scdev :-/ manifest_template
# loader_version
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.template.lines append value '# Loader Version:'
$data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.loader_version set value {major:$(major), minor:$(minor)}'