return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'nvim-treesitter.configs',
  opts = {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'bash', 'css', 'html', 'go', 'lua', 'rust', 'sql', 'typescript', 'javascript', 'vim', 'regex', 'markdown', 'markdown_inline', 'c_sharp', 'vue', 'powershell' },

    -- Autoinstall languages that are not installed
    auto_install = false,

    ignore_install = {},
    modules = {},
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'markdown' },
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['i?'] = '@conditional.inner',
          ['a?'] = '@conditional.outer',
          ['il'] = '@loop.inner',
          ['al'] = '@loop.outer',
          ['a/'] = '@comment.outer',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
          [']?'] = '@conditional.outer',
          [']l'] = '@loop.outer',
          [']/'] = '@comment.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
          [']L'] = '@loop.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[?'] = '@conditional.outer',
          ['[l'] = '@loop.outer',
          ['[/'] = '@comment.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[L'] = '@loop.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
}
