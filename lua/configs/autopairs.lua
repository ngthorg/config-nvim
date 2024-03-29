local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'

require('nvim-autopairs').setup {
  check_ts = true,
  map_c_h = true,
  map_c_w = true,
}

-- If you want insert `(` after select function or method item
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
-- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = 'racket'
