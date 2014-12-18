function! test#testtracker#test_file(file) abort
  return a:file =~# '\.t$'
endfunction

function! test#testtracker#build_position(type, position) abort
  if a:type == 'file'
    return [a:position['file']]
  elseif a:type == 'nearest'
    return ['--git']
  else
    return ['-r']
  endif
endfunction

function! test#testtracker#build_args(args) abort
  return a:args
endfunction

function! test#testtracker#executable() abort
  return "genome-test-env test-tracker prove --lsf"
endfunction
