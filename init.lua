require("core.keymaps")
require("core.plugins")
require("core.plugin_config")


vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- show enter and tab as symbols
vim.o.list = true
vim.o.listchars = "tab:▸ ,eol:¬"

-- make tab act like 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- make line not wrap
vim.o.wrap = false
--
--

function toggle_todo()
  local line = vim.fn.getline('.')
  if line:match('^%[ %]') then
    -- Remove existing todo item
    local new_line = line:gsub('^%[ %]', '%[X%]')
    vim.fn.setline('.', new_line)
  elseif line:match('^%[X%]') then
	  -- make it undone
	local new_line = line:gsub('^%[X%]', '%[ %]')
 	vim.fn.setline('.', new_line)
  else
    -- Add todo item
    local new_line = '[ ] ' .. line
    vim.fn.setline('.', new_line)
  end
end

function delete_todo()
	local line = vim.fn.getline('.')
	if line:match('^%[X%]') then
		local new_line = line:gsub('^%[X%] ', '')
		vim.fn.setline('.', new_line)
	elseif line:match('^%[ %]') then
		local new_line = line:gsub('^%[ %] ', '')
		vim.fn.setline('.', new_line)
	end
end

function open_todo()
	local todo_file = vim.env.HOME .. '/.todo'
	vim.cmd('edit ' .. todo_file)
end


vim.api.nvim_set_keymap('n', '<leader>tt', ':lua open_todo()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>T', ':lua delete_todo()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':lua toggle_todo()<CR>', {noremap = true})
