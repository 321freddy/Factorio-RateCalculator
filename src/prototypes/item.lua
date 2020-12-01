local data_util = require("__flib__.data-util")
local table = require("__flib__.table")

local constants = require("constants")

local selection_tool_base = {
  type = "selection-tool",
  icons = {
    {icon = data_util.black_image, icon_size = 1, scale = 64},
    {icon = "__RateCalculator__/graphics/selection-tool.png", icon_size = 32, mipmap_count = 2}
  },
  selection_mode = {"any-entity", "same-force"},
  alt_selection_mode = {"any-entity", "same-force"},
  stack_size = 1,
  flags = {"hidden", "only-in-cursor", "not-stackable"},
  draw_label_for_cursor_render = true
}

local selection_tools = {}

for mode, data in pairs(constants.selection_tools) do
  local tool = table.deep_copy(selection_tool_base)
  tool.name = "rcalc-"..mode.."-selection-tool"
  tool.selection_color = data.color
  tool.selection_cursor_box_type = data.selection_box
  tool.alt_selection_color = data.color
  tool.alt_selection_cursor_box_type = data.selection_box
  selection_tools[#selection_tools+1] = tool
end

data:extend(selection_tools)