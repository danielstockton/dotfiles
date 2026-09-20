# Linux machine administration

Tools in `bin/` are on PATH as `health-check`, `cleanup`, `revert-mac-keys`.
Facts about **this specific machine** live in `local/MACHINE.md` (untracked —
hardware, UUIDs, past incidents, exact working config). Read it before
diagnosing anything; it is usually faster than rediscovering.

## Environment traps — these fail silently and cost real time

- `python3` may be **pyenv's**. For system modules (pyudev, gi, evdev) use `/usr/bin/python3`.
- In **zsh**, unquoted `$VAR` is *not* word-split. `apt-get purge $PKGS` passes ONE argument
  and reports "0 packages". Use arrays: `PKGS=(a b c)` then `"${PKGS[@]}"`.
- `pgrep -f <pattern>` / `pkill -f` match **the agent's own shell**, because the pattern is in
  its command line. This kills the session. Match by PID instead.
- An agent shell has **no tty**, so `sudo` cannot prompt. Use `pkexec`, or a
  `timestamp_type=global` sudoers drop-in primed by `sudo -v` in a real terminal.
- **Device names are not stable.** NVMe enumeration can swap across reboots. Always use UUIDs
  in fstab and when identifying disks.
- Before `apt autoremove`, check it is not proposing to remove the **live GPU driver** — if the
  vendor metapackage is absent, nothing owns the driver stack and apt considers it orphaned.
  `apt-mark manual` it, **including `:i386` variants** (`dpkg-query '${Package}'` omits the
  architecture suffix; use `'${Package}:${Architecture}'`).
- `do-release-upgrade` **disables third-party apt repos** and does not re-enable them. Check
  after every release upgrade or packages silently stop updating for months.
- Back up anything under `/etc` before editing; keep copies in `local/backups/`.
