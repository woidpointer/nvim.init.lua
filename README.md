# nvim.init.lua

My personal init.lua for nvim, optimized for C++ development using python and
and ruby as scripting languages.

This configuration is heavily inspired by

[neovim from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=706s)
and
(nvim kickstart)[https://github.com/nvim-lua/kickstart.nvim]

The configuration is extended for C++/Ruby/Python development use cases and the
support of cmake environments for that purpose.

## Installation on Linux

* Create a directory in the users ```.config``` folder.
    ```
    mkdir -p ~/.config/nvim
    ```
* Copy the init.lua to the previously created config directory
    ```
    cp init.lua  ~/.config/nvim
    ```
* Install a nvim version greater than 0.8.0
* Start nvim the first time => Packages will be installed
* Start nvim the second time => nvim is in a good working state but finished
    installation of needed packages.


Dependencies for the Linux installation to work like a breeze:
* clang-tidy (static code analysis)
* clang-format (c++ formatting)
* cmake-format (cmake formatting)
* npm (needed to install pyright by Mason)


## Installation on Windows

* Create a home folder for the nvim configuration and copy the init.lua into
    that directory:
    C:\Users\<username>\AppData\Local\nvim
* Open nvim the first time

This nvim configuration uses the nvim-web-devicons which can't displayed well
in the normal windows standard installation.

* Execute the following powershell script https://github.com/ryanoasis/vim-devicons/files/4287085/patchedfonts.zip
* Open the Visual Studio Developer Commando Prompt and open the nvim.exe
    located in the neovim installation folder.


## Development of init.lua

The init.lua is usually developed within a docker container because this the intended
target environment and to avoid influences of the work in progress for my private
development.

In this case the workflow is somehow semi automated to get a initial clean
nvim environment. To use the automation the used dev container must support
rake.

```console

git clone https://github.com/woidpointer/nvim.init.lua.git

# Start the docker container and map the repository locally:
docker run -it --rm -v $PWD:$PWD -w $PWD <dev-container> /bin/bash

cd nvim.init.lua

rake dev:clean
rake dev:all

```

This commands creates a symbolic link of the init.lua file of the container
with the one in the repository.
