let g:todo_search_keywords=[' TODO',' FIXME',' BUG',' REPAIR',' HACK',' XXX']
 " TODO
 " todo el que lo note 
function! Concat2(...)
  let l:list=a:1
  let s:kindex='/'
  for fixindex in list
    if fixindex==list[0]
      let s:kindex=s:kindex.fixindex
    elseif fixindex==list[-1]
      let s:kindex=s:kindex.'\|'.fixindex.'/'
      " echo s:kindex
    else
      let s:kindex=s:kindex.'\|'.fixindex
    endif
    " echo s:kindex
  endfor
endfunction

function! s:Concat1()
  let s:kindex='/'
  for fixindex in g:fixme_list_search
    if fixindex==g:fixme_list_search[0]
      let s:kindex=s:kindex.fixindex
    elseif fixindex==g:fixme_list_search[-1]
      let s:kindex=s:kindex.'\|'.fixindex.'/'
      echo s:kindex
    else
      let s:kindex=s:kindex.'\|'.fixindex
    endif
    " echo s:kindex
  endfor
endfunction

function! FixmeFilename()
  if exists("g:fixme_list_search")
    exec ':call Concat2(g:todo_search_keywords)'
    exec ':vimgrep '.s:kindex.'j % | cw'
  else
    vimgrep / TODO\|FIXME\|BUG\|REPAIR\|XXX\|HACK\|NOTE\|WARNING\|WARN/j % | cw
  endif
endfunction

function! FixmeFilepath()
  cd %:p:h
  if exists("g:fixme_list_search")
    exec ':call Concat2(g:todo_search_keywords)'
    exec ':vimgrep '.s:kindex.'j ** | cw'
  else
    vimgrep / TODO\|FIXME\|BUG\|REPAIR\|XXX\|HACK\|NOTE\|WARNING\|WARN/j ** | cw
  endif
  cd -
endfunction
