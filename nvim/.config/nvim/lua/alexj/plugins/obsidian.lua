return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },

   opts = {
  workspaces = {
    {
        name = "obsidian",
        path = os.getenv("OBSIDIAN_PATH"),
      },
  },

  new_notes_location = "09 - Temp/Draft",

  disable_frontmatter = true,

  templates = {
      subdir = "99 - Meta/00 - Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      substitutions = {
          formatted_date = function()
              local function get_day_suffix(day)
                  last_digit = day % 10
                  if (day >= 11 and day <= 13) then
                      return "th"
                  elseif last_digit == 1 then 
                      return "st"
                  elseif last_digit == 2 then 
                      return "nd"
                  elseif last_digit == 3 then 
                      return "rd"
                  else 
                      return "th"
                  end
              end
              day = tonumber(os.date("%d"))
              suffix = get_day_suffix(day)
              return os.date("%A, %B ") .. day .. suffix .. os.date(", %Y")
            end
      }
  },

  mappings = {
    ["li"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ["<leader>ti"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  ui = {
    checkboxes = { },
    bullets = {  },
  },
}
}
