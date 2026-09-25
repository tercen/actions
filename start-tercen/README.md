# start-tercen

Starts a local Tercen instance (postgres 16 + redis + ha-scheduler +
worker-mode tercen, all 1.1.x-era) to run tests against.

Each tercen service runs its own podman (podman-init starts the podman
system service inside the container) — **no dind**, nothing shared between
services except the `tercen-data` volume (operator tree + renv cache).

```yaml
- uses: tercen/actions/start-tercen@main
  with:
    branch: 1.1.10   # required, explicit image tag
    sarno-tag: 1.2.5
```

`branch` is the tercen/tercen image tag — required, no silent default.
`github-token` (optional) provides ghcr auth + a renv PAT; only pass it on
>=1.1.10 (launch-line redaction).
