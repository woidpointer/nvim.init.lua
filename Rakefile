# frozen_string_literal: true

namespace :dev do
  task :clean do
    nvim_c = "#{ENV['HOME']}/.local/share/nvim"
    nvim_home = "#{ENV['HOME']}/.config/nvim"

    rm_rf nvim_c
    rm_rf nvim_home
    mkdir_p nvim_home
  end

  task :nvchad do
    sh 'git clone --depth 1 https://github.com/NvChad/NvChad ~/.config/nvim'
  end

  task :slink do
    sh "ln -s #{pwd}/custom/ #{ENV['HOME']}/.config/nvim/lua/"
  end

  task :install do
    rm_rf '/tmp/neovim-stable'

    Dir.chdir('/tmp') do
      cmd = ['wget']
      cmd << 'https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz'
      sh cmd.join(' ')
      sh 'tar xf stable.tar.gz'

      Dir.chdir('neovim-stable') do
        sh 'sudo make CMAKE_BUILD_TYPE=RelWithDebInfo install'
      end
    end
  end

  task setup: [:go] do
    sh 'nvim --headless "+Lazy! sync" +qa'
  end

  task all: %i[install nvchad slink setup]

  task elop: %i[nvchad slink setup]

  task :go do
    sh 'go install golang.org/x/tools/gopls@latest'
    sh 'go install github.com/koron/iferr@latest'
    sh 'go install github.com/segmentio/golines@latest'
    sh 'go install github.com/fatih/gomodifytags@latest'
    sh 'go install github.com/josharian/impl@latest'
    sh 'go install github.com/incu6us/goimports-reviser@latest'
    sh 'go install github.com/cweill/gotests/gotests@latest'
    sh 'pip3 install pyright'
    sh 'sudo npm install -g prettier'
  end
end
