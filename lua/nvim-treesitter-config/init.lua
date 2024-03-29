require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      "javascript",
      "php",
      "go",
      "gomod",
      "phpdoc",
      "vue",
      "ruby",
      "lua",
      "html",
      "json",
      "graphql"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  indent = {
      enable = true
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_set_hl(0, "@type.qualifier.php", { link = "GruvboxPurple" })
