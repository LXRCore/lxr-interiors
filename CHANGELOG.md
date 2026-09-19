# Changelog

## 3.0.0 — 2026-09-19
* LXRCore v3 release line: every resource ships as 3.0.0 from here (the entries below are the road to it).

## 3.0.0 — 2026-09-18

Rebuilt on the LXRCore v3 native API. The 9 000 lines of inline calls are gone; the map data is two tables.

* Entity sets and IMAP lists as data with a validator; retry-until-ready loop that ends
* `/interiors status | reload`; skip list; locales EN / KA; offline tests
