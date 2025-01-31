# myplugin
## Directory Description/Purpose
- **plugin folder:**  Files here run automatically when Neovim starts, useful for global settings like keymaps or autocommands.
- **lua folder:** Files here (typically within a subfolder named after your plugin) only run when the user explicitly requires the plugin using `require()`.  This is the standard place for most plugin logic.

## Installation from local dir using nvim.lazy
```lua
return {
  dir = '~/REPLACE_ME_WITH_CORRECT_DIR/myplugin',
  name = 'myplugin',
  config = function()
    require('myplugin').setup() -- This line loads the plugin, and then calls the method setup() (this can be any method you define in your plugin) 
    -- Same can be broken down into two lines as below
    -- local myplugin = require('myplugin')
    -- myplugin.setup()
    -- You can also call other methods here, or do any other setup required
  end,
}
```

## Installation from githug using nvim.lazy
```lua
return {
  username/myplugin',
  name = 'myplugin',
  config = function()
    require('myplugin').setup()
  end,
}
```
