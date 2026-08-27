#> scdev : format/entrypoint
# undeclared
#--------------------
# ./main
#--------------------

# build {..hover_extra}:
data modify storage scdev:_ eval[-1].v.hover_extra set value []
data modify storage scdev:_ eval[-1].v.hover_extra append from storage scdev:_ eval[-1].v.tag_text
data modify storage scdev:_ eval[-1].v.hover_extra append value "\n"
data modify storage scdev:_ eval[-1].v.hover_extra append value {text:"[`] Untracked/uninitialized", color:dark_red}

# set hover event:
data modify storage scdev:_ eval[-1].v.show_text.hover_event set value {action:"show_text", value:{text:"", color:white, italic:false, extra:[]}}
data modify storage scdev:_ eval[-1].v.show_text.hover_event.value.extra set from storage scdev:_ eval[-1].v.hover_extra

# add '`' marker:
data modify storage scdev:_ eval[-1].v.show_text.extra prepend value {text:"`", color:dark_red}