#> scdev:_/sc/manifest
# @ MANIFEST

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "scdev"
data modify storage slimecore:in manifest.pack.author_id set value "sixslime"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value "https://github.com/sixslimemc/scdev/releases/download/v0.1.0/sixslime.scdev.0.1.0.zip"

data modify storage slimecore:in manifest.pack.display.name set value "SlimeCore Minimal Dev. Utility"
data modify storage slimecore:in manifest.pack.display.summary set value "Small utility for developing with SlimeCore."
data modify storage slimecore:in manifest.pack.display.author_name set value "SixSlime"

data modify storage slimecore:in manifest.pack.display.links.author set value "https://github.com/sixslimemc"
data modify storage slimecore:in manifest.pack.display.links.info set value "https://github.com/sixslimemc/scdev"
data modify storage slimecore:in manifest.pack.display.links.versions set value "https://github.com/sixslimemc/scdev/releases"

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value []

data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest


data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "a"
data modify storage slimecore:in manifest.pack.author_id set value "test"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value ""

data modify storage slimecore:in manifest.pack.display.name set value "TEST"
data modify storage slimecore:in manifest.pack.display.summary set value ""
data modify storage slimecore:in manifest.pack.display.author_name set value ""

data modify storage slimecore:in manifest.pack.display.links.author set value ""
data modify storage slimecore:in manifest.pack.display.links.info set value ""
data modify storage slimecore:in manifest.pack.display.links.versions set value ""

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value [{id:"bruh"}]
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value [{author_id:"test", pack_id:"b",download:{url:"",version:{major:0,minor:1,patch:0}}, optional:false, version:{major:0, minor:1}}]

data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "b"
data modify storage slimecore:in manifest.pack.author_id set value "test"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value ""

data modify storage slimecore:in manifest.pack.display.name set value "TEST"
data modify storage slimecore:in manifest.pack.display.summary set value ""
data modify storage slimecore:in manifest.pack.display.author_name set value ""

data modify storage slimecore:in manifest.pack.display.links.author set value ""
data modify storage slimecore:in manifest.pack.display.links.info set value ""
data modify storage slimecore:in manifest.pack.display.links.versions set value ""

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value [{pack_ref:"a",id:"bruh"}]
data modify storage slimecore:in manifest.pack.dependencies set value [{author_id:"test", pack_id:"a",download:{url:"",version:{major:0,minor:1,patch:0}}, optional:false, version:{major:0, minor:1}}]

data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "c"
data modify storage slimecore:in manifest.pack.author_id set value "test"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value ""

data modify storage slimecore:in manifest.pack.display.name set value "TEST"
data modify storage slimecore:in manifest.pack.display.summary set value ""
data modify storage slimecore:in manifest.pack.display.author_name set value ""

data modify storage slimecore:in manifest.pack.display.links.author set value ""
data modify storage slimecore:in manifest.pack.display.links.info set value ""
data modify storage slimecore:in manifest.pack.display.links.versions set value ""

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value [{author_id:"test", pack_id:"b",download:{url:"",version:{major:0,minor:1,patch:0}}, optional:false, version:{major:0, minor:1}}]

data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest