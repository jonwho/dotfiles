-- use rspec binstub per project
vim.g.rspec_command = "!bin/rspec {spec}"

vim.cmd([[
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
]])
