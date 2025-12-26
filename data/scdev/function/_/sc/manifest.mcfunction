#> scdev:_/sc/manifest
# @ MANIFEST

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "scdev"
data modify storage slimecore:in manifest.pack.author_id set value "sixslime"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value "TODO"

data modify storage slimecore:in manifest.pack.display.name set value "TODO"
data modify storage slimecore:in manifest.pack.display.summary set value "TODO"
data modify storage slimecore:in manifest.pack.display.author_name set value "SixSlime"

data modify storage slimecore:in manifest.pack.display.links.author set value "https://github.com/sixslimemc"
data modify storage slimecore:in manifest.pack.display.links.info set value "https://github.com/sixslimemc/scdev"
# data modify storage slimecore:in manifest.pack.display.links.versions set value "TODO"

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.entrypoints append value {id:"tick"}
# data modify storage slimecore:in manifest.pack.entrypoints append value {id:"ID", before:[{pack_ref:"PACK", id:"ID"}]}

data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
# data modify storage slimecore:in manifest.pack.preload_entrypoints append value {id:"ID", before:[{pack_ref:"PACK", id:"ID"}]}

data modify storage slimecore:in manifest.pack.abstract_declarations set value []
# data modify storage slimecore:in manifest.pack.abstract_declarations append value "ID"

data modify storage slimecore:in manifest.pack.abstract_implementations set value []
# data modify storage slimecore:in manifest.pack.abstract_implementations append value {pack_ref:"PACK", id:"ID"}

data modify storage slimecore:in manifest.pack.dependencies set value []
# data modify storage slimecore:in manifest.pack.dependencies append value {pack_id:"six", author_id:"sixslime", optional:false, version:{major:0, minor:1}, download:{url:"TODO", version:{major:1, minor:0, patch:0}}}

data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest