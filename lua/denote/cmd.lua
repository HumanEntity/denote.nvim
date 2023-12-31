local M = {
	commands = { "note", "search" },
}
local api = require("denote.api")

function M.load_cmd()
	vim.api.nvim_create_user_command("Denote", function(opts)
		if opts.fargs[1] == "note" then
			api.note()
		elseif opts.fargs[1] == "search" then
			api.search()
		else
			error("Unsupported operation " .. opts.fargs[1])
		end
	end, {
		nargs = 1,
		complete = function()
			return { "note", "search" }
		end,
	})
end

return M
