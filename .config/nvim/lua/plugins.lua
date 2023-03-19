-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth=1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  --vim.cmd([[packadd packer.nvim]])
  vim.api.nvim_command('packadd packer.nvim')
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Could not initialize packer." , vim.log.levels.ERROR)
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- color schemes
  use({ "dikiaap/minimalist" })
  use({ "folke/tokyonight.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "andreasvc/vim-256noir" })
  use({ "KabbAmine/yowish.vim" })
  use({ "NLKNguyen/papercolor-theme" })

  -- file explorer
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config.nvimtree")
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- show buffers as tabs
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("config.bufferline")
      require("config.devicons")
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- custom statusbar
  -- TODO use glepnir/galaxyline.nvim instead?
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("config.lualine")
    end,
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- visual aid for indents
  -- TODO only for certain file types?
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.indent-blankline")
    end,
    -- ft = {}
  })

  -- Highlight color values in their respective color
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("config.colorizer")
		end,
		ft = {'css', 'javascript', 'json', 'lua', 'scss', 'ts', 'vim'}
	})
  
  -- Additional syntax files
  use({ "nickeb96/fish.vim" })

  -- auto completion
  use({ 
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-nvim-lsp",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "hrsh7th/cmp-nvim-lua",
      --"octahrshltree/cmp-look", 
      "hrsh7th/cmp-path", 
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell", 
      "hrsh7th/cmp-emoji",
    }
  })

  -- LSP
  use ({ "neovim/nvim-lspconfig" })


  if packer_bootstrap then
    print("Syncing after bootstrap ")
    packer.sync()
    packer.compile()
  end
end)

