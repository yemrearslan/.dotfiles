vim.cmd [[
try
    colorscheme iceberg
    "colorscheme dracula
    "colorscheme gruvbox
    "colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]
