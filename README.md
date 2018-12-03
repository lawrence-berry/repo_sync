# Repo Sync

## Overview

Sync Github repositories automatically.

## Status

Working on OS X

## Usage

Add repo paths to `sync.sh` and run `install.sh`. `.plist` file is copied to
`/Library/LaunchAgents/` and invokes `sync.sh` every minute.

## LaunchD

TO stop a process you need to call both stop and unload

```
launchctl stop repo_sync.plist
launchctl unload repo_sync.plist
```

## Other commands

```
launchctl list | grep repo_sync
```

