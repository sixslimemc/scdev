# IMPL > scdev :-/ fetch_dependencies
# each_pack.1

# one-line:
$execute if score *fetch.compact _scdev matches 2 run data modify storage scdev:_ v.fetch.copy_segments append value '{optional:false, pack_id:"$(pack_id)", author_id:"$(author_id)", version:{major:$(ver_major), minor:$(ver_minor)}, download:{version:$(version), url:"$(url)"}}'
execute if score *fetch.compact _scdev matches 2 if data storage scdev:_ v.fetch.packs[1] run data modify storage scdev:_ v.fetch.copy_segments append value ", "
execute if score *fetch.compact _scdev matches 2 run return 1

# compact:
$execute if score *fetch.compact _scdev matches 1 run data modify storage scdev:_ v.fetch.copy_segments append value 'data modify storage slimecore:in manifest.pack.dependencies append value {optional:false, pack_id:"$(pack_id)", author_id:"$(author_id)", version:{major:$(ver_major), minor:$(ver_minor)}, download:{version:$(version), url:"$(url)"}}\n'
execute if score *fetch.compact _scdev matches 1 run return 1

# expanded:
data modify storage scdev:_ v.fetch.copy_segments append value 'data modify storage slimecore:in manifest.pack.dependencies append value \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '{ \\\n'
$data modify storage scdev:_ v.fetch.copy_segments append value '    pack_id: "$(pack_id)", \\\n'
$data modify storage scdev:_ v.fetch.copy_segments append value '    author_id: "$(author_id)", \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '    optional: false, \\\n'
$data modify storage scdev:_ v.fetch.copy_segments append value '    version: {major:$(ver_major), minor:$(ver_minor)}, \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '    download: \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '    { \\\n'
$data modify storage scdev:_ v.fetch.copy_segments append value '        version: $(version), \\\n'
$data modify storage scdev:_ v.fetch.copy_segments append value '        url: "$(url)" \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '    } \\\n'
data modify storage scdev:_ v.fetch.copy_segments append value '}\n'