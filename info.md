### What is ADB?
ADB, or **Android Debug Bridge**, is a versatile command-line tool that allows developers and advanced users to communicate with an Android device. It can be used to 

- **Mirroring the screen**: Display your Android device's screen on your computer.
- **Installing and uninstalling apps**: Push or remove applications directly from your computer.
- **Accessing logs**: Retrieve system logs for debugging purposes.
- **File transfer**: Move files between your computer and the device.
- **Running shell commands**: Execute commands directly on the device.
- **others**
---

### How Does ADB Work?
ADB works by establishing a connection between your computer and the Android device. Here’s how it functions in both USB and wireless modes:

1. **USB Mode**:
   - The device is connected to the computer via a USB cable.
   - ADB communicates with the device through the USB interface.
   - This method is reliable but limits mobility due to the physical connection.

2. **Wireless Mode**:
   - The device and computer are connected to the same Wi-Fi network.
   - ADB communicates over the network, eliminating the need for a USB cable.
   - This method offers greater flexibility, allowing you to control your device from anywhere within the network range.

---

## WADBD
This is a simple module which simplifies the process of enabling wireless ADB on any Android device. It provides two interfaces for enabling wireless ADB:

## KernelSU WebUI :
   - A web ui that allows you to enable wireless ADB for current session or on boot with just few clicks 
   - No need for terminal commands or technical expertise.

<div style="display: flex; justify-content: center; align-items: center;">
  <img src="https://github.com/rhythmcache/wireless-adb-controller/raw/main/e1.png" alt="WebUI Screenshot" width="45%">
  <img src="https://github.com/rhythmcache/wireless-adb-controller/raw/main/e2.png" alt="KernelSU Screenshot" width="45%">
</div>

## Terminal
   - A command-line interface for doing the same.
   - It has some extra experimental features
---


### Terminal Commands

```
wadbd on <port>
```
- Enables Wireless ADB on specified port and displays the necessary commands to connect to your phone wirelessly.
- default port is 5555 if not specified while running the command

```
wadbd status
```
- Displays whether Wireless ADB is currently running or not.

```
wadbd off
```
- Disables Wireless ADB.

```
wadbd enable-on-boot <port>
```
- enables wireless adbd automatically on boot on specified port
(default 5555 if not specified)
```
wadbd disable-on-boot
```
- Disables wirelss adbd on boot


#### Experimental - Commands
```
wadbd --import-key <path>
```
- Import an adbkey.pub file to authorize ADB without prompt.
```
wadbd --backup <path>
```
- Backup authorized adb_keys
```
wadbd --restore <path>
```
- restore backed up adb_keys
```
wadbd --clear-keys
```
- Revokes all authorized Keys
