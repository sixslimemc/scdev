# IMPL > scdev :-/ manifest_template
# main

# set *format:
scoreboard players set *template.format _scdev 0
execute if data storage scdev:_ v.template.args{format:'github'} run scoreboard players set *template.format _scdev 1

data modify storage scdev:_ v.template.lines set value []
data modify storage scdev:_ v.template.separated_lines set value []

data modify storage scdev:_ v.template.lines append value "# MANIFEST"
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Pack Identity:'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.pack_id set value "PACK_ID"'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.author_id set value "AUTHOR_ID"'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.version set value {major:MAJOR_VER, minor:MINOR_VER, patch:PATCH_VER}'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.is_library set value false'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Dependencies:'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.dependencies set value []'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Load Specifications:'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.entrypoints set value []'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.preload_entrypoints set value []'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.abstract_declarations set value []'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.abstract_implementations set value []'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Display Information:'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.display.name set value "DISPLAY_NAME"'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.display.summary set value "DISPLAY_SUMMARY"'
data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.display.author_name set value "DISPLAY_AUTHOR_NAME"'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Display Links (optional):'
execute if score *template.format _scdev matches 0 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.info set value "INFO_WEBSITE"'
execute if score *template.format _scdev matches 1 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.info set value "https://github.com/GITHUB_USER/GITHUB_REPO"'
execute if score *template.format _scdev matches 0 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.author set value "AUTHOR_WEBSITE"'
execute if score *template.format _scdev matches 1 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.author set value "https://github.com/GITHUB_USER"'
execute if score *template.format _scdev matches 0 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.versions set value "VERSIONS_WEBSITE"'
execute if score *template.format _scdev matches 1 run data modify storage scdev:_ v.template.lines append value '# data modify storage slimecore:in manifest.pack.display.links.versions set value "https://github.com/GITHUB_USER/GITHUB_REPO/releases"'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value '# Direct Download URL:'
execute if score *template.format _scdev matches 0 run data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.url set value "https://TODO"'
execute if score *template.format _scdev matches 1 run data modify storage scdev:_ v.template.lines append value 'data modify storage slimecore:in manifest.pack.url set value "https://github.com/GITHUB_USER/GITHUB_REPO/releases/download/vMAJOR_VER.MINOR_VER.PATCH_VER/AUTHOR_ID.PACK_ID.MAJOR_VER.MINOR_VER.PATCH_VER.zip"'
data modify storage scdev:_ v.template.lines append value ''
data modify storage scdev:_ v.template.lines append value 'function slimecore:api/manifest'

# gen {..separated_lines}:
execute if data storage scdev:_ v.template.lines[0] run function scdev:_/impl/-/dev/manifest_template/each_line

# remove last newline:
data remove storage scdev:_ v.template.separated_lines[-1]

# get {..copy_string}:
data modify storage scdev:_/in concat.strings set from storage scdev:_ v.template.separated_lines
function scdev:_/util/concat/main
data modify storage scdev:_ v.template.copy_string set from storage scdev:_/out concat.result

# send:
data modify storage scdev:_/in send.lines set value [{text:"Copy manifest template to clipboard", color:white, underlined:true, hover_event:{action:"show_text", value:{text:"Click to copy", color:gray}}, click_event:{action:"copy_to_clipboard", value:""}}]
data modify storage scdev:_/in send.lines[0].click_event.value set from storage scdev:_ v.template.copy_string
data modify storage scdev:_/in send.source set value "scdev:-/dev/manifest_template"
function scdev:_/util/text/send/main
