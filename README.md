# LocalChat
LocalChat is a resource for FiveM by Albo1125 that provides local text & voice chat functionality (needs to be adapted if you want to use it with OneSync Infinity). It is available at [https://github.com/Albo1125/LocalChat](https://github.com/Albo1125/LocalChat)

## Installation & Usage
1. Download the latest release.
2. Unzip the LocalChat folder into your resources folder on your FiveM server.
3. Add the following to your server.cfg file:
```text
ensure LocalChat
```
4. Optionally, customise the command and the chat prefixes in `sv_LocalChat.lua`.
5. Optionally, customise the local chat range and chat colours in `cl_LocalChat.lua`.

## Commands & Controls
* /tcl - Toggles between local and global chat.

## Improvements & Licencing
Please view the license. Improvements and new feature additions are very welcome, please feel free to create a pull request. As a guideline, please do not release separate versions with minor modifications, but contribute to this repository directly. However, if you really do wish to release modified versions of my work, proper credit is always required and you should always link back to this original source and respect the licence.
