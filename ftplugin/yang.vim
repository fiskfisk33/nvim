" Vim indent file
" Language:	Yang
" Would be simplest to just do cindent without having ':' be
" confused as a label
"
" Requires 'syntax/yang.vim' and the syntax sync mode to be 'failsafe', as
" with the following in .vimrc:
" autocmd FileType yang :syntax sync fromstart

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal nosmartindent
setlocal indentkeys=!^F,o,O,e,0}
setlocal indentexpr=GetYangIndent(v:lnum)

" Only define the function once.
if exists("*GetYangIndent")
  finish
endif

function MyEcho(arg)
  "echo a:arg
endfunction

function NestingDeltaForLine(dline_no)
  let dline = getline(a:dline_no)
  call MyEcho(dline)
  let midx = match(dline, '{\|}', 0)
  let deltas = 0

  while (midx != -1)
    call MyEcho(midx)
    let syntaxName = synIDattr(synID(a:dline_no, midx + 1, 1),"name")
    call MyEcho(syntaxName)
    if (syntaxName != "yangComment" && syntaxName != "yangString")
      let bracechar = matchstr(dline, '\%' . (midx + 1) . 'c.')
      call MyEcho(bracechar)
      if (bracechar == "{")
        let deltas += 1
      else
        let deltas -= 1
      endif
    endif
    let midx = match(dline, '{\|}', midx + 1)
  endwhile
  return deltas
endfunction


function GetYangIndent(lnum)
  if !exists("*synstack")
    return -1
  endif

  let linetext = getline(a:lnum)
  let pos = match(linetext, '\S')
  let lsyntax = synIDattr(synID(a:lnum,pos + 1,1),"name")

  " Find a non-blank, non-comment line above the current line.
  let prevlnum = prevnonblank(a:lnum - 1)
  while (prevlnum > 0)
    let prevline = getline(prevlnum)
    let firstnonblank = match(prevline, '\S')
    let psyntax = synIDattr(synID(prevlnum, firstnonblank + 1, 1), "name")
    if psyntax != "yangComment" && psyntax != "yangString"
      break
    endif
    let prevlnum = prevnonblank(prevlnum - 1)
  endwhile

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  if lsyntax == "yangString"
    call MyEcho("yangString at start of line")
    return cindent('.')
  endif
  if lsyntax == "yangComment"
    call MyEcho("yangComment at start of line")
    return cindent('.')
  endif


  " Previous line not starting with a comment or string serves as starting
  " point. Compare nesting level of that line with the nesting level of this
  " line.
  let ind = indent(prevlnum)
  call MyEcho("previous indent : " . ind)


  let nesting_delta = 0
  let midx = match(prevline, '^\s*}')
  if midx != -1
    let syntaxName = synIDattr(synID(prevlnum, midx + 1, 1),"name")
    if syntaxName != "yangComment" && syntaxName != "yangString"
      let nesting_delta = 1
    endif
  endif

  while (prevlnum < a:lnum)
    let nesting_delta += NestingDeltaForLine(prevlnum)
    let prevlnum += 1
  endwhile

  call MyEcho("nesting_delta = " . nesting_delta)

  let ind = ind + (nesting_delta * &shiftwidth)

  call MyEcho("ind = " . ind)

  " Subtract a 'shiftwidth' on '}'
  let midx = match(linetext, '^\s*}')
  let syntaxName = synIDattr(synID(a:lnum, midx + 1, 1), "name")
  if midx != -1 &&  syntaxName != "yangComment" && syntaxName != "yangString"
"    echo "line starts with } and is not in a comment"
    let ind = ind - &shiftwidth
  endif

  call MyEcho "ind :" . ind

  return ind
endfunction

" vi: sw=2 et
