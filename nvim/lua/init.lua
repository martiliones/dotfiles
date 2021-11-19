local icons = require "nvim-nonicons"

vim.g.nvim_tree_icons = {
  default = icons.get("file"),
  folder = {
    default = icons.get("file-directory"),
    open = icons.get("file-directory-outline"),
    symlink = icons.get("file-directory"),
    symlink_open = icons.get("file-directory-outline"),
    empty = icons.get("file-directory-outline"),
    empty_open = icons.get("file-directory-outline"),
    arrow_open = '',
    arrow_closed = ''
  }
}

require'nvim-tree'.setup()

