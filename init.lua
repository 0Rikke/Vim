-- ~/.config/nvim/init.lua

-- Instalar o packer.nvim (gerenciador de plugins)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Carregar o packer.nvim
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- NvimTree (file explorer)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- ícones opcionais
    },
    config = function()
      require("nvim-tree").setup()
    end
  }
end)

-- Atalho para abrir/fechar o NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
