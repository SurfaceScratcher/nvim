-- ~/.config/nvim/lsp/openscad_ls.lua
-- ~/.config/nvim/lsp/openscad_ls.lua
return {
  cmd = { "openscad-language-server" },
  filetypes = { "openscad" },

  -- einfach: benutze root_markers statt eigener root_dir-Funktion
  root_markers = { ".git" },

  single_file_support = true,
}
