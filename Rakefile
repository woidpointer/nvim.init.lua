# frozen_string_literal: true

namespace :dev do
  task :clean do
    nvim_c = "#{ENV['HOME']}/.local/share/nvim"
    nvim_home = "#{ENV['HOME']}/.config/nvim"

    rm_rf nvim_c
    rm_rf nvim_home
    mkdir_p nvim_home
  end

  task :packer do
    sh 'git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
  end

  task :slink do
    cmd = "ln -s #{pwd}/init.lua #{ENV['HOME']}/.config/nvim"
    sh cmd
  end

  task :install do
    rm_f "#{pwd}/nvim-linux64.deb"
    sh 'wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb'
    sh "sudo dpkg -i #{pwd}/nvim-linux64.deb"
  end

  task :setup do
    sh "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
    sh "nvim --headless -c 'MasonInstall stylua lua-language-server rust-analyzer clangd solargraph pyright rubocop' -c qall"
  end

  task all: %i[packer slink install setup]
end
