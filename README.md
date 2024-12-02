# Zango-Bypass
A .dll patch to bypass the adware bundled with Zango Games

## The .DLLs and .EXEs are still flagged as malicious by most anti-virus software.<br /><br />Be sure to add them as exceptions ! 


# How To Use
- **Extract** the game *setup.exe* contents, or run the setup in a **VM/Sandbox** and transfer the game folder.<br />

   *!! Do NOT run the setup on your main machine, as it will install Zango components !!*

- [Download the corresponding bypass](https://github.com/RavenDS/Zango-Bypass/archive/refs/heads/main.zip), extract **"run-game.bat"** and **"zango" folder** to the game folder

- **Edit "run-game.bat"** with Notepad, and replace the line **"YOUR GAME EXECUTABLE.exe"**

- **Run "run-game.bat"** with elevated privileges **(Run as Admin)**
  
- If prompted to **"Reinstall components"**, click **Yes**. There will be an error and the game will launch. Enjoy !


# How It Works
- The .bat file writes some registry keys to make Zango believe it has been installed before, otherwise it would throw an error for missing components.

- In this situation, the game usually asks to *"Reinstall Zango components"*. If we click ***"no"***, the game closes. 

- If we click ***"yes"***, **zango.exe** is extracted from ZangoInstaller.dll/.exe and is immediately launched in the background **(isn't that sneaky?)**.

- By editing **ZangoInstaller**, we're able to **remove the zango.exe completely**. We won't end up with Zango.exe installing, launching at startup or regular pings to their domain (180solutions.com), because the file won't exist.

- **Last but not least, the included ZangoLib.dll has all references to their domain (180solutions.com) replaced by dummy data**
