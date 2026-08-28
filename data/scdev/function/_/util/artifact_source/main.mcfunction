#> scdev :_/util/ artifact_source
#--------------------
# -> pack_ref: PackId
# ~> id?: string
# ~> id_path?: StructPath (path to array with elements with 'id' key)
#--------------------
# <- source?: PackManifest
# <- declaration?: struct (the original declaration object of the artifact referenced)
# <- tag_text: Text (should be appended to hover text)
# <- tag_prefix: Text (should be prepended to show text)
#--------------------
# 
#--------------------
# 1: source installed and enabled.
# 2: source installed but disabled.
# 3: source installed but artifact does not exist.
# 4: source not installed.
#--------------------

data modify storage scdev:_/out artifact_source set value {tag_text:"", tag_prefix:""}

execute unless data storage scdev:_/in artifact_source.id store result score *x _scdev run function scdev:_/util/artifact_source/just_pack with storage scdev:_/in artifact_source
execute if data storage scdev:_/in artifact_source.id store result score *x _scdev run function scdev:_/util/artifact_source/artifact with storage scdev:_/in artifact_source

data remove storage scdev:_ u.artifact_source
data remove storage scdev:_/in artifact_source

return run scoreboard players get *x _scdev