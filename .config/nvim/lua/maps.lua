local key = vim.keymap

-- Quit
key.set('n', 'q', '<CMD>q<CR>')

-- Save
key.set('n', 'w', '<CMD>update<CR>')

-- Exit insert mode
key.set('i', 'jk', '<ESC>')

-- NeoTree
key.set('n', '<C-f>f', '<CMD>NeoTreeFocus<CR>')
key.set('n', '<C-f>l', '<CMD>NeoTreeFloat<CR>')

-- terminal
key.set('n', 'th', '<CMD>ToggleTerm size=10<CR>')

-- telescope
key.set('n', 'tl', '<CMD>Telescope find_files<CR>')

