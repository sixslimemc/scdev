# SlimeCore Minimal Dev. Utility | `scdev`

**ID:** `sixslime.scdev`

> Small utility for developing with SlimeCore.

## Description

### Listen To SlimeCore Events

Players with the `scdev.listen` entity tag recieve info in chat when SlimeCore events occur (load/entrypoint order on reload, rebuild status messages, etc.).

### Functions

Provides `scdev:-/rebuild`, a command-line friendly wrapper around `slimecore:rebuild`, and `scdev:-/quick_deps`, a function to quickly generate the `dependencies` manifest-function input.