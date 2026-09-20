# Linux machine administration

Tools in `bin/` are on PATH: `health-check`, `cleanup`, `setup-firewall`,
`revert-mac-keys`. Facts about **this specific machine** — hardware, disk UUIDs,
past incidents, exact working config — live in `local/MACHINE.md` (untracked).
Read that too; it is usually faster than rediscovering.

This file is **portable knowledge only**: things true on any Linux box.

## Shell / agent traps — these fail silently and cost real time

- `python3` may be a **pyenv shim**. For system modules (pyudev, gi, evdev) use `/usr/bin/python3`.
- In **zsh**, unquoted `$VAR` is *not* word-split. `apt-get purge $PKGS` passes ONE
  argument and cheerfully reports "0 packages". Use arrays: `"${PKGS[@]}"`.
- `pgrep -f <pattern>` / `pkill -f` match **the agent's own shell**, because the pattern
  appears in its command line. This kills the session. Match by PID.
- An agent shell has **no tty**, so `sudo` cannot prompt. Use `pkexec`, or a sudoers
  drop-in with `timestamp_type=global` primed once by `sudo -v` in a real terminal.
- Check whether `jq` and `rg` are installed before reaching for `python3` and `grep`.

## Disks

- **Device names are not stable.** NVMe enumeration can swap across a reboot. Always
  identify partitions by UUID, in fstab and in scripts.
- Every non-essential fstab entry needs **`nofail`** and `x-systemd.device-timeout`.
  Without them a missing disk fails `local-fs.target`, which triggers `emergency.target`
  and the machine never reaches a login screen.
- For a removable disk prefer `noauto,x-systemd.automount` so it mounts on access.
- `pass` field > 0 runs fsck — make sure the fsck helper for that filesystem exists
  (e.g. `exfatprogs` for exfat) or the mount fails even when the disk IS present.

## Packages

- Before `apt autoremove`, check it is not proposing to remove the **live GPU driver**.
  If the vendor metapackage is absent nothing owns the driver stack and apt treats it
  as orphaned. `apt-mark manual` it — **including `:i386` variants**: `dpkg-query
  '${Package}'` omits the architecture, so use `'${Package}:${Architecture}'`.
- `autoremove --purge` prints `Purg` lines, not `Remv` — grepping for the wrong one
  makes a dangerous operation look like a no-op.
- Check for **Steam / Wine** before removing "orphaned" `:i386` graphics libraries.
- `do-release-upgrade` **disables third-party apt repos** and never re-enables them.
  Audit after every release upgrade or packages silently stop updating for months.
- An apt `.sources` file with no `Signed-By:` line fails GPG verification even when
  the key is installed — the entry must point at the keyring.

## Services

- `systemctl is-active ufw` reports on the **service**, not the firewall. It can say
  `active` while `ufw status` says inactive. Always check `ufw status`.
- A firewall that denies all inbound breaks **Chromecast casting** — the Chromecast
  connects *back* to the host on a random high port. Allow the LAN subnet.
- smartd monitors disks but its default alert path is `-m root` via an MTA. With no
  MTA installed the warnings are silently discarded. Add a `run.d/` hook that uses
  `notify-send` instead.
- Cap `SystemMaxUse` in `/etc/systemd/journald.conf`; uncapped it grows to ~10% of
  the filesystem.

## Input devices (Wayland/GNOME)

- libinput only routes key events from devices tagged `ID_INPUT_KEYBOARD`. A mouse
  remapped to emit a key needs a udev rule adding that tag, or the key is discarded.
- `hwdb` remaps scancode→keycode, but the resulting **keysym depends on the keymap** —
  evdev keycode 191 is `XF86Tools`, not `F13`. Check with `xmodmap -pke`.
- mutter reads device classification **only when it builds its seat at session start**.
  Replugging is not enough; a full logout is required.

## Third-party APIs

- Jellyfin v12 dropped `?api_key=` and `X-Emby-Token`. Only
  `-H 'Authorization: MediaBrowser Token="<key>"'` works.
- Bitbucket removed app-password auth over HTTPS (CHANGE-3222, error 410). Switch
  remotes to SSH.
- Store credentials an agent needs in `pass`, then use them without ever pasting them:
  `curl -H "Authorization: ... $(pass show Service/api-key)"`.

## General

- Back up anything under `/etc` before editing; keep copies in `local/backups/`.
- Verify a destructive operation with a dry run first, and check the safety grep
  actually matches the real output format.
