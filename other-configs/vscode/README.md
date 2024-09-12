# Visual Studio Code
[Site](https://code.visualstudio.com/download)
OS: Windows (x86 and ARM64), MacOS (Intel, Apple Silicon), Linux (x86, ARM32, ARM64, Snap)

# Instructions
Ensure that the `code` command is installed.
This should be done automatically in Windows and Linux.
On MacOS, open VSCode and use ⇧⌘P to open the command palette.
Search for and run `Shell Command: Install 'code' command in PATH`.

Use `which code` to ensure it is installed and available.

Run `bash extensions.sh` to install all the extensions.

Copy `settings.json` into the appropriate directory based on your OS.
- Windows: `%APPDATA%\Code\User`
- MacOS:`~/Library/Application Support/Code/User/`
- Linux: `~/.config/Code/User`
