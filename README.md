

# The Long Story

[https://www.youtube.com/watch?v=w7i4amO_zaE&t=706s](neovim from scratch)


# Quickstart

This is wrong


## Plugin Manager

https://github.com/wbthomason/packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

# CheatSheet

```
:PackerSync
```

```
docker run -it --rm -v $PWD:/home/cma/.config/nvim -w /home/cma/.config/nvim cmatest

# C++ example
docker run -it --rm -v $PWD:$PWD -v /home/cmarchl/develop/github/nvim.init.lua:/home/cma/.config/nvim -w $PWD cmatest
```

```
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

```

hello
world
dere
woid

