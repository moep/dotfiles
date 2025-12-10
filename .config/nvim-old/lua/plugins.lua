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
  vim.notify("Could not initialize packer.", vim.log.levels.ERROR)
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
  use({ "Th3Whit3Wolf/onebuddy" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
  })

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
  --use {
  --  'nvim-lualine/lualine.nvim',
  --  config = function()
  --    require("config.lualine")
  --  end,
  --  requires = { 'kyazdani42/nvim-web-devicons' }
  --}

  -- unmaintained
  --use({ "feline-nvim/feline.nvim" })
  use({ "famiu/feline.nvim" })

  -- visual aid for indents
  -- TODO only for certain file types?
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      --require("config.indent-blankline")
      require("ibl").setup()
    end,
    -- ft = {}
  })

  -- Highlight color values in their respective color
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.colorizer")
    end,
  })

  -- Additional syntax files
  use({ "nickeb96/fish.vim" })

  -- auto completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-emoji",
    },
    config = function()
      require("config.cmp")
    end
  })

  -- Luasnip
  use({ "saadparwaiz1/cmp_luasnip" })
  use({
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    config = function()
      require("config.snippets")
    end
  })

  -- Parameter completion
  use({ "ray-x/lsp_signature.nvim" })

  -- LSP
  use({ "neovim/nvim-lspconfig" })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  })
  use({ "gbrlsnchs/telescope-lsp-handlers.nvim" })

  -- Outline
  use({ "simrat39/symbols-outline.nvim" })

  -- LSP error list
  use({ "folke/trouble.nvim" })


  if packer_bootstrap then
    print("Syncing after bootstrap ")
    packer.sync()
    packer.compile()
  end
end)
