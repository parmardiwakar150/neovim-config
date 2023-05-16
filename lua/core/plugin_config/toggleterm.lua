require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 100,
    height = 20,
    winblend = 3,
    zindex = 1000,
  },
}
