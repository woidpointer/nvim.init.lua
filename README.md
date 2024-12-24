# nvim.init.lua

```shell
 nvim --headless "+MasonToolsInstallSync" +qa
```

My personal init.lua for nvim, optimized for C++ development using python and
and ruby as scripting languages.

This configuration is heavily inspired by

- [neovim from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=706s)
- [nvim kickstart](https://github.com/nvim-lua/kickstart.nvim)

The configuration is extended for C++/Ruby/Python development use cases and the
support of cmake environments for that purpose.

## Installation on Linux

- Create a directory in the users `.config` folder.

  ```shell
  mkdir -p ~/.config/nvim
  ```

- Copy the init.lua to the previously created config directory

  ```shell
  cp init.lua  ~/.config/nvim
  ```

- Install a nvim version greater than 0.8.0
- Start nvim the first time => Packages will be installed
- Start nvim the second time => nvim is in a good working state but finished
  installation of needed packages.

Dependencies for the Linux installation to work like a breeze:

- sudo apt install python3-venv gettext

### Install Nerdfonts

```shell
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
fc-cache ~/.local/share/fonts
```

In Gnome Terminal: Preferences -> \<your profile\> -> select DroidSansM Nerd
Font Regular

## Installation on Windows

- Create a home folder for the nvim configuration and copy the init.lua into
  that directory:

  `C:\Users\<username>\AppData\Local\nvim`

- Open nvim the first time

This nvim configuration uses the nvim-web-devicons which can't displayed well
in the windows default installation.

- Execute the following powershell script [](https://github.com/ryanoasis/vim-devicons/files/4287085/patchedfonts.zip)
- Open the Visual Studio Developer Commando Prompt and open the nvim.exe
  located in the neovim installation folder.

## Development of init.lua

In order to extend or further develop init.lua, a Docker container is usually
used, since this also represents the intended target environment and thus the
further development can take place independently of ongoing developments.

```console

git clone https://github.com/woidpointer/nvim.init.lua.git

# Start the docker container and map the repository locally:
docker run -it --rm -v $PWD:$PWD -w $PWD <dev-container> /bin/bash

cd nvim.init.lua

rake dev:clean
rake dev:all
```
