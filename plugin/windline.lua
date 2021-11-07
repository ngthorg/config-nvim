require'wlsample.evil_line'

local windline = require'windline'
local b_components = require'windline.components.basic'

windline.add_component({
  name = 'filetype',
  text = b_components.cache_file_type({ icon = true }),
}, {
  filetype = 'default',
  ---- it will add a new component before git component
  ---- you can use and index number
  position = 'git',
  -- if you want to add on inactive component
  ---- kind ='inactive',
})

windline.remove_component({ name = 'lsp_name' })
