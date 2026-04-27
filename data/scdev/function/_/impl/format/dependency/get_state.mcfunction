#> scdev : format/dependency
# get_state
#--------------------
# ./main
#--------------------
# sets *.state
# 0 - not installed
# 1 - installed, enabled
# 2 - installed, disabled
# 3 - installed, wrong author
# 4 - installed, incompatible version

# check installed:
execute unless data storage scdev:_ v.dependency.installed run return 0

# check wrong author:
data modify storage scdev:_ x.author set from storage scdev:_ v.dependency.data.author_id
execute store success score *x _scdev run data modify storage scdev:_ x.author set from storage scdev:_ v.dependency.installed.pack.author_id
execute if score *x _scdev matches 1 run return 3

# set {..installed_ver_text}:
data modify storage scdev:in version.value set from storage scdev:_ v.dependency.installed.pack.version
data modify storage scdev:in version.use_this_entity set value true
function scdev:format/version
data modify storage scdev:_ v.dependency.installed_ver_text set from storage scdev:out version.result

# check version:
data modify storage slimecore:in version_req.requirement set from storage scdev:_ v.dependency.data.version
data modify storage slimecore:in version_req.version set from storage scdev:_ v.dependency.installed.pack.version
function slimecore:eval/version_req
execute if data storage slimecore:out version_req.result.error run return 4

# check disabled:
execute store success score *x _scdev if data storage scdev:_ v.dependency.installed{disabled:true}
execute if score *x _scdev matches 1 run return 2

# installed, enabled:
return 1