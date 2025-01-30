#!/bin/bash

# Set the plugin name
read -p "Enter the plugin name: " plugin_name

# Create the plugin directory
mkdir -p "$plugin_name"
mkdir -p "$plugin_name/lua/$plugin_name"
mkdir -p "$plugin_name/plugin"
touch "$plugin_name/plugin/.gitkeep"

# Create the init.lua file
cat <<EOF >"$plugin_name/lua/$plugin_name/init.lua"
-- lua/$plugin_name/init.lua
local M = {}

M.setup = function()
  -- Your plugin code here
  print("Setup ran successfully")
end

return M
EOF

# Create a README.md file
cat <<EOF >"$plugin_name/README.md"
# $plugin_name
## Directory Description/Purpose
- **plugin folder:**  Files here run automatically when Neovim starts, useful for global settings like keymaps or autocommands.
- **lua folder:** Files here (typically within a subfolder named after your plugin) only run when the user explicitly requires the plugin using \`require()\`.  This is the standard place for most plugin logic.

## Installation from local dir using nvim.lazy
\`\`\`lua
return {
  dir = '~/REPLACE_ME_WITH_CORRECT_DIR/aitest',
  name = 'aitest',
  config = function()
    require('aitest').setup() -- This line loads the plugin, and then calls the method setup() (this can be any method you define in your plugin) 
    -- Same can be broken down into two lines as below
    -- local aitest = require('aitest')
    -- aitest.setup()
    -- You can also call other methods here, or do any other setup required
  end,
}
\`\`\`

## Installation from githug using nvim.lazy
\`\`\`lua
return {
  username/aitest',
  name = 'aitest',
  config = function()
    require('aitest').setup()
  end,
}
\`\`\`
EOF

echo "Plugin '$plugin_name' created successfully!"
