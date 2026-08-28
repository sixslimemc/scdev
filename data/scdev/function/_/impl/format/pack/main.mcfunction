# IMPL > scdev : format/pack
# main
execute unless score *pack.use_self _scdev matches 1 run kill @s

# 'slimecore' special case:
execute unless data storage scdev:in pack.pack if data storage scdev:in pack.reference{pack_ref:'slimecore'} run data modify storage scdev:in pack.pack set from storage slimecore:data slimecore

# set *.direct:
execute store success score *pack.is_direct _scdev if data storage scdev:in pack.pack

# set {..pack} if direct:
data remove storage scdev:_ v.pack.pack
data modify storage scdev:_ v.pack.pack set from storage scdev:in pack.pack

# set {..asource} and {..pack} if not direct:
execute if score *pack.is_direct _scdev matches 0 run data modify storage scdev:_/in artifact_source.pack_ref set from storage scdev:_ v.pack.reference.pack_ref
execute if score *pack.is_direct _scdev matches 0 run function scdev:_/util/artifact_source/main
execute if score *pack.is_direct _scdev matches 0 run data modify storage scdev:_ v.pack.asource set from storage scdev:_/out artifact_source
execute if score *pack.is_direct _scdev matches 0 run data modify storage scdev:_ v.pack.pack set from storage scdev:_/out artifact_source.source

# return early if invalid reference:
execute unless data storage scdev:_ v.pack.pack run return run function scdev:_/impl/format/pack/invalid_reference

# BUILD {..show_text}

# set *.is_library:
execute store success score *pack.is_library _scdev if data storage scdev:_ v.pack.pack{is_library:true}

# init {..show_text}:
data modify storage scdev:_ v.pack.show_text set value {text:"", color:aqua, italic:false, extra:[{text:"AUTHOR_ID"}, {text:"."}, {text:"PACK_ID"}]}
data modify storage scdev:_ v.pack.show_text.extra[0].text set from storage scdev:_ v.pack.pack.author_id
data modify storage scdev:_ v.pack.show_text.extra[2].text set from storage scdev:_ v.pack.pack.pack_id
execute if score *pack.is_library _scdev matches 1 run data modify storage scdev:_ v.pack.show_text.color set value dark_aqua

# set {..name_text}:
data modify storage scdev:_ v.pack.name_text set value {text:"DISPLAY NAME", color:aqua}
data modify storage scdev:_ v.pack.name_text.text set from storage scdev:_ v.pack.pack.display.name
execute if score *pack.is_library _scdev matches 1 run data modify storage scdev:_ v.pack.name_text.color set value "dark_aqua"

# set {..version_text}:
data modify storage scdev:in version.value set from storage scdev:_ v.pack.pack.version
function scdev:format/version
data modify storage scdev:_ v.pack.version_text set from storage scdev:out version.result

# set {..summary_text}:
data modify storage scdev:_ v.pack.summary_text set value {text:"SUMMARY", color:gray}
data modify storage scdev:_ v.pack.summary_text.text set from storage scdev:_ v.pack.pack.display.summary

# set {..author_text}:
data modify storage scdev:_ v.pack.author_text set value {text:"AUTHOR NAME", color:blue, italic:false}
data modify storage scdev:_ v.pack.author_text.text set from storage scdev:_ v.pack.pack.display.author_name

# set {..library_text}:
data modify storage scdev:_ v.pack.library_text set value {text:"\nLibrary", color:dark_gray}

# build {..hover_extra}:
data modify storage scdev:_ v.pack.hover_extra set value []
data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.name_text
data modify storage scdev:_ v.pack.hover_extra append value " "
data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.version_text
execute if score *pack.is_library _scdev matches 1 run data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.library_text
data modify storage scdev:_ v.pack.hover_extra append value "\n"
data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.summary_text
data modify storage scdev:_ v.pack.hover_extra append value "\n"
data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.author_text

# immediately finalize if direct:
execute if score *pack.is_direct _scdev matches 1 run return run function scdev:_/impl/format/pack/finalize

# construct click:
data modify storage scdev:_/in click_pack.pack_id set from storage scdev:_ v.pack.pack.pack_id
function scdev:_/util/text/click_pack/main
data modify storage scdev:_ v.pack.show_text.click_event set from storage scdev:_/out click_pack.result

# affix {..asource} tags:
data modify storage scdev:_ v.pack.hover_extra append from storage scdev:_ v.pack.asource.tag_text
data modify storage scdev:_ v.pack.show_text.extra prepend from storage scdev:_ v.pack.asource.tag_prefix

# finalize
function scdev:_/impl/format/pack/finalize