#> scdev:_/main/meta_info/rebuild/send_success/installed/each
#--------------------
# ../do
#--------------------

data modify storage scdev:_ t.success.this_installed set from storage scdev:_ t.success.installed[-1]



data remove storage scdev:_ t.success.installed[-1]
execute if data storage scdev:_ t.success.installed[0] run function scdev:_/main/meta_info/rebuild/send_success/installed/each