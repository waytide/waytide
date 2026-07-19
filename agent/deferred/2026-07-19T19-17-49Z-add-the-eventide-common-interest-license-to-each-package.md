# Add the Eventide Common Interest License to each package

Waytide will be licensed under a **custom license — the Eventide Common Interest License (ECIL)** — which Scott will create in the near future. It is **not MIT** or any existing license. The license text does not exist yet.

When the ECIL exists, add it as a `LICENSE` file to **each package directory** — `foundation/`, `language/`, `testing/`, `code/ruby/`, `git/`, `plan/`, `design-by-efferent/` — and to the composite root. It must be per-package because `git subtree` carries only a package's own directory: a root `LICENSE` would **not** travel to the component repos. Exempt the per-package `LICENSE` from the ISO-8601 filename prefix as a structural file (alongside `README.md`, `install-dependencies.sh`, `vocabulary.md`).

**Sequencing — this gates the public release.** Publishing the packages with no license leaves them "all rights reserved" by default, which contradicts the free-open-source intent and undercuts the credibility purpose. So the **first Waytide release should wait for the ECIL**, or ship with a clear "license: Eventide Common Interest License — forthcoming" placeholder. Creating the empty `waytide/*` repos is independent and fine before the license exists.

**Gated on:** the ECIL text existing (Scott to write it).

**Why:** an open-source project needs a license to actually be open source; without one, nobody can legally use it, so the credibility goal fails. The per-package placement is a real distribution constraint, not a preference.

**How to apply:** once Scott provides the ECIL text, add `LICENSE` to each package directory and the composite root, note the structural-file exemption in foundation's filename rule, and include it in the release. Related: [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]] (the first release should carry the license).
