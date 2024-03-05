-- Lightlineの設定
vim.g.lightline = {
  colorscheme = 'tokyonight',
  tabline = {
    left = { {'buffers'} }
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  }
}

-- Vim script 関数を定義して、パレットを設定する
vim.api.nvim_exec([[
function! SetupLightlineColors()
  let palette = lightline#palette()
  let palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let palette.inactive.middle = palette.normal.middle
  call lightline#colorscheme()
endfunction
]], false)

-- VimEnter イベントでこの関数を呼び出す
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = '*',
  callback = function()
    vim.cmd('call SetupLightlineColors()')
  end
})


return {
    'itchyny/lightline.vim'
}
