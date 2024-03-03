local options = {
    encoding = 'utf-8',
    whichwrap = 'b,s,h,l,<,>,[,],~',
    clipboard = 'unnamed',
    number = true,
    backup = false,
    showcmd = true,
    relativenumber = true,
    cursorline = true,
    expandtab = true,
    tabstop = 2,
    shiftwidth = 4,
    autoindent = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    wrapscan = true,
    signcolumn = 'yes',
    background = 'dark',
    updatetime = 300,
    timeoutlen = 300,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
