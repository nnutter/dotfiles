function! test#testtracker#test_file(file) abort
  return a:file =~# '\.t$'
endfunction

function! test#testtracker#build_position(type, position) abort
  if a:type == 'file'
    return [a:position['file']]
  elseif a:type == 'nearest'
    return ['--git']
  else
    let cdup = system('git rev-parse --show-cdup')
    return ['-r ' . cdup . 'lib/perl/Genome']
  endif
endfunction

function! test#testtracker#build_args(args) abort
  return a:args
endfunction

function! test#testtracker#executable() abort
  return 'genome-test-env test-tracker prove'
endfunction
