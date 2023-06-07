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

    Dir.chdir('/tmp') do
      cmd = ['wget -qO-']
      cmd << 'https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz'
      cmd << '|'
      cmd << "tar xvz --directory #{ENV['HOME']}/.local" # store to different location
      cmd << '--strip-components=1 ' # but remove the nvim-linux64 folder name

      sh cmd.join(' ')
    end
    #sh "sudo dpkg -i #{pwd}/nvim-linux64.deb"
  end

  task :setup do
    sh "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
    sh "nvim --headless -c 'MasonInstall stylua lua-language-server rust-analyzer clangd solargraph pyright rubocop' -c qall"
  end

  task all: %i[packer slink install setup]
end
