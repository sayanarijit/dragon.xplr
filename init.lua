local function setup(args)
  local xplr = xplr

  if args == nil then
    args = {}
  end

  if args.path == nil then
    args.path = "dragon"
  end

  if args.mode == nil then
    args.mode = "selection_ops"
  end

  if args.key == nil then
    args.key = "D"
  end

  if args.keep_selection == nil then
    args.keep_selection = false
  end

  if args.drag_args == nil then
    args.drag_args = ""
  end

  if args.drop_args == nil then
    args.drop_args = ""
  end

  xplr.fn.custom.dragon_drag_n_drop = function(app)
    local files = {}
    local count = 0
    local cmd = nil

    for i, node in ipairs(app.selection) do
      table.insert(files, node.absolute_path)
      count = i
    end

    if count == 0 then
      cmd = "(" .. args.path .. " --target " .. args.drop_args .. " 2> /dev/null | xargs -rl curl -sLO) &\ntrue"
    elseif count == 1 then
      cmd = args.path .. " --and-exit " .. args.drag_args .. " '" .. files[1] .. "' > /dev/null 2>&1 &\ntrue"
    else
      cmd = args.path .. " " .. args.drag_args .. " '" .. table.concat(files, "' '") .. "' > /dev/null 2>&1 &\ntrue"
    end

    os.execute(cmd)

    if not args.keep_selection then
      return { "ClearSelection" }
    end
  end

  xplr.config.modes.builtin[args.mode].key_bindings.on_key[args.key] = {
    help = "drag & drop",
    messages = {
      { CallLuaSilently = "custom.dragon_drag_n_drop" },
      "PopMode",
    },
  }
end

return { setup = setup }
