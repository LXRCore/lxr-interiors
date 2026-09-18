<img src="https://raw.githubusercontent.com/LXRCore/.github/main/profile/lxrcore-logo.png" alt="LXRCore" width="72" align="left" style="margin-right:12px">

# lxr-interiors — The rooms the game leaves shut, for LXRCore

Banks, saloons, stores and houses the base game keeps bare or closed:
entity sets (furniture, windows, lights) per interior and IMAP pieces to
request or remove, all as data in `data/`. The client applies them once,
retrying until each interior has streamed in, then goes idle. There is no
interface; this is the stage, not the play.

## What it does

* **Entity sets** — `data/sets.lua`: `{ id, label, sets = { ... } }` per
  interior (33 interiors, 490 sets as shipped). Applied when the interior
  reports ready; `Config.Interiors.skip` leaves listed ids alone.
* **IMAPs** — `data/imaps.lua`: `Request` and `Remove` lists of hashes.
* **Retry** — every `retrySeconds` until nothing is pending or
  `giveUpMinutes` passes.
* **Staff** — `/interiors status` and `/interiors reload` (permission
  `admin`); `Validate()` prints data problems at boot.

## Install

```cfg
ensure lxr-core
ensure lxr-interiors
```

## API

| Name | Side | Purpose |
|---|---|---|
| `SetActive(interior, set, on)` | client | toggle one entity set |
| `Reload()` | client | apply everything again |
| `Applied()` | client | labels of dressed interiors |

## Licence

© 2026 iBoss21 / LXRCore — All Rights Reserved. See `LICENSE`.
