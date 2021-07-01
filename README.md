[![xplr-dragon.gif](https://s6.gifyu.com/images/xplr-dragon.gif)](https://gifyu.com/image/A8N1)

Drag and drop files using [dragon](https://github.com/mwh/dragon).


Requirements
------------

- [dragon](https://github.com/mwh/dragon)
- [curl](https://github.com/curl/curl)


Installation
------------

### Install manually

- Add the following line in `~/.config/xplr/init.lua`

  ```lua
  package.path = os.getenv("HOME") .. '/.config/xplr/plugins/?/src/init.lua'
  ```

- Clone the plugin

  ```bash
  mkdir -p ~/.config/xplr/plugins

  git clone https://github.com/sayanarijit/dragon.xplr ~/.config/xplr/plugins/dragon
  ```

- Require the module in `~/.config/xplr/init.lua`

  ```lua
  require("dragon").setup()
  
  -- Or
  
  require("dragon").setup{
    mode = "selection_ops",
    key = "D",
    drag_args = "",
    drop_args = "",
    keep_selection = false,
  }

  -- Select files and type `:sD` to drag
  -- Type `:sD` without selecting anything to drop
  ```
