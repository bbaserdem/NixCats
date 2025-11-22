-------------------------------------------------
-- Markdown files behavior
-------------------------------------------------
-- Enable auto save when leaving buffer (due to navigation or other stuff)
-- Doesn't work, global option
-- vim.bo.autowriteall = true

-- F4 renders us in Glow, Shift-F4 toggles markdown rendering
vim.keymap.set("n", "<F4>", "<cmd>Glow<CR>", { desc = "Render markdown in window", buffer = true })
vim.keymap.set("n", "<F16>", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "Render markdown in page", buffer = true })

-- F7 renders equation, shift-F7 renders all equations
vim.keymap.set("n", "<F7>", require("nabla").popup, { desc = "render   eqn.", buffer = true })
vim.keymap.set("n", "<f19>", require("nabla").toggle_virt, { desc = "Render all   eqn.", buffer = true })
