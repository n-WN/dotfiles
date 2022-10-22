vim.opt.runtimepath:append("/some/path/to/store/parsers")

if(vim.bo.filetype=="cpp") then
		vim.cmd("FloatermNew --autoclose=0 --position=bottomright g++ -g3 -std=c++2a -Wall %:p -o %:p:h/%:r && %:p:h/%:r && rm -f %:p:h/%:r")
	
function M.down()
    local timer = vim.loop.new_timer()
    local stop = false
    local sleep = 5000
    timer:start(1000, sleep, vim.schedule_wrap(function()
      local scroll_down = vim.api.nvim_replace_termcodes('normal <C-E>', true, true, true)
      vim.cmd(scroll_down)

      if stop then
        timer:close()
      end
    end))
end

if(vim.bo.filetype=="cpp") then
	vim.cmd("FloatermNew --autoclose=0 --position=bottomright g++ -g3 -std=c++2a -Wall %:p -o %:p:h/%:r && %:p:h/%:r && rm -f %:p:h/%:r")
