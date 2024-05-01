require("tokyonight").setup({
  transparent = true,
  style = "moon",
})

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#737aa2' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#ff9e64', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#737aa2' })
end

vim.cmd.colorscheme "tokyonight"
LineNumberColors()
