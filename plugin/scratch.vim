if exists('g:loaded_scratch')
    finish
endif
let g:loaded_scratch = 1

let g:scratchbuf_no = 1

function! ScratchEdit(cmd)
    exe a:cmd '[Scratch' . g:scratchbuf_no . ']'
    let g:scratchbuf_no += 1
    Scratchify
endfunction

command! Scratchify setlocal buflisted noswapfile buftype=nofile bufhidden=hide

command! -bar -nargs=* Scratch call ScratchEdit('edit')
command! -bar -nargs=* Scratchs call ScratchEdit('split')
command! -bar -nargs=* Scratchv call ScratchEdit('vsplit')
command! -bar -nargs=* Scratcht call ScratchEdit('tabe')
