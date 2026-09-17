# Ubuntu for Testing

> Scripts to easily install, manage and update tools on Ubuntu

## Motivation

- Testers and devs use multiple projects at the same machine causing version conflicts.

- Ubuntu does not come by default with support for several Linux app types.

- There is not an easy way to update all your apps at once

## What this repository does?

- It creates an unified process of update apps.

- Helps installations through a collection of installing scripts.

- Install the environments and tools focusing on stable and non conflicting dependencies.

## Setup

Clone this project and execute the `ubuntu-setup.sh` script:

```bash
git clone https://github.com/edumco/ubuntu-for-testing.git
cd ubuntu-for-testing && chmod +x ubuntu_setup.sh
./ubuntu_setup.sh
cd tools && chmod +x $(ls) && cd ..
cd environments && chmod +x $(ls) && cd ..
```

After the installations you'll be able to:

- Install Flatpak and AppImage apps

- Install apps directly from GitHub repositories

- Update all your apps with a single command: `update`

## How it works?

The main script installs some app managers (flatpak, AppManage and DRA), creates a local script to keep all update commands together  ('update.sh') and finally creates an alias to this script.

Every time you enter 'update' on the terminal, all the update and cleanup commands are executed.

To keep consistent behavior, every new environment script adds its own update and cleanup commands to the end of update file.

```bash
echo "uv self update && uv python upgrade && cache prune" >> ~/.update.sh 
```

## What else can I do?

You can install my selected and tested environments and tools:

### Environments

- [Python](/docs/python.md)
- [Java](/docs/java.md)
- [JavaScript and TypeScript](/docs/js.md)

### Tools

- [Screen Recording Tools](/tools/screen-recording.sh)
- [VS Code](/tools/vscode.sh)
- [API tools](/tools/api.sh)
- [Databases](/tools/databases.sh)
- [Performance](/tools/performance.sh)

## Last tip

If you want to install all scripts at once, got to the folder and run:  

```bash
cat $(ls) | sh 
```

## References

- <https://yarygintech.com/articles/flatpak-vs-snap-vs-appimage/>

- <https://flathub.org/>

- <https://www.appimagehub.com/>

- <https://github.com/kem-a/AppManager>
